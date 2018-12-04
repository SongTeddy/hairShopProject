package member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hairShop.bean.HairShopDTO;
import hairShop.bean.ReservationDTO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/managementPage")
public class ManageController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private DesignerDTO designerDTO;
	@Autowired
	private ReservationDTO reservationDTO;

// 페이지 이동
	
	// 관리페이지 (개인, 사업자 구분)
	@RequestMapping(value="managementPage", method=RequestMethod.POST)
	public @ResponseBody String managementPages(@RequestParam String memEmail) {
		return memberDAO.getMemberType(memEmail);
	}
	
	// 사업자 페이지 이동 = 예약현황 메뉴
	@RequestMapping(value="companyPage", method=RequestMethod.GET)
	public ModelAndView companyPage(HttpSession session) {
		
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/totalReservation.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 디자이너 관리 메뉴 이동
	@RequestMapping(value="designerMenu", method=RequestMethod.GET)
	public ModelAndView designerMenu(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/designerMenu.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}

// 예약 현황
	
	// 예약 현황 조회
	
	@RequestMapping(value="getTotalReservation", method=RequestMethod.POST)
	public @ResponseBody String getTotalReservation(@RequestParam String hairshopId) {
		return memberDAO.getTotalReservation(hairshopId);
	}
	
	// 총 예약 매출 조회
	@RequestMapping(value="getTotalReservePrice", method=RequestMethod.POST)
	public @ResponseBody String getTotalReservePrice(@RequestParam String hairshopId) {
		List<String> list = memberDAO.getTotalReservePrice(hairshopId);
		
		int totalPrice = 0;

		for(int i=0; i<list.size(); i++) {
			totalPrice += Integer.parseInt(list.get(i));
		} 
		
		return String.format("%,d", totalPrice);
	}
	
	// 헤어샵의 디자이너 이름 구하기
	@RequestMapping(value="getHairShopDesigner", method=RequestMethod.POST)
	public ModelAndView getHairShopDesigner(@RequestParam String hairshopId) {
		List<String> list = memberDAO.getHairShopDesigner(hairshopId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 오늘 년, 월, 일 구하기
	@RequestMapping(value="reserveCalender", method=RequestMethod.POST)
	public ModelAndView reserveCalender() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Calendar c = Calendar.getInstance();
		
		List<String> list = new ArrayList<String>();
		for(int i=0; i<7; i++) {
			String year = Integer.toString(c.get(c.YEAR));
			String month = Integer.toString(c.get(c.MONTH)+1);
			String date = Integer.toString(c.get(c.DATE));
			
			list.add(year);
			list.add(month);
			list.add(date);
			
			c.add(Calendar.DATE, 1); // 하루 증가
		} // 년,월,일을 7일치 추가해줌
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// memberInfo(헤어샵 정보) 얻기
	@RequestMapping(value="getMemberInfo", method=RequestMethod.POST)
	public ModelAndView getMemberInfo(@RequestParam String hairshopId) {
		List<MemberDTO> list = memberDAO.getMemberInfo(hairshopId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 디자이너 예약 얻기
	@RequestMapping(value="getReserveTime", method=RequestMethod.POST)
	public ModelAndView getReserveTime(@RequestParam String designername,
									   @RequestParam int cnt) {
		
		// DB
		List<ReservationDTO> list = memberDAO.getReservation(designername); // 한명의 예약 정보 리스트
		
		// 리스트 생성
		List<String> requiredTimeList = new ArrayList<String>(); // 요구시간 리스트
		List<String> bookerNameList = new ArrayList<String>(); // 예약자 이름 리스트
		List<String> serviceList = new ArrayList<String>(); // 시술명 리스트
		
		for(ReservationDTO reservationDTO : list) {
			requiredTimeList.add(Integer.toString(reservationDTO.getTimerequired()));
			bookerNameList.add(reservationDTO.getBookername());
			serviceList.add(reservationDTO.getService());
		}
		
		// 시작시간 리스트, td클래스 리스르 생성
		List<String> startList = new ArrayList<String>(); // 시작시간 리스트
		List<String> endList = new ArrayList<String>(); // 종료시간 리스트
		List<String> tdClassList = new ArrayList<String>(); // td의 클래스들이 담긴 리스트
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd");
		
		for(int i=0; i<list.size(); i++) {
			startList.add(sdf.format(list.get(i).getStarttime())); // 각 예약날의 시:분을 리스트에 추가 
			endList.add(sdf.format(list.get(i).getEndtime())); // 각 예약날의 시:분을 리스트에 추가
		}
		
		for(int i=0; i<list.size(); i++) { // 예약이 더이상 없으면 break;
			Calendar c = Calendar.getInstance(); // 한 예약이 끝나면 캘린더 오늘날짜로 초기화
			
			// String으로 하면 01처럼 앞에 0이 붙어서 비교가 힘들어서 int로 형변환
			int ReserveDay = Integer.parseInt(sdf2.format(list.get(i).getStarttime()));// 예약날의 일
			
			while(true) {
				
				// 오늘의 일과 예약날의 일이 같아지면 break
				if(ReserveDay==c.get(c.DATE)) { // 아래에 두면 한달을 더 돌아버림
					break;
				}
				cnt++;
				
				c.add(Calendar.DATE, 1);
			}
			tdClassList.add(Integer.toString(cnt)); // cnt가 시작시간이 표시 될 td의 클래스가 됌
			
			cnt=1;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("startList", startList);
		mav.addObject("endList", startList);
		mav.addObject("tdClassList", tdClassList);
		mav.addObject("requiredTimeList", requiredTimeList);
		mav.addObject("bookerNameList", bookerNameList);
		mav.addObject("serviceList", serviceList);
		mav.setViewName("jsonView");
		
		return mav;
	}

// 디자이너 메뉴
	
	// 디자이너 정보
	
	@RequestMapping(value="getDesignerInfo", method=RequestMethod.POST)
	public ModelAndView getDesignerInfo(@RequestParam String hairshopId) {
		List<DesignerDTO> list = memberDAO.getDesignerInfo(hairshopId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 디자이너 추가
	@RequestMapping(value="designerAdd", method=RequestMethod.POST)
	public @ResponseBody void designerAdd(@ModelAttribute DesignerDTO designerDTO) {
		if((designerDTO.getPosition()).equals("원장"))
			designerDTO.setPositioncode(1);
		else if((designerDTO.getPosition()).equals("실장"))
			designerDTO.setPositioncode(2);
		else if((designerDTO.getPosition()).equals("디자이너"))
			designerDTO.setPositioncode(4);
		
		memberDAO.designerAdd(designerDTO);
	}
	
	// 디자이너 삭제
	@RequestMapping(value="designerDelete", method=RequestMethod.POST)
	public @ResponseBody void designerDelete(@RequestParam String seq) {
		memberDAO.designerDelete(seq);
	}
	
	// 선택된 디자이너 삭제
	@RequestMapping(value="designerCheckedDelete", method=RequestMethod.POST)
	public @ResponseBody void designerCheckedDelete(@RequestParam(value="ar[]") List<String> arr) {
		List<Integer> list = new ArrayList<Integer>();
		
		for(String data : arr)
			list.add(Integer.parseInt(data));
		
		// DB
		memberDAO.designerCheckedDelete(list);
	}
	
	// 디자이너 수정
	@RequestMapping(value="designerModify", method=RequestMethod.POST)
	public @ResponseBody void designerModify(@ModelAttribute DesignerDTO designerDTO) {		
		if((designerDTO.getPosition()).equals("원장"))
			designerDTO.setPositioncode(1);
		else if((designerDTO.getPosition()).equals("실장"))
			designerDTO.setPositioncode(2);
		else if((designerDTO.getPosition()).equals("디자이너"))
			designerDTO.setPositioncode(4);
		
		memberDAO.designerModify(designerDTO);
	}
	
	// 헤어샵 정보 등록 페이지
	@RequestMapping(value="hairShopInfoInput", method=RequestMethod.GET)
	public ModelAndView hairShopInfoInput(HttpSession session) {
		System.out.println("헤어샵 정보 등록 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("memEmail")!=null) {
			Map<String, String> map = memberDAO.getHairShopInfo((String)session.getAttribute("memEmail"));
			mav.addObject("map", map);
			mav.addObject("display", "/managementPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/hairShopInfoInput.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="getHairShopInfo", method=RequestMethod.POST)
	public ModelAndView getHairShopInfo(HttpSession session) {
		Map<String, String> map = memberDAO.getHairShopInfo((String)session.getAttribute("memEmail"));
		System.out.println("링크 있니 ? hairShopId"  + "   " + map.get("HAIRSHOPID") + "   " + map.get("NAME"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="checkId.do")
	public @ResponseBody String checkId(@RequestParam String hairShopId) {
		System.out.println("아이디 찾으려구용" + hairShopId);
		if(memberDAO.isExistId(hairShopId))
			return "exist";
		else
			return "not_exist";
	}
	
	@RequestMapping(value="checkLicense.do")
	public @ResponseBody String checkLicense(@RequestParam Map<String, String> map) {
		System.out.println("라이센스 찾으려구용" + map);
		if(memberDAO.isExistLicense(map))
			return "exist";
		else
			return "not_exist";
	}
	
	
	@RequestMapping(value="hairShopInfoUpdate", method=RequestMethod.POST)
	public ModelAndView hairShopInfoUpdate(HttpSession session,
			@RequestParam("imageUpload[]") List<MultipartFile> imageUpload,
			@RequestParam String hairShopId,
			@RequestParam String name,
			@RequestParam String license1,
			@RequestParam String license2,
			@RequestParam String license3,
			@RequestParam String addr1,
			@RequestParam String addr2,
			@RequestParam String zipcode,
			@RequestParam String tel1,
			@RequestParam String tel2,
			@RequestParam String tel3,
			@RequestParam String hairShopContent,
			@RequestParam String dayoff,
			@RequestParam String openTime,
			@RequestParam String closeTime) {
		System.out.println("hairShopInfoUpdate 컨트롤러    " + imageUpload.size() + "이미지 리스트 사이즈"  + imageUpload.get(0));
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", (String)session.getAttribute("memEmail"));
		map.put("name", name);
		map.put("hairShopId", hairShopId);
		map.put("license1", license1);
		map.put("license2", license2);
		map.put("license3", license3);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("zipcode", zipcode);
		map.put("tel1", tel1);
		map.put("tel2", tel2);
		map.put("tel3", tel3);
		map.put("hairShopContent", hairShopContent);
		map.put("dayoff", dayoff);
		map.put("openTime", openTime);
		map.put("closeTime", closeTime);
		
		String fileName = "";
		int su = 0;
		if(!imageUpload.get(0).getOriginalFilename().equals("")) {
			for(int i=0; i<imageUpload.size(); i++) {
				MultipartFile eachImage = imageUpload.get(i);
				
				String filePath = "E:\\workspaceForOurProject\\hairShopProject\\hairShopProject\\src\\main\\webapp\\storage";
				fileName = (String)map.get("hairShopId") + "_" + eachImage.getOriginalFilename();
				File file = new File(filePath, fileName);
				map.put("hairShopImage" + (i+1), fileName);
				try {
					FileCopyUtils.copy(eachImage.getInputStream(), new FileOutputStream(file));
				}catch(IOException e) {
					e.printStackTrace();
				}
			}		
			if(imageUpload.size()==1) {
				map.put("hairShopImage" + "2", fileName);			
				map.put("hairShopImage" + "3", fileName);			
			}
			if(imageUpload.size()==2) {
				map.put("hairShopImage" + "3", fileName);			
			}
			su = memberDAO.hairShopInfoUpdate(map);
		}else {
			su = memberDAO.hairShopInfoUpdateExceptImg(map);			
		}
		mav.addObject("su", su);
		mav.addObject("display", "/managementPage/companyPage.jsp");
		mav.addObject("myPageBody", "/managementPage/companyPage/hairShopInfoUpdate.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
}
