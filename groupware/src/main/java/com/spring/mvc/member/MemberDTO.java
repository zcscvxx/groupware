package com.spring.mvc.member;

public class MemberDTO {
	private String member_id;
	private String member_name;
	private String member_password;
	private String member_phone;
	private String member_email;
	private String member_address;
	private int position_num;
	private int group_num;
	private String position_name;
	private String group_name;
	private String member_exist;
	
	public String getMember_exist() {
		return member_exist;
	}
	public void setMember_exist(String member_exist) {
		this.member_exist = member_exist;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public int getPosition_num() {
		return position_num;
	}
	public void setPosition_num(int position_num) {
		this.position_num = position_num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_name=" + member_name + ", member_password="
				+ member_password + ", member_phone=" + member_phone + ", member_email=" + member_email
				+ ", member_address=" + member_address + ", position_num=" + position_num + ", group_num=" + group_num
				+ ", position_name=" + position_name + ", group_name=" + group_name + ", member_exist=" + member_exist
				+ "]";
	}
	
	
}
