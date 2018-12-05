package stylebook.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stylebook.dao.StylebookDAO;

@Controller
public class StylebookController {
	@Autowired
	private StylebookDAO stylebookDAO;
	@RequestMapping(value="/stylebook/stylebookForm.do", method=RequestMethod.GET)
	public ModelAndView stylebookForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("display", "/stylebook/stylebookForm.jsp");
		mav.setViewName("/main/index");
		
		return mav;
	}
	@RequestMapping(value="/stylebook/perm.do", method=RequestMethod.GET)
	public ModelAndView perm() {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,String>> list = stylebookDAO.getPermImage();
		mav.addObject("list",list);
		mav.addObject("display", "/stylebook/stylebookForm.jsp");
		mav.setViewName("jsonView");
		
		return mav;
	}
}

