package member.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DesignerDTO {
	private int seq;
	private String designerid;
	private String hairshopid;
	private String designername;
	private String designerimage;
	private int positioncode;
	private String position;
	private String dayoff;
}
