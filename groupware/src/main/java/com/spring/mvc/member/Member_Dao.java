package com.spring.mvc.member;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface Member_Dao {
	public MemberDTO select(String memberid);

	public int login(Map<String, String> map) throws SQLException;

	public MemberDTO select_id(String member_id);

	public int checkidview(String member_id);

	public int passcheck(String member_id, String member_password);
	
	public void insert(String member_id, String member_name, String member_password,
			String member_phone, String member_email, String member_address,
			int position_num, int group_num);
	
	public List<MemberDTO> selectAll() throws SQLException;
	
	public void delete(String member_id, String member_password);
	
	public void update(String member_phone, String member_email, String member_address,String member_id);

	public boolean duplicateIdCheck(String member_id);
	
	public int delete_member(String member_id, String member_password);
}
