package com.spring.mvc.board;

import java.util.ArrayList;
import com.spring.mvc.board.BoardDto;
import com.spring.mvc.member.MemberDTO;

public interface BoardDao {
	public void board_write(String member_id, String board_title, String board_content,int notice_num);
	public ArrayList<BoardDto> board_list();
	public BoardDto board_contentView(String board_num);
	public void board_modify(String board_num, String member_id, String board_title, String board_content);
	public void board_delete(String board_num);
	public BoardDto board_reply_view(String board_num);
	public void board_reply(String board_num, String member_id, String board_title, String board_content, String board_ref, String board_re_step, String board_re_level) ;
	public void board_replyShape(String board_ref, String board_re_step);
	public void board_upHit(String board_num);
	
	public ArrayList<BoardDto> board_list2();
	public ArrayList<BoardDto> board_list3(); // 공지글만 나오게
	
	public ArrayList<BoardDto> board_list_title(String board_title);
	public ArrayList<BoardDto> board_list_name(String member_id);
	public ArrayList<BoardDto> board_list_content(String board_content);
	public ArrayList<BoardDto> board_list_title_content(String board_title_content);
	
	public ArrayList<BoardDto> board_list_notice();
	
	public ArrayList<MemberDTO> board_member1();
	public ArrayList<MemberDTO> board_member2();
	public ArrayList<MemberDTO> board_member3();
	public ArrayList<MemberDTO> board_member4();
	
	public ArrayList<MemberDTO> board_member_info(String member_id);
	
	public void member_update(String member_id, int group_num, int position_num);
}
