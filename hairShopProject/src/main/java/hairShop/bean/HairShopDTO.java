package hairShop.bean;

import lombok.Data;

@Data
public class HairShopDTO {
	private String hairShopId;
	private String hairShopImage1;
	private String hairShopImage2;
	private String hairShopimage3; //대표 이미지
	private int license1; // 사업자 등록번호 (서울=100)
	private int license2; // 사업자 등록번호 (개인사업자=01~80)
	private int license3; // 사업자 등록번호 (일련번호)
	private String hairShopName; // 상호
	private String hairShopAddr; // 주소
	private double latitud; // 위도
	private double longitude; // 경도
	private String hairShopTel; // 전화번호
	private String hairShopContent; // 소개글
	private int opentime; //오픈 시간
	private int closetime; //클로징 시간
	private String dayoff; // 영업 요일
}
