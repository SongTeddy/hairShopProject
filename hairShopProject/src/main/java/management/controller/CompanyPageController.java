package management.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hairShop.bean.ReservationDTO;
import management.dao.ManagementDAO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/companyPage")
public class CompanyPageController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private DesignerDTO designerDTO;
	@Autowired
	private ReservationDTO reservationDTO;
	@Autowired
	private ManagementDAO managementDAO;
	
// 메뉴 이동
	// 디자이너 관리
	@RequestMapping(value="designerMenu", method=RequestMethod.GET)
	public ModelAndView designerMenu(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/designerMenu.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}

// 예약 현황 메뉴
	
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd");
		
		// DB
		List<ReservationDTO> list = memberDAO.getReservation(designername); // 한명의 예약 정보 리스트
		
		// 리스트 생성
		List<String> bookerNameList = new ArrayList<String>(); // 예약자 이름 리스트
		List<String> bookerEmailList = new ArrayList<String>(); // 예약자 이메일 리스트
		List<String> bookerTelList = new ArrayList<String>(); // 예약자 연락처 리스트
		List<String> bookerRequestsList = new ArrayList<String>(); // 예약자 요청사항 리스트
		
		List<String> serviceList = new ArrayList<String>(); // 서비스 리스트
		List<String> descriptionList = new ArrayList<String>(); // 시술명 리스트
		List<String> priceList = new ArrayList<String>(); // 가격 리스트
		List<String> requiredTimeList = new ArrayList<String>(); // 요구시간 리스트
		List<String> startEndTimeList = new ArrayList<String>(); // 시작~끝 시간 리스트
		List<String> startList = new ArrayList<String>(); // 시작시간 리스트
		List<String> endList = new ArrayList<String>(); // 종료시간 리스트
		
		// 리스트에 데이터 추가
		for(ReservationDTO reservationDTO : list) {
			bookerNameList.add(reservationDTO.getBookername());
			bookerEmailList.add(reservationDTO.getBookeremail());
			bookerTelList.add(reservationDTO.getBookertel1()+'-'+reservationDTO.getBookertel2()+'-'+reservationDTO.getBookertel3());
			bookerRequestsList.add(reservationDTO.getRequests());
			
			serviceList.add(reservationDTO.getService());
			descriptionList.add(reservationDTO.getDescription());
			priceList.add(String.format("%,d", reservationDTO.getPrice()));
			requiredTimeList.add(Integer.toString(reservationDTO.getTimerequired()));
			startEndTimeList.add(sdf.format(reservationDTO.getStarttime())+" ~ "+
					 sdf.format(reservationDTO.getEndtime()));
			startList.add(sdf.format(reservationDTO.getStarttime())); // 각 예약날의 시:분을 리스트에 추가 
			endList.add(sdf.format(reservationDTO.getEndtime())); // 각 예약날의 시:분을 리스트에 추가
		}
		
		// td의 클래스들이 담긴 리스트
		List<String> tdClassList = new ArrayList<String>();
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
		mav.addObject("bookerNameList", bookerNameList);
		mav.addObject("bookerEmailList", bookerEmailList);
		mav.addObject("bookerTelList", bookerTelList);
		mav.addObject("bookerRequestsList", bookerRequestsList);
		
		mav.addObject("serviceList", serviceList);
		mav.addObject("descriptionList", descriptionList);
		mav.addObject("priceList", priceList);
		mav.addObject("requiredTimeList", requiredTimeList);
		mav.addObject("startEndTimeList", startEndTimeList);
		mav.addObject("startList", startList);
		mav.addObject("endList", startList);
		
		mav.addObject("tdClassList", tdClassList);
		
		mav.setViewName("jsonView");
		
		return mav;
	}

// 디자이너 관리 메뉴
	
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

}
