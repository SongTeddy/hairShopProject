package hairShop.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class HairShopDesignerDTO {
	private String designerid;//헤어샵아이디 + 디자이너이름
	private String hairshopid;//헤어샵아이디
	private String designername;//디자이너 이름
	private String designerimage;//디자이너이미지
	private String position;//디자이너 직책
	private String dayoff;//출근요일
}
