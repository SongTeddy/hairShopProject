package management.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import management.dao.ManagementDAO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/managementPage")
public class ManageController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ManagementDAO managementDAO;

// 페이지 이동
	
	// 관리페이지 (개인, 사업자 구분)
	@RequestMapping(value="managementPage", method=RequestMethod.POST)
	public @ResponseBody String managementPages(@RequestParam String memEmail) {
		return managementDAO.getMemberType(memEmail);
	}
	
	// 개인 페이지 이동
	@RequestMapping(value="memberPage", method=RequestMethod.GET)
	public ModelAndView memberPage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 사업자 페이지 이동 = 예약현황 메뉴
	@RequestMapping(value="companyPage", method=RequestMethod.GET)
	public ModelAndView companyPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/totalReservation.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 관리자 페이지 이동
	@RequestMapping(value="adminPage", method=RequestMethod.GET)
	public ModelAndView adminPage(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/hairShopManagement.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}	
}
