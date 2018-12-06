package management.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
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
	
	// 예약 관리 메뉴 이동
	@RequestMapping(value="reservationManagement", method=RequestMethod.GET)
	public ModelAndView reservationManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/reservationManagement.jsp");
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
	
	// 개인회원 total 조회
	@RequestMapping(value="getMemberTotal", method=RequestMethod.POST)
	public @ResponseBody String getMemberTotal() {		
		return managementDAO.getMemberTotal();
	}
	
	// 개인회원 삭제
	@RequestMapping(value="memberDelete", method=RequestMethod.POST)
	public @ResponseBody void memberDelete(@RequestParam String email) {
		managementDAO.memberDelete(email);
	}
	
	// 개인회원 비밀번호 수정
	@RequestMapping(value="memberPwdModify", method=RequestMethod.POST)
	public @ResponseBody void memberPwdModify(@RequestParam String email,
											  @RequestParam String modifyPwd) {
		
		managementDAO.memberPwdModify(email,modifyPwd);
	}

///////////////////////// 헤어샵 관리 ///////////////////////////
	
	// 헤어샵 total 조회
	@RequestMapping(value="getTotalHairShop", method=RequestMethod.POST)
	public @ResponseBody String getTotalHairShop() {
		return managementDAO.getTotalHairShop();
	}

	// 헤어샵 이름 조회
	@RequestMapping(value="getHairShopName", method=RequestMethod.POST)
	public ModelAndView getHairShopName() {
		List<String> hairShopNameList = managementDAO.getHairShopName();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopNameList", hairShopNameList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 헤어샵 리스트 조회
	@RequestMapping(value="getHairShopList", method=RequestMethod.POST)
	public ModelAndView getHairShopList(@RequestParam String hairShopName) {
		List<MemberDTO> hairShopList = managementDAO.getHairShopList(hairShopName);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopList", hairShopList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 헤어샵 삭제
	@RequestMapping(value="hairShopDelete", method=RequestMethod.POST)
	public @ResponseBody void hairShopDelete(@RequestParam String email) {
		managementDAO.hairShopDelete(email);
	}
	
	// 헤어샵 삭제
	@RequestMapping(value="hairShopPwdModify", method=RequestMethod.POST)
	public @ResponseBody void hairShopPwdModify(@RequestParam String email,
												@RequestParam String modifyPwd) {
		
		managementDAO.hairShopPwdModify(email, modifyPwd);
	}
}
