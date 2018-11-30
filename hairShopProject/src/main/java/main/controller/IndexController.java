package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView input() {  //사용자가 만든 콜백 메소드 
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/body.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
}
