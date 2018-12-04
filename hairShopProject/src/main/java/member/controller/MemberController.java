package member.controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.PostDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberDTO memberDTO;
	
	// 회원가입
	@RequestMapping(value="write", method=RequestMethod.POST)
	public @ResponseBody String write(@ModelAttribute MemberDTO memberDTO) throws Exception {
		memberDAO.write(memberDTO);
		
		return "success";
	}
	
	// 이메일 확인
	@RequestMapping(value="checkEmail", method=RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam String email){
		if(email.equals("")) return "empty";
		
		boolean exist = memberDAO.isCheckEmail(email)!=null;
		
		if(exist) return "exist";
		
		else return "non_exist";
	}
	// id 찾기
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public @ResponseBody String findId(@ModelAttribute MemberDTO memberDTO) {
		String email = memberDAO.searchId(memberDTO);
		
		return email;
	}
	
	// password 찾기
	@RequestMapping(value="findMember", method=RequestMethod.POST)
	public @ResponseBody String findMember(@RequestParam String email, HttpServletResponse response) throws Exception {
		System.out.println(email);
		
		memberDTO = memberDAO.isCheckEmail(email);
		
		/*System.out.println(memberDTO);
		System.out.println(memberDAO.login(email, memberDTO.getPwd()));*/
		if(memberDTO==null) {
			return "fail";
		} else if(memberDAO.login(email, memberDTO.getPwd())==null) {
			return "invalid_email";
		} else {
			System.out.println("memberDTO = "+memberDTO);
			memberDAO.find_pw(response, memberDTO);
			
			return "success";
		}
	}
	
	// 회원 인증
	@RequestMapping(value="approval_member", method=RequestMethod.POST)
	public void approvalMember(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) throws Exception{
		memberDAO.approvalMember(memberDTO, response);
	}
}
