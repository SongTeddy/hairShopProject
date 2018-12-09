package main.controller;

import java.security.spec.InvalidKeySpecException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import management.dao.ManagementDAO;

@Controller
public class IndexController {
	@Autowired
	private ManagementDAO managementDAO;
	
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView input(HttpSession session, Model model) throws InvalidKeySpecException {  //사용자가 만든 콜백 메소드 
		
		List<Map<String, Object>> bannerList = managementDAO.getBannerList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/main/body.jsp");
		mav.addObject("bannerList", bannerList);
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="/main/searchHairShop.do", method=RequestMethod.GET)
	public ModelAndView searchHairShop() {  //사용자가 만든 콜백 메소드 
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/searchHairShop.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="/main/event.do", method=RequestMethod.GET)
	public ModelAndView event() {  
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/event.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="/main/eventView.do", method=RequestMethod.GET)
	public ModelAndView eventView(@RequestParam String seq, @RequestParam int type) {
		ModelAndView mav = new ModelAndView();
		if(type==0) {
			Map<String,String> map = managementDAO.getEventImageName(Integer.parseInt(seq));
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
}
