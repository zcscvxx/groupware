package com.spring.mvc.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mvc.member.MemberDTO;

@Controller
public class Board_Controller {
	
	@Autowired
	private SqlSession sqlSession;
	private HttpSession session;
	
	@RequestMapping("/board_list")
	public String list(HttpServletRequest request, Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		
		
		ArrayList<BoardDto> dtos2 = dao.board_list2();
		session = request.getSession();

		if(session!=null) {
			session.removeAttribute("search");
			session.removeAttribute("search_text");
		}
		

		if(request.getParameter("search")!=null) {
			if(request.getParameter("search").equals("title")) {
				ArrayList<BoardDto> dtos_title = dao.board_list_title("%"+request.getParameter("search_text")+"%");
				model.addAttribute("board_list2", dtos_title);
				session.setAttribute("search", request.getParameter("search"));
				session.setAttribute("search_text", request.getParameter("search_text"));
				
				
			}else if(request.getParameter("search").equals("content")) {
				ArrayList<BoardDto> dtos_content = dao.board_list_content("%"+request.getParameter("search_text")+"%");
				model.addAttribute("board_list2", dtos_content);
				session.setAttribute("search", request.getParameter("search"));
				session.setAttribute("search_text", request.getParameter("search_text"));
				
			}else if(request.getParameter("search").equals("title_content")) {
				ArrayList<BoardDto> dtos_title_content = dao.board_list_title_content("%"+request.getParameter("search_text")+"%");
				model.addAttribute("board_list2", dtos_title_content);
				session.setAttribute("search", request.getParameter("search"));
				session.setAttribute("search_text", request.getParameter("search_text"));
				
			}else if(request.getParameter("search").equals("id")) {
				ArrayList<BoardDto> dtos_name = dao.board_list_name("%"+request.getParameter("search_text")+"%");
				model.addAttribute("board_list2", dtos_name);
				session.setAttribute("search", request.getParameter("search"));
				session.setAttribute("search_text", request.getParameter("search_text"));
				
			}
		}
		
		/*else if(request.getParameter("search").equals("content")) {
			model.addAttribute("board_list2", dtos_content);
		}else if(request.getParameter("search").equals("title_content")) {
			model.addAttribute("board_list2", dtos_title_content);
		}else if(request.getParameter("search").equals("id")) {
			model.addAttribute("board_list2", dtosid);
		}else if(request.getParameter("search")==null){
		}*/
		else {
			model.addAttribute("board_list2", dtos2);			
		}
		int curBlock = 0;
		if (request.getParameter("curBlock") != null) {
			curBlock = Integer.parseInt(request.getParameter("curBlock"));
		}
		int curPage = 0;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("curPage", curPage);

		return "index.jsp?center=board/board_list";
	}
	
	@RequestMapping("/board_list_notice")
	public String list_notice(HttpServletRequest request, Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		


		ArrayList<BoardDto> dtos2 = dao.board_list2();
		ArrayList<BoardDto> dtos3 = dao.board_list3();
		
		
			model.addAttribute("board_list3", dtos3);
	
		
		int curBlock = 0;
		if (request.getParameter("curBlock") != null) {
			curBlock = Integer.parseInt(request.getParameter("curBlock"));
		}
		int curPage = 0;
		if (request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("curPage", curPage);

		return "index.jsp?center=board/board_list_notice";
	}

	@RequestMapping("/board_write_view")
	public String write_view(Model model) {

		return "index.jsp?center=board/board_write_view";
	}

	@RequestMapping("/board_write")
	public String write(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);
		String member_id = request.getParameter("member_id");
		String board_content = request.getParameter("board_content");
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String board_title = "";
		if (notice_num == 1) {
			board_title = "[°øÁö] " + request.getParameter("board_title");
		} else {
			board_title = request.getParameter("board_title");
		}

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.board_write(member_id, board_title, board_content, notice_num);
		
		if(notice_num == 1) {
			return "redirect:board_list_notice";
		}else {
			return "redirect:board_list";			
		}
	}

	@RequestMapping("/board_content_view")
	public String content_view(HttpServletRequest request, Model model) {
		String board_num = request.getParameter("board_num");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.board_contentView(board_num);
		dao.board_upHit(board_num);
		model.addAttribute("content_view", dto);

		return "index.jsp?center=board/board_content_view";
	}

	@RequestMapping("/board_modify_view")
	public String modify_view(HttpServletRequest request, Model model) {
		String board_num = request.getParameter("board_num");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.board_contentView(board_num);
		dao.board_upHit(board_num);
		model.addAttribute("content_view", dto);

		return "index.jsp?center=board/board_modify_view";
	}

	@RequestMapping(value = "/board_modify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);

		String board_num = request.getParameter("board_num");
		String member_id = request.getParameter("member_id");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.board_modify(board_num, member_id, board_title, board_content);
		return "redirect:board_list";
	}

	@RequestMapping("/board_reply_view")
	public String reply_view(HttpServletRequest request, Model model) {

		String board_num = request.getParameter("board_num");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.board_contentView(board_num);

		model.addAttribute("reply_view", dto);

		return "index.jsp?center=board/board_reply_view";

	}

	@RequestMapping("/board_reply")
	public String reply(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);

		String board_num = request.getParameter("board_num");
		String member_id = request.getParameter("member_id");
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_ref = request.getParameter("board_ref");
		String board_re_step = Integer.parseInt(request.getParameter("board_re_step")) + 1 + "";
		String board_re_level = request.getParameter("board_re_level");

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.board_reply(board_num, member_id, board_title, board_content, board_ref, board_re_step, board_re_level);
		// dao.replyShape(board_ref, board_re_step);
		return "redirect:board_list";
	}

	@RequestMapping("/board_delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);

		String board_num = request.getParameter("board_num");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.board_delete(board_num);

		return "redirect:board_list";
	}
	
	@RequestMapping("/board_content_view_popup")
	public String content_view_popup(HttpServletRequest request, Model model) {
		String board_num = request.getParameter("board_num");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		BoardDto dto = dao.board_contentView(board_num);
		dao.board_upHit(board_num);
		model.addAttribute("content_view", dto);

		return "board/board_content_view_popup";
	}
	
	@RequestMapping("/member_list")
	public String member_list(HttpServletRequest request, Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);	
		ArrayList<MemberDTO> dto1 = dao.board_member1();
		ArrayList<MemberDTO> dto2 = dao.board_member2();
		ArrayList<MemberDTO> dto3 = dao.board_member3();
		ArrayList<MemberDTO> dto4 = dao.board_member4();
		model.addAttribute("dto1", dto1);
		model.addAttribute("dto2", dto2);
		model.addAttribute("dto3", dto3);
		model.addAttribute("dto4", dto4);

		return "index.jsp?center=member/member_list";
	}
	
	@RequestMapping("/member_info")
	public String member_info(HttpServletRequest request, Model model) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);	
		
		String member_id = request.getParameter("member_id");
		
		ArrayList<MemberDTO> dto = dao.board_member_info(member_id);
		
		
		model.addAttribute("dto", dto);
		
		

		return "member/member_info";
	}
	
	@RequestMapping(value = "/member_update", method = RequestMethod.POST)
	public String member_update(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);

		String member_id = request.getParameter("member_id");
		int group_num = Integer.parseInt(request.getParameter("group"));
		int position_num = Integer.parseInt(request.getParameter("position"));
		

		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.member_update(member_id, group_num, position_num);
		return "redirect:member_complete";
	}
	
	@RequestMapping("/member_complete")
	public String member_complete(HttpServletRequest request, Model model) {

		
		return "member/member_complete";
	}
}
