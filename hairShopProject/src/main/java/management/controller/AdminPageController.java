package management.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hairShop.bean.ReservationDTO;
import management.dao.ManagementDAO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/adminPage")
public class AdminPageController {
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

/////////////////////////// 메뉴이동 ///////////////////////////
	
	// 회원 관리 메뉴 이동
	@RequestMapping(value="memberManagement", method=RequestMethod.GET)
	public ModelAndView memberManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/memberManagement.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}

/////////////////////////// 회원 관리 ///////////////////////////
	
	// 개인회원 조회
	@RequestMapping(value="getMemberList", method=RequestMethod.POST)
	public ModelAndView getMemberList() {
		List<MemberDTO> memberList = managementDAO.getMemberByType("0");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", memberList);
		mav.setViewName("jsonView");
		
		return mav;
	}

///////////////////////// 헤어샵 관리 ///////////////////////////
	
	// 헤어샵 리스트 조회
	@RequestMapping(value="getHairShopList", method=RequestMethod.POST)
	public ModelAndView getHairShopList() {
		List<MemberDTO> hairShopList = managementDAO.getMemberByType("1");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopList", hairShopList);
		mav.setViewName("jsonView");
		
		return mav;
	}
}
