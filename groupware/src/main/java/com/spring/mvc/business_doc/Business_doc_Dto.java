package com.spring.mvc.business_doc;

import java.sql.Date;

public class Business_doc_Dto {
	private int business_num;
	private String business_title;
	private String business_content;
	private Date business_date;
	private Date approved_date;
	private String member_id;
	private int approval_category_num;
	private String member_name; // 멤버 아이디
	private int condition_num; // 진행상황넘버
	private String condition_name; // 진행상황이름
	public Business_doc_Dto() {super();}
	public Business_doc_Dto(int business_num, String business_title, String business_content, Date business_date,
			Date approved_date, String member_id, int approval_category_num, String member_name, int condition_num,
			String condition_name) {
		super();
		this.business_num = business_num;
		this.business_title = business_title;
		this.business_content = business_content;
		this.business_date = business_date;
		this.approved_date = approved_date;
		this.member_id = member_id;
		this.approval_category_num = approval_category_num;
		this.member_name = member_name;
		this.condition_num = condition_num;
		this.condition_name = condition_name;
	}
	@Override
	public String toString() {
		return "Business_doc_Dto [business_num=" + business_num + ", business_title=" + business_title
				+ ", business_content=" + business_content + ", business_date=" + business_date + ", approved_date="
				+ approved_date + ", member_id=" + member_id + ", approval_category_num=" + approval_category_num
				+ ", member_name=" + member_name + ", condition_num=" + condition_num + ", condition_name="
				+ condition_name + "]";
	}
	public int getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(int business_num) {
		this.business_num = business_num;
	}
	public String getBusiness_title() {
		return business_title;
	}
	public void setBusiness_title(String business_title) {
		this.business_title = business_title;
	}
	public String getBusiness_content() {
		return business_content;
	}
	public void setBusiness_content(String business_content) {
		this.business_content = business_content;
	}
	public Date getBusiness_date() {
		return business_date;
	}
	public void setBusiness_date(Date business_date) {
		this.business_date = business_date;
	}
	public Date getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(Date approved_date) {
		this.approved_date = approved_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getApproval_category_num() {
		return approval_category_num;
	}
	public void setApproval_category_num(int approval_category_num) {
		this.approval_category_num = approval_category_num;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + approval_category_num;
		result = prime * result + ((approved_date == null) ? 0 : approved_date.hashCode());
		result = prime * result + ((business_content == null) ? 0 : business_content.hashCode());
		result = prime * result + ((business_date == null) ? 0 : business_date.hashCode());
		result = prime * result + business_num;
		result = prime * result + ((business_title == null) ? 0 : business_title.hashCode());
		result = prime * result + ((condition_name == null) ? 0 : condition_name.hashCode());
		result = prime * result + condition_num;
		result = prime * result + ((member_id == null) ? 0 : member_id.hashCode());
		result = prime * result + ((member_name == null) ? 0 : member_name.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Business_doc_Dto other = (Business_doc_Dto) obj;
		if (approval_category_num != other.approval_category_num)
			return false;
		if (approved_date == null) {
			if (other.approved_date != null)
				return false;
		} else if (!approved_date.equals(other.approved_date))
			return false;
		if (business_content == null) {
			if (other.business_content != null)
				return false;
		} else if (!business_content.equals(other.business_content))
			return false;
		if (business_date == null) {
			if (other.business_date != null)
				return false;
		} else if (!business_date.equals(other.business_date))
			return false;
		if (business_num != other.business_num)
			return false;
		if (business_title == null) {
			if (other.business_title != null)
				return false;
		} else if (!business_title.equals(other.business_title))
			return false;
		if (condition_name == null) {
			if (other.condition_name != null)
				return false;
		} else if (!condition_name.equals(other.condition_name))
			return false;
		if (condition_num != other.condition_num)
			return false;
		if (member_id == null) {
			if (other.member_id != null)
				return false;
		} else if (!member_id.equals(other.member_id))
			return false;
		if (member_name == null) {
			if (other.member_name != null)
				return false;
		} else if (!member_name.equals(other.member_name))
			return false;
		return true;
	}
}
