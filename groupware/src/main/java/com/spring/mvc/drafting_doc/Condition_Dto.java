package com.spring.mvc.drafting_doc;

public class Condition_Dto {
	public int condition_num;
	public String condition_name;
	
	
	public Condition_Dto() {}

	public Condition_Dto(int condition_num, String condition_name) {
		super();
		this.condition_num = condition_num;
		this.condition_name = condition_name;
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
	public String toString() {
		return "Condition_Dto [condition_num=" + condition_num + ", condition_name=" + condition_name + "]";
	}
	
	
	
}
