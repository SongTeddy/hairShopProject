package member.controller;

import java.security.PrivateKey;

import javax.crypto.Cipher;
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
						  	  				@RequestParam String publicKeyModulus,
						  	  				@RequestParam String publicKeyExponent,
						  	  				@RequestParam String securedUsername,
						  	  				@RequestParam String securedPassword,
						  	  				Model model,
						  	  				HttpSession session) {

		memberDTO = memberDAO.login(loginEmail,loginPwd);
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("rsaPrivateKey"); 
		
		session.removeAttribute("rsaPrivateKey");
		
		// 세션
		if(memberDTO!=null && privateKey!=null) {
			String email = null;
			String pwd = null;
			
			try {
				email = decryptRsa(privateKey, securedUsername);
				pwd = decryptRsa(privateKey, securedPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail());
			session.setAttribute("hairshopId", memberDTO.getHairshopid());
			session.setAttribute("memType", memberDTO.getType()); // 개인, 사업자 구분
			session.setAttribute("privateKey", securedUsername+","+securedPassword);
			
			model.addAttribute("memName", memberDTO.getName());
			model.addAttribute("display", "/main/index.jsp");
			
			return "exist";
		}else {
			model.addAttribute("login", memberDTO);
			model.addAttribute("display", "/main/index.jsp");
			
			return "non_exist";
		}
	}
	
	@RequestMapping(value="memberLogout.do", method=RequestMethod.GET)
	public ModelAndView memberLogout(HttpSession session) {	
		session.invalidate();
		
		return new ModelAndView("redirect:/main/index.do");
	}
	
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		System.out.println("will decrypt : " + securedValue); 
		
		Cipher cipher = Cipher.getInstance("RSA"); 
		
		byte[] encryptedBytes = hexToByteArray(securedValue); 
		cipher.init(Cipher.DECRYPT_MODE, privateKey); 
		
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes); 
		String decryptedValue = new String(decryptedBytes, "utf-8");
		
		return decryptedValue; 
	}

	public static byte[] hexToByteArray(String hex) { 
		if (hex == null || hex.length() % 2 != 0) { 
			return new byte[]{}; 
		} 
		
		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) { 
			byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16); 
			bytes[(int) Math.floor(i / 2)] = value; 
		} 
		return bytes; 
	}
}
