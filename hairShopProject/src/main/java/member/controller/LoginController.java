package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@RequestMapping(value="/member")
@Component
public class LoginController {
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="memberLogin.do", method=RequestMethod.POST)
	public @ResponseBody String memberLogin(@RequestParam String loginEmail,
						  	  				@RequestParam String loginPwd,
						  	  				Model model,
						  	  				HttpSession session) {
		
		
		memberDTO = memberDAO.login(loginEmail,loginPwd);
		
		// 세션
		if(memberDTO!=null) {
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail());
			session.setAttribute("hairshopId", memberDTO.getHairshopid());
			session.setAttribute("memType", memberDTO.getType()); // 개인, 사업자 구분
			
			model.addAttribute("memName", memberDTO.getName());
			
			return "exist";
		}else {
			model.addAttribute("login", memberDTO);
			
			return "non_exist";
		}
	}
	
	@RequestMapping(value="memberLogout.do", method=RequestMethod.GET)
	public ModelAndView memberLogout(HttpSession session) {	
		session.invalidate();
		
		return new ModelAndView("redirect:/main/index.do");
	}
}
