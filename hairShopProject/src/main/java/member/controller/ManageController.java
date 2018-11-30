package member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

// 페이지 이동
	
	// 관리페이지 (개인, 사업자 구분)
	@RequestMapping(value="managementPage", method=RequestMethod.POST)
	public @ResponseBody String managementPages(@RequestParam String memEmail) {
		return memberDAO.getMemberType(memEmail);
	}
	
	// 사업자 페이지 이동
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
		System.out.println(hairshopId);
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
		
		/*// 오늘 기준 월요일 구하기
 		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
 		System.out.println(sdf.format(c.getTime()));
 		
 		// 오늘 기준 일요일 구하기
 		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
 		c.add(c.DATE,7);
 		System.out.println(sdf.format(c.getTime()));*/
		
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
	
	// 유저 페이지
	@RequestMapping(value="memberPage", method=RequestMethod.GET)
	public ModelAndView memberPage(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	//memberPage에서 email을 받아와 회원정보수정 테이블에 불러온 데이터 출력
	@RequestMapping(value="modifyForm", method=RequestMethod.POST)
	public ModelAndView modifyForm(@RequestParam String memEmail) throws Exception {
		MemberDTO memberDTO = memberDAO.isCheckEmail(memEmail);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/modifyForm.jsp");
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// modifyForm에서 넘어온 데이터로 업데이트
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public @ResponseBody String modify(@ModelAttribute MemberDTO memberDTO, Model model) {
		memberDAO.updateInfo(memberDTO);
		
		return "success";
	}
	// 이용내역안내 폼 불러내기
	@RequestMapping(value="usageDetailsInformationForm", method=RequestMethod.POST)
	public ModelAndView usageDetailsInformationForm(@RequestParam String memEmail) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/usageDetailsInformationForm.jsp");
		mav.addObject("memEmail", memEmail);
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 이용내역을 DB에서 가져온다.
	@RequestMapping(value="usageDetailsInformation", method=RequestMethod.POST)
	public ModelAndView usageDetailsInformation(@RequestParam String email) {
		List<Map<String,Object>> list = memberDAO.getUsageDetailsInfo(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/usageDetailsInformationForm.jsp");
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//예약현황 폼 불러내기
	@RequestMapping(value="reservationForm", method=RequestMethod.POST)
	public ModelAndView reservationForm(@RequestParam String memEmail) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/reservationForm.jsp");
		mav.addObject("memEmail", memEmail);
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 예약현황을 DB에서 가져온다.
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public ModelAndView reservation(@RequestParam String email) {
		List<Map<String,Object>> list = memberDAO.getReservationList(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/reservationForm.jsp");
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 예약 취소
	@RequestMapping(value="reservationCancel", method=RequestMethod.POST)
	public @ResponseBody String reservationCancel(@RequestParam String email) {
		memberDAO.reservationCancel(email);
		
		return "success";
	}
	
	// 회원탈퇴폼 불러내기
	@RequestMapping(value="deleteForm", method=RequestMethod.GET)
	public ModelAndView deleteForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/managementPage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/deleteForm.jsp");
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public @ResponseBody String delete(String email, String pwd) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("pwd", pwd);
		
		memberDAO.userDelete(map);
		
		return "success";
	}
}
