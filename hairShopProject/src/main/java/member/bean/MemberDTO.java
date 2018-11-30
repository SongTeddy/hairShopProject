package member.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	private String email;
	private String pwd;
	private String name;
	private String tel1;
	private String tel2;
	private String tel3;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String type;
	private String hairshopimage1;
	private String hairshopimage2;
	private String hairshopimage3;
	private int license1;
	private int license2;
	private int license3;
	private String hairshopid;
	private double latitud;
	private double longitude;
	private String hairshopcontent;
	private String opentime;
	private String closetime;
	private String dayoff;
	private String approval_status;
	private String approval_key;
    private Date logtime;
}
