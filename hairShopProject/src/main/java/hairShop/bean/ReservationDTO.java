package hairShop.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class ReservationDTO {
	private String bookeremail;
	private String bookername;
	private String bookertel1;
	private String bookertel2;
	private String bookertel3;
	private String requests;
	private String hairshopid;
	private String designerid;
	private String designername;
	private String service;
	private String description;
	private int price;
	private int timerequired;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date starttime;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date date;
    private String theday;
    private int didordidnot;
}
