package com.spring.mvc.drafting_doc;

import java.sql.Timestamp;

public class Drafting_Dto {
	public int drafting_num; 
	public String drafting_title;
	public String drafting_content;
	public Timestamp drafting_date;
	public int approval_category_num;
	public String member_id;
	public int condition_num;
	public String condition_name;
	public int group_num;
	public String group_name;
	public int position_num;
	public String position_name;
	public String member_name;
	
	public Drafting_Dto() {}
	
	public Drafting_Dto(int drafting_num, String drafting_title, String drafting_content, Timestamp drafting_date,
			int approval_category_num, String member_id, int condition_num, String condition_name, int group_num,
			String group_name, int position_num, String position_name, String member_name) {
		super();
		this.drafting_num = drafting_num;
		this.drafting_title = drafting_title;
		this.drafting_content = drafting_content;
		this.drafting_date = drafting_date;
		this.approval_category_num = approval_category_num;
		this.member_id = member_id;
		this.condition_num = condition_num;
		this.condition_name = condition_name;
		this.group_num = group_num;
		this.group_name = group_name;
		this.position_num = position_num;
		this.position_name = position_name;
		this.member_name = member_name;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public int getDrafting_num() {
		return drafting_num;
	}


	public void setDrafting_num(int drafting_num) {
		this.drafting_num = drafting_num;
	}


	public String getDrafting_title() {
		return drafting_title;
	}


	public void setDrafting_title(String drafting_title) {
		this.drafting_title = drafting_title;
	}


	public String getDrafting_content() {
		return drafting_content;
	}


	public void setDrafting_content(String drafting_content) {
		this.drafting_content = drafting_content;
	}


	public Timestamp getDrafting_date() {
		return drafting_date;
	}


	public void setDrafting_date(Timestamp drafting_date) {
		this.drafting_date = drafting_date;
	}


	public int getApproval_category_num() {
		return approval_category_num;
	}


	public void setApproval_category_num(int approval_category_num) {
		this.approval_category_num = approval_category_num;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getCondition_num() {
		return condition_num;
	}


	public void setCondition_num(int condition_num) {
		this.condition_num = condition_num;
	}


	public String getCondition_name() {
		return condition_name;
	}


	public void setCondition_name(String condition_name) {
		this.condition_name = condition_name;
	}


	public int getGroup_num() {
		return group_num;
	}


	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}


	public String getGroup_name() {
		return group_name;
	}


	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}


	public int getPosition_num() {
		return position_num;
	}


	public void setPosition_num(int position_num) {
		this.position_num = position_num;
	}


	public String getPosition_name() {
		return position_name;
	}


	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}


	@Override
	public String toString() {
		return "Drafting_Dto [drafting_num=" + drafting_num + ", drafting_title=" + drafting_title
				+ ", drafting_content=" + drafting_content + ", drafting_date=" + drafting_date
				+ ", approval_category_num=" + approval_category_num + ", member_id=" + member_id + ", condition_num="
				+ condition_num + ", condition_name=" + condition_name + ", group_num=" + group_num + ", group_name="
				+ group_name + ", position_num=" + position_num + ", position_name=" + position_name + ", member_name= "+ member_name+"]";
	}
	
	

	
	
}	