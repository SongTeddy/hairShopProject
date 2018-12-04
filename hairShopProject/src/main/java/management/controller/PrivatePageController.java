package management.controller;

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

import hairShop.bean.ReservationDTO;
import management.dao.ManagementDAO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/privatePage")
public class PrivatePageController {	
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
	
	// 하트 리스트
	@RequestMapping(value="heartList", method=RequestMethod.GET)
	public ModelAndView heartList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/heartList.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	// 하트 리스트
	@RequestMapping(value="getHeartList", method=RequestMethod.POST)
	public ModelAndView getHeartList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> heartList = managementDAO.heartList((String)session.getAttribute("memEmail"));
		System.out.println(heartList.size());
		
		mav.addObject("heartList", heartList);
		mav.addObject("heartListSize", heartList.size());
		mav.setViewName("jsonView");
		return mav;
	}
	
	//memberPage에서 email을 받아와 회원정보수정 테이블에 불러온 데이터 출력
	@RequestMapping(value="modifyForm", method=RequestMethod.GET)
	public ModelAndView modifyForm(HttpSession session) {
		MemberDTO memberDTO = memberDAO.isCheckEmail((String)session.getAttribute("memEmail"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/modifyForm.jsp");
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("memEmail",(String)session.getAttribute("memEmail"));
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// modifyForm에서 넘어온 데이터로 업데이트
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public @ResponseBody String modify(@ModelAttribute MemberDTO memberDTO, Model model) {
		managementDAO.updateInfo(memberDTO);
		model.addAttribute("memEmail", memberDTO.getEmail());
		return "success";
	}
	// 이용내역안내 폼 불러내기
	@RequestMapping(value="usageDetailsInformationForm", method=RequestMethod.GET)
	public ModelAndView usageDetailsInformationForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/usageDetailsInformationForm.jsp");
		mav.addObject("memEmail", (String)session.getAttribute("memEmail"));
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 이용내역을 DB에서 가져온다.
	@RequestMapping(value="usageDetailsInformation", method=RequestMethod.POST)
	public ModelAndView usageDetailsInformation(HttpSession session) {
		List<Map<String,Object>> list = managementDAO.getUsageDetailsInfo((String)session.getAttribute("memEmail"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/usageDetailsInformationForm.jsp");
		mav.addObject("memEmail",(String)session.getAttribute("memEmail"));
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//예약현황 폼 불러내기
	@RequestMapping(value="reservationForm", method=RequestMethod.GET)
	public ModelAndView reservationForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/reservationForm.jsp");
		mav.addObject("memEmail", (String)session.getAttribute("memEmail"));
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 예약현황을 DB에서 가져온다.
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public ModelAndView reservation(HttpSession session) {
		List<Map<String,Object>> list = managementDAO.getReservationList((String)session.getAttribute("memEmail"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/reservationForm.jsp");
		mav.addObject("memEmail", (String)session.getAttribute("memEmail"));
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 예약 취소
	@RequestMapping(value="reservationCancel", method=RequestMethod.POST)
	public @ResponseBody String reservationCancel(@RequestParam String email, Model model) {
		managementDAO.reservationCancel(email);
		model.addAttribute("memEmail",email);
		return "success";
	}
	
	// 회원탈퇴폼 불러내기
	@RequestMapping(value="deleteForm", method=RequestMethod.GET)
	public ModelAndView deleteForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/privatePage/memberPage.jsp");
		mav.addObject("memberPage", "/managementPage/privatePage/deleteForm.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public @ResponseBody String delete(String email, String pwd, Model model) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("pwd", pwd);
		
		managementDAO.userDelete(map);
		
		model.addAttribute("memEmail", email);
		
		return "success";
	}

	// 헤어샵 정보 등록 페이지
	@RequestMapping(value="hairShopInfoInput", method=RequestMethod.GET)
	public ModelAndView hairShopInfoInput(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("memEmail")!=null) {
			Map<String, String> map = managementDAO.getHomepageLink((String)session.getAttribute("memEmail"));
			mav.addObject("hairShopName", map.get("NAME"));
			mav.addObject("hairShopId", map.get("HAIRSHOPID"));
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/privatePage/hairShopInfoInput.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="getHomepageLink", method=RequestMethod.POST)
	public ModelAndView getHomepageLink(HttpSession session) {
		Map<String, String> map = managementDAO.getHomepageLink((String)session.getAttribute("memEmail"));
		System.out.println("hairShopId"  + "   " + map.get("HAIRSHOPID") + "   " + map.get("NAME"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="checkId.do")
	public @ResponseBody String checkId(@RequestParam String hairShopId) {
		System.out.println("아이디 찾으려구용" + hairShopId);
		if(managementDAO.isExistId(hairShopId))
			return "exist";
		else
			return "not_exist";
	}
}
