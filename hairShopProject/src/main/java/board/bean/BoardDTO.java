package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq;
	private String email;
	private String subject;
	private String content;
	private String hairshopid;

	private int ref;

	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date logtime;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getHairshopid() {
		return hairshopid;
	}

	public void setHairshopid(String hairshopid) {
		this.hairshopid = hairshopid;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}
	
	public Date getLogtime() {
		return logtime;
	}

	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	
	
}