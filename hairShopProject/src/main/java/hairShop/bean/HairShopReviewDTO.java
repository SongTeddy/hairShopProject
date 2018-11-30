package hairShop.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class HairShopReviewDTO {
	private int seq;
	private String email;//회원아이디(이메일)
	private String hairshopid; //헤어샵아이디
	private String designerid; //헤어샵아이디 + 디자이너이름
	private String position; //디자이너 직책
	private String designername; //디자이너 이름
	private String designerimage; //디자이너이미지
	private String service;//서비스
	private String description; //서비스설명
	private String reviewsubject;//리뷰제목
	private String reviewcontent;//리뷰내용
	private String hairshopstar;//미용실 별점
	private String designerstar;//디자이너 별점
	
	private String reply;//답글
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date logtime;//현재날짜 -- Date(?)
}
