package com.spring.mvc.drafting_doc;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public interface Drafting_Dao {
	public List<Drafting_Dto> selectAll() throws SQLException;
	public int insert(String drafting_title, String drafting_content,String member_id) throws SQLException;
	public Drafting_Dto select(String drafting_num) throws SQLException;
	public void delete(String drafting_num) throws SQLException;
	public void update(String drafting_num, String drafting_title, String drafting_content) throws SQLException;
	public void approval(String drafting_num);
	public void returnapproval(String drafting_num);
	public List<Drafting_Dto> selectByCondition() throws SQLException;
	public List<Drafting_Dto> selectByComplite(String member_id, int group_num, int position_num) throws SQLException;
	public List<Drafting_Dto> drafting_list() throws SQLException;
	public List<Drafting_Dto> selectByAll(String member_id, int group_num, int position_num) throws SQLException;
	public List<Drafting_Dto> search(String drafting_title);
	public List<Drafting_Dto> searchBytitle(String member_id, int group_num, int position_num, String drafting_title) throws SQLException;
	public List<Drafting_Dto> searchBydate(String member_id, int group_num, int position_num, String drafting_date) throws SQLException;
	public List<Drafting_Dto> selectapproval() throws SQLException;
	public List<Drafting_Dto> select1() throws SQLException;
	public List<Drafting_Dto> select2() throws SQLException;
	public List<Drafting_Dto> select3() throws SQLException;
	
	public List<Drafting_Dto> mainList(String id, int group_num, int position_num) throws SQLException;
	
	
	
}
