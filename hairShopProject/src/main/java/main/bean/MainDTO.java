package main.bean;

import lombok.Data;

@Data
public class MainDTO {
	private String hairShopId; //고유 아이디
	private String hairShopImage1; //대표 이미지
	private String hairShopName; // 상호
	//private String hairShopPrice        가격 제외
	private String hairShopAddr1; // 주소 1
	private String hairShopAddr2; // 주소 2
	//private String hairShopStarscope    평점 제외
	private int opentime; //오픈 시간
	private int closetime; //클로징 시간
}
