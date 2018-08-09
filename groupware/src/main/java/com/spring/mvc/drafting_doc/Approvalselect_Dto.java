package com.spring.mvc.drafting_doc;

public class Approvalselect_Dto {
	public String member_name;
	public String group_name;
	public String position_name;
	
	
	public Approvalselect_Dto() {}
	
	public Approvalselect_Dto(String member_name, String group_name, String position_name) {
		super();
		this.member_name = member_name;
		this.group_name = group_name;
		this.position_name = position_name;
		
		
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	@Override
	public String toString() {
		return "Approvalselect_Dto [member_name=" + member_name + ", group_name=" + group_name + ", position_name="
				+ position_name + "]";
	}
	
	
}
