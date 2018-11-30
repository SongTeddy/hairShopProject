package member.dao;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.bean.PostDTO;

@Component
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	@Override
	public void write(MemberDTO memberDTO) throws Exception {
		//회원가입 인증을 위한 랜덤키 생성
		memberDTO.setApproval_key(createKey());
		
		System.out.println(memberDTO);
		//회원 정보를 DB에 저장
		sqlSession.insert("memberSQL.write", memberDTO); 
		
		//회원가입 인증 메일 보내기
		sendMail(memberDTO, "join");
	}

	//password 찾기
	@Override
	public int updatePwd(MemberDTO memberDTO) {
		return sqlSession.update("memberSQL.updatePwd", memberDTO);
	}
	
	//회원 가입 인증 status를 true로 바꿔 로그인 가능으로 DB에 저장
	@Override
	public int approval_member(MemberDTO memberDTO) throws Exception{
		return sqlSession.update("memberSQL.approval_member", memberDTO);
	}
	
	@Override
	public void approvalMember(MemberDTO memberDTO, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (approval_member(memberDTO) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='../main/index.do';");
			out.println("</script>");
			out.close();
		}
	}

	@Override
	public void sendMail(MemberDTO memberDTO, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "ljh2861@gmail.com";
		String hostSMTPpwd = "wjdgmldi!0824";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "ljh2861@gmail.com";
		String fromName = "우리동네 미용실";
		String subject = "";
		String msg = "";
		
		System.out.println(div);
		if(div.equals("join")) {
			// 회원가입 메일 내용
			subject = "우리동네 미용실 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberDTO.getName() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8080/hairShopProject/member/approval_member.do'>";
			msg += "<input type='hidden' name='email' value='" + memberDTO.getEmail() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + memberDTO.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		}else if(div.equals("find_pw")) {
			subject = "우리동네 미용실 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberDTO.getName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberDTO.getPwd() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = memberDTO.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	//회원 가입 인증을 위한 인증키 생성
	@Override
	public String createKey() throws Exception {
		String key = "";
		Random random = new Random();
		
		for(int i=0; i<8; i++) {
			key += random.nextInt(10);
		}
		return key;
	}

	//DB에서 이메일 체크
	@Override
	public MemberDTO isCheckEmail(String email){
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.checkEmail", email);

		return memberDTO;
	}
	
	// 로그인
	@Override
	public MemberDTO login(String email, String pwd) {
		Map<String , String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pwd);

		return sqlSession.selectOne("memberSQL.login", map);
	}
	
	@Override
	public void find_pw(HttpServletResponse response, MemberDTO memberDTO) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		// 임시 비밀번호 생성
		String pwd = "";
		for (int i = 0; i < 12; i++) {
			pwd += (char) ((Math.random() * 26) + 97);
		}
		memberDTO.setPwd(pwd);
		System.out.println("mybatis set pwd = "+memberDTO.getPwd());
		// 비밀번호 변경
		updatePwd(memberDTO);
		// 비밀번호 변경 메일 발송
		sendMail(memberDTO, "find_pw");
	}

	@Override
	public String searchId(MemberDTO memberDTO) {
		System.out.println(memberDTO.getTel1()+", "+memberDTO.getTel2()+", "+memberDTO.getTel3());
		String email = sqlSession.selectOne("memberSQL.searchId", memberDTO);
		
		return email;
	}
	
// 마이페이지 ----------------------------------------------------------------------------------

	// 마이페이지 구분
	@Override
	public String getMemberType(String email) {
		return sqlSession.selectOne("memberSQL.getMemberType", email);
	}
	
	@Override
	public String getCompanyType(String email) {
		return sqlSession.selectOne("memberSQL.getCompanyType", email);
	}
	
// 예약 현황
	
	// 예약 현황 조회
	@Override
	public String getTotalReservation(String hairshopid) {
		return sqlSession.selectOne("memberSQL.getTotalReservation", hairshopid);
	}
	
	// 총 예약 금액
	@Override
	public List<String> getTotalReservePrice(String hairshopId) {
		return sqlSession.selectList("memberSQL.getTotalReservePrice", hairshopId);
	}
	
// 디자이너 관리
	
	// 디자이너 정보 조회
	@Override
	public List<DesignerDTO> getDesignerInfo(String hairshopId) {
		return sqlSession.selectList("memberSQL.getDesignerInfo", hairshopId);
	}
	
	// 디자이너 아이디로 예약 조회
	@Override
	public String getDesignerReserve(String designerId) {
		return sqlSession.selectOne("memberSQL.getDesignerReserve", designerId);
	}
	
	// 디자이너 삭제
	@Override
	public void designerDelete(String seq) {
		sqlSession.delete("memberSQL.designerDelete", seq);
	}
	
	// 선택된 디자이너 삭제
	@Override
	public void designerCheckedDelete(List<Integer> list) {
		sqlSession.delete("memberSQL.designerCheckedDelete", list);
	}
	
	// 디자이너 추가
	@Override
	public void designerAdd(DesignerDTO designerDTO) {
		sqlSession.insert("memberSQL.designerAdd", designerDTO);
	}

	@Override
	public void designerModify(DesignerDTO designerDTO) {
		sqlSession.update("memberSQL.designerModify", designerDTO);
	}

	@Override
	public List<MemberDTO> getMemberInfo(String hairshopId) {
		return sqlSession.selectList("memberSQL.getMemberInfo", hairshopId);
	}
}
