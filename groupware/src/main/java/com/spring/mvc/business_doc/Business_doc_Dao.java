package com.spring.mvc.business_doc;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface Business_doc_Dao {
	
	public List<Business_doc_Dto> selectAll();
	
	public List<Business_doc_Dto> select_id(String member_id);
	public List<Business_doc_Dto> select_All_Companion();

	
	public List<Business_doc_Dto> selectAll_director(int condition_num);
	
	public List<Business_doc_Dto> select_director_one(int group_num);
	public List<Business_doc_Dto> select_director_two(int group_num);
	public List<Business_doc_Dto> select_director_three(int group_num);
	
	public List<Business_doc_Dto> select_All_director(int condition_num );
	public List<Business_doc_Dto> select_All_condition_num(int condition_num );
	
	public List<Business_doc_Dto> select_condition_num(String member_id,int condition_num);
	
	public Business_doc_Dto select_member(String member_id);
	public Business_doc_Dto select(String business_num);
	public void insert(String business_title,String business_content,String member_id ,String approval_category_num ,String condition_num);
	public void delete(String string,String member_id);
	public void update(String business_title,String business_content,String approval_category_num ,String condition_num,String  business_num, String member_id);
	
	public void update_Companion(String business_title,String business_content,String approval_category_num ,String  business_num, String member_id);
	
	public void update_condition_num(String condition_num,String business_num);
	//°Ë»ö
	public List<Business_doc_Dto> list_business_title(String board_title,int condition_num);
	public List<Business_doc_Dto> list_business_name(String member_name,int condition_num);
	public List<Business_doc_Dto> list_business_content(String board_content,int condition_num);
	public List<Business_doc_Dto> list_business_date(String business_date,int condition_num);
	
	
	
	public List<Business_doc_Dto> list_group_title(String board_title,int condition_num,int group_num);
	public List<Business_doc_Dto> list_group_name(String member_name,int condition_num,int group_num);
	public List<Business_doc_Dto> list_group_content(String board_content,int condition_num,int group_num);
	public List<Business_doc_Dto> list_group_date(String business_date,int condition_num,int group_num);
	
	
	public List<Business_doc_Dto> list_business_id_title(String member_id,String business_title ,int condition_num);
	public List<Business_doc_Dto> list_business_id_content(String member_id,String business_content ,int condition_num);
	public List<Business_doc_Dto> list_business_id_date(String member_id,String business_date ,int condition_num);
	
	public List<Map<String,Object>> select_Map(Map<String, Object> map);
//	public List<Map<String,Object>> select_Map(Map<String, Object> map,String member_num);
	public int getAllCount(String member_id) throws SQLException;
	
	public List<Business_doc_Dto> business_main_list(String member_id, int group_num, int position_num);

}
