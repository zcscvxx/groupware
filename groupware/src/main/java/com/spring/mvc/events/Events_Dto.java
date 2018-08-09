package com.spring.mvc.events;

import java.util.Date;

public class Events_Dto {
	private int event_id;
	private String event_name;
	private Date start_date;
	private Date end_date;
	private String member_id;
	private String member_name;
	private int same_data;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getEvent_id() {
		return event_id;
	}

	@Override
	public String toString() {
		return "Events_Dto [event_id=" + event_id + ", event_name=" + event_name + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", same_data=" + same_data + "]";
	}
	public int getSame_data() {
		return same_data;
	}
	public void setSame_data(int same_data) {
		this.same_data = same_data;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
