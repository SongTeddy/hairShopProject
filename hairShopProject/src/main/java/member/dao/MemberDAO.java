package member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import hairShop.bean.ReservationDTO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;

public interface MemberDAO {
	public void write(MemberDTO memberDTO) throws Exception;
	public String createKey() throws Exception;
	public int updatePwd(MemberDTO memberDTO);
	public void sendMail(MemberDTO memberDTO, String div) throws Exception;
	public int approval_member(MemberDTO memberDTO) throws Exception;
	public void approvalMember(MemberDTO memberDTO,HttpServletResponse response) throws Exception;
	public MemberDTO isCheckEmail(String email);
	public MemberDTO login(String id, String pwd);
	public void find_pw(HttpServletResponse response, MemberDTO memberDTO) throws Exception;
	public String searchId(MemberDTO memberDTO);
	public MemberDTO changeUserInfo(String email);
}