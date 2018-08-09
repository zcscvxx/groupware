package com.spring.mvc.email;


import java.sql.Timestamp;

public class DtoEmail {

	private int mail_num;
	private String mail_title;
	private String mail_content;
	private Timestamp mail_senddate;
	private Timestamp mail_rcvdate;
	private String member_id;
	private String mail_rcvmember;
	private int rcv;
	private int send;
	private String lefted;
	private String read;
	
	
	
	
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getLefted() {
		return lefted;
	}
	public void setLefted(String lefted) {
		this.lefted = lefted;
	}
	public int getRcv() {
		return rcv;
	}
	public void setRcv(int rcv) {
		this.rcv = rcv;
	}
	public int getSend() {
		return send;
	}
	public void setSend(int send) {
		this.send = send;
	}
	
	public int getMail_num() {
		return mail_num;
	}
	public void setMail_num(int mail_num) {
		this.mail_num = mail_num;
	}
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	
	public Timestamp getMail_senddate() {
		return mail_senddate;
	}
	public void setMail_senddate(Timestamp mail_senddate) {
		this.mail_senddate = mail_senddate;
	}
	
	public Timestamp getMail_rcvdate() {
		return mail_rcvdate;
	}
	public void setMail_rcvdate(Timestamp mail_rcvdate) {
		this.mail_rcvdate = mail_rcvdate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMail_rcvmember() {
		return mail_rcvmember;
	}
	public void setMail_rcvmember(String mail_rcvmember) {
		this.mail_rcvmember = mail_rcvmember;
	}
	@Override
	public String toString() {
		return "DtoEmail [mail_num=" + mail_num + ", mail_title=" + mail_title + ", mail_content=" + mail_content
				+ ", mail_senddate=" + mail_senddate + ", mail_rcvdate=" + mail_rcvdate + ", member_id=" + member_id
				+ ", mail_rcvmember=" + mail_rcvmember + ", rcv=" + rcv + ", send=" + send + ", lefted=" + lefted
				+ ", read=" + read + "]";
	}
	
	
	
	
}
