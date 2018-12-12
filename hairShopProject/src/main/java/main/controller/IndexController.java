package main.controller;

import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import main.dao.MainDAO;
import management.dao.ManagementDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value = "/main")
public class IndexController {
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ManagementDAO managementDAO;
	@Autowired
	private MainDAO mainDAO;
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public ModelAndView input(HttpSession session, Model model) throws InvalidKeySpecException {  //사용자가 만든 콜백 메소드
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> bannerList = managementDAO.getBannerList();
		System.out.println(bannerList.size());
		mav.addObject("display", "/main/body.jsp");
		mav.addObject("bannerList", bannerList);
		mav.addObject("memEmail", session.getAttribute("memEmail"));
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="searchHairShop", method=RequestMethod.GET)
	public ModelAndView searchHairShop(@RequestParam(defaultValue="", required=false) String service) {  //사용자가 만든 콜백 메소드 
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/searchHairShop.jsp");
		mav.addObject("service", service);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="event", method=RequestMethod.GET)
	public ModelAndView event() {  
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/event.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="eventView", method=RequestMethod.GET)
	public ModelAndView eventView(@RequestParam String seq, @RequestParam int type) {
		ModelAndView mav = new ModelAndView();
		if(type==0) {
			Map<String,String> map = managementDAO.getEventImageName(Integer.parseInt(seq));
			Map<String,String> mapCoupon = managementDAO.getCoupon(Integer.parseInt(seq));
			if(mapCoupon!=null) mav.addObject("couponMap", mapCoupon);
			mav.addObject("eventImageName", map.get("EVENTDETAILIMAGE"));
			mav.addObject("eventSubject", map.get("EVENTSUBJECT"));
			mav.addObject("seq", map.get("SEQ"));
		} else {
			Map<String,String> map = managementDAO.getEndEventImageName(Integer.parseInt(seq));
			mav.addObject("eventImageName", map.get("EVENTDETAILIMAGE"));
			mav.addObject("eventSubject", map.get("EVENTSUBJECT"));
			mav.addObject("seq", map.get("SEQ"));
		}
		mav.addObject("display", "/main/eventView.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="getRecommendView", method=RequestMethod.POST)
	public ModelAndView recommendView() {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> list = mainDAO.getRecommendView();
		System.out.println(list);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
  
	@RequestMapping(value="getHairShopStarScopeAvg", method=RequestMethod.POST)
	public ModelAndView getHairShopStarScopeAvg() {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> list = mainDAO.getHairShopStarScopeAvg();
		mav.addObject("list", list);
		mav.addObject("display", "/main/body.jsp");
		mav.setViewName("jsonView");
		return mav;
	}
	
}
