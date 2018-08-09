package com.spring.mvc.events;

import java.sql.SQLException;
import java.util.List;

public interface Events_Dao {
	// 삽입
	public int insert(Events_Dto dto) throws SQLException;
	// 갱신
	public int update(Events_Dto dto) throws SQLException;
	// 삭제
	public int delete(int key, String memid) throws SQLException;
	// 아이디와 회원아이디로 데이터 가져오기
	public Events_Dto select(int key, String memid) throws SQLException;
	// 데이터 전체 가져오기
	public List<Events_Dto> selectAll() throws SQLException;
	// 아이디로 데이터 가져오기
	public Events_Dto selectByKey(int key) throws SQLException;
	// 회원아이디로 데이터 모두 가져오기
	public List<Events_Dto> selectById(String memid) throws SQLException;
	
	public List<Events_Dto> selectDate(String start_date, String end_date);
	
	public int deleteSameData(int event_id) throws SQLException;
	
	public List<Events_Dto> selectTodayEvent();
	
}
