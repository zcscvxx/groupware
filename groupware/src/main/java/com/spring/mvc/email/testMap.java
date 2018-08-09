package com.spring.mvc.email;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class testMap {
	public static void main(String[] args) {
//		
//		
//		
//		Map<String,ArrayList<List<String>>> map = new HashMap<String, ArrayList<List<String>>>();
//		
//		List<String> list1 = new ArrayList<String>();
//		list1.add("일정1");
//		list1.add("복사기수리");
//		list1.add("2018-08-09 11:04:49");
//		
//		List<String> list2 = new ArrayList<String>();
//		list2.add("일정2");
//		list2.add("휴가");
//		list2.add("2018-08-02 09:00:23");
//		
//		List<String> list3 = new ArrayList<String>();
//		list3.add("일정3");
//		list3.add("휴가");
//		list3.add("2018-08-02 09:22:23");
//		
//		List<String> list4 = new ArrayList<String>();
//		list4.add("일정4");
//		list4.add("휴가");
//		list4.add("2018-08-04 09:11:23");
//		
//		List<String> list5 = new ArrayList<String>();
//		list5.add("일정5");
//		list5.add("휴가");
//		list5.add("2018-08-04 09:15:23");
//		
////		System.out.println(list1);
////		System.out.println(list2);
////		System.out.println(list3);
////		System.out.println(list4);
////		System.out.println(list5);
//		
//		
//		ArrayList<List<String>> list11 = new ArrayList<List<String>>();
//		list11.add(list1);
//		list11.add(list2);
//		
//		ArrayList<List<String>> list22 = new ArrayList<List<String>>();
//		list22.add(list3);
//		
//		ArrayList<List<String>> list33 = new ArrayList<List<String>>();
//		list33.add(list4);
//		list33.add(list5);
//		
//		//System.out.println(list11);
//		
//		
//		map.put("1", list11);
//		map.put("2", list22);
//		map.put("3", list33);
//		
//		
//		System.out.println(map.toString());
//		
//		String reciever = "isy,pgy,jhg";
//		
//		String[] recieversp = reciever.split(",");
//		
//		for(int i =0;i<recieversp.length; i++) {
//			System.out.println(recieversp[i]);
//		}
//		
//		System.out.println(reciever);
		
		
		
		SimpleDateFormat date1 = new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss");
		Date day = new Date();
		String day1 = date1.format(day);	
		String day2 = "2012,04,9,10,19,30";
		System.out.println(day1);
		System.out.println(day2);
		
		String[] getday1 = day1.split(",");
		String[] getday2 = day2.split(",");
		
		int[] getday11 = new int[getday1.length];
		int[] getday22 = new int[getday2.length];
		
		for(int i=0;i<getday1.length;i++) {
			getday11[i] = Integer.parseInt(getday1[i]);
			getday22[i] = Integer.parseInt(getday2[i]);
		}
		
			String lefted = "";
		
		if(getday11[0]!=getday22[0]) {
			int years = getday11[0]-getday22[0];
			lefted = years+"년 전";
		}else if(getday11[1]!=getday22[1]) {
			int months = getday11[1]-getday22[1];
			System.out.println(months+"개월 전");
		}else if(getday11[2]!=getday22[2]) {
			int days = getday11[2]-getday22[2];
			System.out.println(days+"일 전");
		}else if(getday11[3]!=getday22[3]) {
			int hours = getday11[3]-getday22[3];
			System.out.println(hours+"시간 전");
		}else if(getday11[4]!=getday22[4]) {
			int minutes = getday11[4]-getday22[4];
			System.out.println(minutes+"분 전");
		}else {//if(getday11[5]!=getday22[5]) {
			int seconds = getday11[5]-getday22[5];
			System.out.println(seconds+"초 전");
		}
			System.out.println(lefted);
	}
}













