package com.spring.mvc.events;

import java.sql.SQLException;
import java.util.List;

public interface Events_Dao {
	// ����
	public int insert(Events_Dto dto) throws SQLException;
	// ����
	public int update(Events_Dto dto) throws SQLException;
	// ����
	public int delete(int key, String memid) throws SQLException;
	// ���̵�� ȸ�����̵�� ������ ��������
	public Events_Dto select(int key, String memid) throws SQLException;
	// ������ ��ü ��������
	public List<Events_Dto> selectAll() throws SQLException;
	// ���̵�� ������ ��������
	public Events_Dto selectByKey(int key) throws SQLException;
	// ȸ�����̵�� ������ ��� ��������
	public List<Events_Dto> selectById(String memid) throws SQLException;
	
	public List<Events_Dto> selectDate(String start_date, String end_date);
	
	public int deleteSameData(int event_id) throws SQLException;
	
	public List<Events_Dto> selectTodayEvent();
	
}
