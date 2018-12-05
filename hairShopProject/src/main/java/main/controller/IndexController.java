package main.controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping(value="/main/index.do", method=RequestMethod.GET)
	public ModelAndView input(HttpSession session, Model model) throws InvalidKeySpecException {  //사용자가 만든 콜백 메소드 
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/main/body.jsp");
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
	
}
