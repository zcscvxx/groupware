package com.spring.mvc.board;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardDto {
	public int board_num;
	public String board_title;
	public String board_content;
	public Timestamp board_regdate;
	public int board_ref;
	public int board_re_step;
	public int board_re_level;
	public int board_readcount;
	public String member_id;
	public int notice_num;
	public String member_name;
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Timestamp board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getBoard_ref() {
		return board_ref;
	}
	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}
	public int getBoard_re_step() {
		return board_re_step;
	}
	public void setBoard_re_step(int board_re_step) {
		this.board_re_step = board_re_step;
	}
	public int getBoard_re_level() {
		return board_re_level;
	}
	public void setBoard_re_level(int board_re_level) {
		this.board_re_level = board_re_level;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	@Override
	public String toString() {
		return "BoardDto [board_num=" + board_num + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_regdate=" + board_regdate + ", board_ref=" + board_ref + ", board_re_step=" + board_re_step
				+ ", board_re_level=" + board_re_level + ", board_readcount=" + board_readcount + ", member_id="
				+ member_id + ", notice_num=" + notice_num + ", member_name=" + member_name + "]";
	}

}
