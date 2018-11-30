package member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
}
