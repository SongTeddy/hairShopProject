package member.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import hairShop.bean.ReservationDTO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.bean.PostDTO;

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
	public String getMemberType(String email);
	public String getCompanyType(String email);
	
	// 마이페이지(관리자)
	public String getTotalReservation(String email);
	public List<DesignerDTO> getDesignerInfo(String hairshopId);
	public String getDesignerReserve(String string);
	public void designerDelete(String seq);
	public void designerCheckedDelete(List<Integer> list);
	public void designerAdd(DesignerDTO designerDTO);
	public void designerModify(DesignerDTO designerDTO);
	public List<String> getTotalReservePrice(String hairshopId);
	public List<MemberDTO> getMemberInfo(String hairshopId);

	
	//마이페이지(개인)
	public void updateInfo(MemberDTO memberDTO);
	public void userDelete(Map<String,String> map);
	public List<Map<String, Object>> getUsageDetailsInfo(String email);
	public List<Map<String, Object>> getReservationList(String email);
	public void reservationCancel(String email);

	public List<ReservationDTO> getReservation(String designername);

}
