package com.spring.mvc.drafting_doc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class Drafting_Controller {
	
	@Autowired
	private SqlSession sqlSession;
	private HttpSession session;
	
	@RequestMapping("/draftinglist")
	public String list(HttpServletRequest request, Model model) throws SQLException {
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int group_num = (Integer)session.getAttribute("group_num");
		int position_num = (Integer) session.getAttribute("position_num");
		
		List<Drafting_Dto> dtos = dao.selectByCondition();
		List<Drafting_Dto> complite_dtos = dao.selectByComplite(member_id, group_num, position_num);
		model.addAttribute("complite_list", complite_dtos);
		model.addAttribute("list", dtos);
		List<Drafting_Dto> inglist = dao.selectByAll(member_id, group_num, position_num);
		model.addAttribute("inglist", inglist);
		
		int curBlock = 0;
		if(request.getParameter("curBlock") != null) {
			curBlock = Integer.parseInt(request.getParameter("curBlock"));
		}
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("curPage", curPage);
///////////////////////////////////////////////////

		int curBlock2 = 0;
		if(request.getParameter("curBlock2") != null) {
			curBlock2 = Integer.parseInt(request.getParameter("curBlock2"));
		}
		int curPage2 = 0;
		if(request.getParameter("curPage2") != null) {
			curPage2 = Integer.parseInt(request.getParameter("curPage2"));
		}
		request.setAttribute("curBlock2", curBlock2);
		request.setAttribute("curPage2", curPage2);
		
		return "index.jsp?center=drafting_doc/list";
	}
	
	
	
	@RequestMapping("/inglist")
	public String inglist(HttpServletRequest request, Model model) throws SQLException {
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int group_num = (Integer)session.getAttribute("group_num");
		int position_num = (Integer) session.getAttribute("position_num");
		List<Drafting_Dto> inglist = dao.selectByAll(member_id, group_num, position_num);
		model.addAttribute("inglist", inglist);
		
		
		int curBlock = 0;
		if(request.getParameter("curBlock") != null) {
			curBlock = Integer.parseInt(request.getParameter("curBlock"));
		}
		int curPage = 0;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("curPage", curPage);
///////////////////////////////////////////////////
	
		return "index.jsp?center=drafting_doc/inglist";
	}
	

	
	
	@RequestMapping("/complitelist")
	public String complitelist(HttpServletRequest request, Model model) throws SQLException {
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
//		String drafting_title = (String) session.getAttribute("drafting_title");
		int group_num = (Integer)session.getAttribute("group_num");
		int position_num = (Integer) session.getAttribute("position_num");
		
		List<Drafting_Dto> complite_dtos = dao.selectByComplite(member_id,group_num,position_num);
		
		
		// 검색
		if(session!=null) {
			session.removeAttribute("search");
			session.removeAttribute("search_text");
			session.removeAttribute("search_date");
		}
		
		if(request.getParameter("search")!=null) {
			if(request.getParameter("search").equals("title")) {
				List<Drafting_Dto> searchBytitle = dao.searchBytitle(member_id, group_num, position_num, "%"+request.getParameter("search_text")+"%");
				model.addAttribute("complite_list", searchBytitle);
				session.setAttribute("search", request.getParameter("search"));
				session.setAttribute("search_text", request.getParameter("search_text"));
			}else if(request.getParameter("search").equals("date")) {
				List<Drafting_Dto> searchBydate = dao.searchBydate(member_id, group_num, position_num, request.getParameter("search_date"));
				model.addAttribute("complite_list", searchBydate);
				session.setAttribute("search", request.getParameter("search"));
				session.setAttribute("search_date", request.getParameter("search_date"));
			}
				
		}else {
			
			model.addAttribute("complite_list", complite_dtos);
		}
		

		// 페이지
		int curBlock2 = 0;
		if(request.getParameter("curBlock2") != null) {
			curBlock2 = Integer.parseInt(request.getParameter("curBlock2"));
		}
		int curPage2 = 0;
		if(request.getParameter("curPage2") != null) {
			curPage2 = Integer.parseInt(request.getParameter("curPage2"));
		}
		request.setAttribute("curBlock2", curBlock2);
		request.setAttribute("curPage2", curPage2);
///////////////////////////////////////////////////
	
		return "index.jsp?center=drafting_doc/complitelist";
	}
	
	
	
	
	
	@RequestMapping("/draftingwrite")
	public String write(Model model) {
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		return "index.jsp?center=drafting_doc/write";
	}
	
	@RequestMapping("/draftingwriteproc")
	public String writeproc(HttpServletRequest request, Model model, HttpServletResponse response) throws SQLException, IOException{
		model.addAttribute("request", request);
		//String member_id = (String)session.getAttribute("member_id");
		
		String drafting_title = request.getParameter("drafting_title");
		String drafting_content = request.getParameter("drafting_content");
		String member_id = request.getParameter("member_id");
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		
		
		
	
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		
		if(drafting_title.equals("") || drafting_content.equals("") || member_id.equals("")) {
			out.println("<script>alert('공백없이 입력해주세요.'); location.href='draftingwrite';</script>");
			out.flush();
			return null;
		}
		
		dao.insert(drafting_title, drafting_content, member_id);			
		return "redirect:/draftinglist";
//		return "Main.jsp?center=drafting_doc/list";

	}
	@RequestMapping("/draftingview")
	public String contentview(HttpServletRequest request, Model model) throws SQLException {
		model.addAttribute("request",request);		
		
		String drafting_num = request.getParameter("drafting_num");	
		
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		Drafting_Dto dto =dao.select(drafting_num);
		model.addAttribute("dto",dto);
		
		
//		if (drafting_num == null) {
//			drafting_num = "0";
//		}
//		int num = Integer.parseInt(drafting_num);
//		
		return "index.jsp?center=drafting_doc/view";
		
	}
	
//	@RequestMapping("/draftingview")
//	public String select(HttpServletRequest request, Model model) throws SQLException {
//		String drafting_num = request.getParameter("drafting_num");
//		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
//		Drafting_Dto dto = dao.select(drafting_num);
//		dao.select(drafting_num);
//		model.addAttribute("select", dto);
//		return "Main.jsp?center=drafting_doc/view";
//	}
	
	
//	@RequestMapping("/draftingview")
//	public String select(HttpServletRequest request, Model model) throws SQLException {
//		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
//		String drafting_num = request.getParameter("drafting_num");
//		dao.select(drafting_num);
//		
//		
//		return "Main.jsp?center=drafting_doc/view";
//	}

@RequestMapping("/draftingdelete")
	public String delete(HttpServletRequest request, Model model,HttpServletResponse response) throws SQLException, IOException {
		Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
		session = request.getSession();
		String drafting_num = request.getParameter("drafting_num");
		String login_member_id = (String) session.getAttribute("member_id");
		String member_id = request.getParameter("member_id");
		Drafting_Dto dto =dao.select(drafting_num);

		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		
		if(login_member_id.equals(dto.member_id)) {

			dao.delete(request.getParameter("drafting_num"));
			return "redirect:/inglist";
		}else{
			
			out.println("<script>alert('본인만 삭제할 수 있습니다.'); location.href='draftinglist';</script>");
			out.flush();
			return null;
		}
		
	}	
	

	

		@RequestMapping("/draftingmodify")
		public String modify(HttpServletRequest request, Model model, HttpServletResponse response) throws SQLException, IOException {
			model.addAttribute("request",request);	
			session = request.getSession();
			String login_member_id = (String) session.getAttribute("member_id");
			
			String drafting_num = request.getParameter("drafting_num");
			String member_id = request.getParameter("member_id");
			String drafting_title = request.getParameter("drafting_title");
			String drafting_content = request.getParameter("drafting_content");
			String condition_num = request.getParameter("condition_num");
			Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);

			Drafting_Dto dto =dao.select(drafting_num);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			
			model.addAttribute("dto",dto);
			

			if(login_member_id.equals(dto.member_id)) {

				return "index.jsp?center=drafting_doc/modify";
				
			}else{
				
				out.println("<script>alert('본인만 수정가능합니다.'); location.href='draftinglist';</script>");
				out.flush();

				return null;
			}
			
			
			
			}



		@RequestMapping(value="/draftingmodifyproc" , method = RequestMethod.POST)
		public String modifyproc(HttpServletRequest request, Model model) throws SQLException {
			model.addAttribute("request", request);
			Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
			
			
			String drafting_title = request.getParameter("drafting_title");
			String drafting_content = request.getParameter("drafting_content");
			String drafting_num	= request.getParameter("drafting_num");
			
			dao.update(drafting_num,drafting_title,drafting_content);
			
		
			return "redirect:/draftinglist";

		}
		
		@RequestMapping("/select")
		public String selectlist(Model model,HttpServletRequest request) throws SQLException {
			model.addAttribute("request", request);
			Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
			List<Drafting_Dto> listselect = dao.selectapproval();
			List<Drafting_Dto> select1 = dao.select1();
			List<Drafting_Dto> select2 = dao.select2();
			List<Drafting_Dto> select3 = dao.select3();
			model.addAttribute("listselect", listselect);
			
			model.addAttribute("select1", select1);
			model.addAttribute("select2", select2);
			model.addAttribute("select3", select3);
			
			
			
			return "drafting_doc/select";
		
		}
		
		@RequestMapping("/approval")
		public String approval(HttpServletRequest request,Model model) throws SQLException {
			model.addAttribute("request", request);
			Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);
			
			
			String drafting_title = request.getParameter("drafting_title");
			String drafting_content = request.getParameter("drafting_content");
			String drafting_num	= request.getParameter("drafting_num");
			String condition_num = request.getParameter("condition_num");
			String condition_name = request.getParameter("condition_name");

			dao.approval(drafting_num);
			
		
			return "redirect:/draftinglist";
		}
		
		@RequestMapping("/returnapproval")
		public String returnapproval(HttpServletRequest request,Model model) throws SQLException {
			Drafting_Dao dao = sqlSession.getMapper(Drafting_Dao.class);

			String drafting_num	= request.getParameter("drafting_num");

			dao.returnapproval(drafting_num);
			return "redirect:/draftinglist";
		}
		
		
		@RequestMapping("/backpage") // 페이지 뒤로가기
		public String backpage(HttpServletRequest request,
                RedirectAttributes redirectAttributes) {
				    String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
		
		}
				
		
}