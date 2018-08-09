package com.spring.mvc.business_doc;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Business_doc_Controller {
	@Autowired
	private SqlSession sqlSession;
	private HttpSession session;

	// 입력폼 불러오기
	@RequestMapping("/writeForm")
	public String business_doc_writeForm() {

		return "index.jsp?center=business_doc/writeForm";
	}

	// 업데이트폼 불러오기
	@RequestMapping("/business_doc_writeUpDate")
	public String business_doc_writeUpDate() {

		return "index.jsp?center=business_doc/writeUpDate";
	}

	// 하나의 게시글 보여주기
	@RequestMapping("/business_doc_writeView")
	public String business_doc_writeView() {

		return "index.jsp?center=business_doc/writeView";
	}

	// 하나의 게시글 찾기
	@RequestMapping("/business_doc_select")
	public String business_doc_select(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);

		Business_doc_Dto dto = dao.select(request.getParameter("business_num"));

		model.addAttribute("dto", dto);
		return "index.jsp?center=business_doc/writeView";
	}

	// 하나의 승인된 게시글 찾기
	@RequestMapping("/approved_View")
	public String approved_select(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);

		Business_doc_Dto dto = dao.select(request.getParameter("business_num"));

		model.addAttribute("dto", dto);
		return "index.jsp?center=business_doc/Approved_View";
	}

	// 업데이트폼으로 보내주는 select
	@RequestMapping("/selectUpdate2")
	public String selectUpdate2(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		
		Business_doc_Dto dto = dao.select(request.getParameter("business_num"));

		model.addAttribute("dto", dto);
		return "index.jsp?center=business_doc/writeUpDate2";
	}
	// 업데이트폼으로 보내주는 select
	@RequestMapping("/selectUpdate")
	public String business_doc_selectUpdate(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		
		Business_doc_Dto dto = dao.select(request.getParameter("business_num"));
		
		model.addAttribute("dto", dto);
		return "index.jsp?center=business_doc/writeUpDate";
	}

	// 업무일지 불러오기
	@RequestMapping("/list_business")
	public String business_doc_list(Model model, HttpServletRequest request) throws SQLException {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);

		session = request.getSession();

		int position_num = (Integer) session.getAttribute("position_num");
		String member_id = (String) session.getAttribute("member_id");

		int group_num = (Integer) session.getAttribute("group_num");

		int condition_num1 = 1;
		int condition_num2 = 2;
		int condition_num3 = 3;
		
		if (session.getAttribute("position_num").equals(5)) {
			List<Business_doc_Dto> list = dao.select_All_condition_num(condition_num1);
			List<Business_doc_Dto> list2 = dao.select_All_condition_num(condition_num1);
			List<Business_doc_Dto> list3 = dao.select_All_condition_num(condition_num2);
			List<Business_doc_Dto> list4 = dao.select_All_Companion();
			
			
			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
			model.addAttribute("list4", list4);

		} else if (session.getAttribute("position_num").equals(4)) {
			List<Business_doc_Dto> list = dao.select_director_one(group_num);
			List<Business_doc_Dto> list2 = dao.select_director_one(group_num);
			List<Business_doc_Dto> list3 = dao.select_director_two(group_num);
			List<Business_doc_Dto> list4 = dao.select_director_three(group_num);
			
			
			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
			model.addAttribute("list4", list4);

		}else if (session.getAttribute("position_num").equals(3)) {
			List<Business_doc_Dto> list = dao.select_director_one(group_num);
			List<Business_doc_Dto> list2 = dao.select_director_one(group_num);
			List<Business_doc_Dto> list3 = dao.select_director_two(group_num);
			List<Business_doc_Dto> list4 = dao.select_director_three(group_num);
			
			
			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
			model.addAttribute("list4", list4);

		}  else {
		
			List<Business_doc_Dto> list = dao.select_condition_num(member_id, condition_num1);
			List<Business_doc_Dto> list2 = dao.select_condition_num(member_id, condition_num1);
			List<Business_doc_Dto> list3 = dao.select_condition_num(member_id, condition_num2);
			List<Business_doc_Dto> list4 = dao.select_condition_num(member_id, condition_num3);
		
			Business_doc_Dto dto = dao.select_member(member_id);
			

			model.addAttribute("list4", list4);

			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);

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

		int curBlock2 = 0;
		if (request.getParameter("curBlock2") != null) {
			curBlock2 = Integer.parseInt(request.getParameter("curBlock2"));
		}
		int curPage2 = 0;
		if (request.getParameter("curPage2") != null) {
			curPage2 = Integer.parseInt(request.getParameter("curPage2"));
		}
		request.setAttribute("curBlock2", curBlock2);
		request.setAttribute("curPage2", curPage2);
		int curBlock3 = 0;
		if (request.getParameter("curBlock3") != null) {
			curBlock3 = Integer.parseInt(request.getParameter("curBlock3"));
		}
		int curPage3 = 0;
		if (request.getParameter("curPage3") != null) {
			curPage3 = Integer.parseInt(request.getParameter("curPage3"));
		}
		request.setAttribute("curBlock3", curBlock3);
		request.setAttribute("curPage3", curPage3);

		return "index.jsp?center=business_doc/list_business";
	}

	// 업무일지 승인 불러오기
	@RequestMapping("/list_Approved")
	public String list_Approved(Model model, HttpServletRequest request) throws SQLException {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);

		session = request.getSession();
		int position_num = (Integer) session.getAttribute("position_num");
		String member_id = (String) session.getAttribute("member_id");
		int group_num = (Integer) session.getAttribute("group_num");
		int condition_num2 = 2;
		
		if (session.getAttribute("position_num").equals(5)) {
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}

			List<Business_doc_Dto> list2 = dao.select_All_condition_num(condition_num2);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					
					List<Business_doc_Dto> dtos_title = dao
							.list_business_title("%" + request.getParameter("search_text") + "%",condition_num2);
					String title = request.getParameter("title");
				
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				
				} else if (request.getParameter("search").equals("content")) {
					
					List<Business_doc_Dto> dtos_content = dao
							.list_business_content("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				}  else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_business_name("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_name);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_business_date("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}

		} else if (session.getAttribute("position_num").equals(4)) {
		
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
		
			List<Business_doc_Dto> list2 = dao.select_director_two(group_num);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao
							.list_group_title("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					String title = request.getParameter("title");
				
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao
							.list_group_content("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				} else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_group_name("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_name);
					
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_group_date("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}
		} else if (session.getAttribute("position_num").equals(3)) {
		
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
		
			List<Business_doc_Dto> list2 = dao.select_director_two(group_num);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao
							.list_group_title("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					String title = request.getParameter("title");
				
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao
							.list_group_content("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				} else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_group_name("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_name);
					
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_group_date("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}
		}else{
			
			List<Business_doc_Dto> list2 = dao.select_condition_num(member_id, condition_num2);
			
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
			
			if (request.getParameter("search") != null) {

				// 사원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao.list_business_id_title(member_id,
							"%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					
					// 사원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao.list_business_id_content(member_id,
							"%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
				
					// 사원용 날짜
				}  else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao.list_business_id_date(member_id,
							"%" + request.getParameter("search_text") + "%" ,condition_num2);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					


				}
			}
			else {
				
				model.addAttribute("list2", list2);
			}
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

		return "index.jsp?center=business_doc/list_Approved";
	}

	// 업무일지 승인대기중 불러오기
	@RequestMapping("/list_Proceeding")
	public String list_Proceeding(Model model, HttpServletRequest request) throws SQLException {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);

		session = request.getSession();

		int position_num = (Integer) session.getAttribute("position_num");
		int group_num = (Integer) session.getAttribute("group_num");
		String member_id = (String) session.getAttribute("member_id");
		int condition_num2 = 1;

		if (session.getAttribute("position_num").equals(5)) {
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}

			List<Business_doc_Dto> list2 = dao.select_All_condition_num(condition_num2);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					
					List<Business_doc_Dto> dtos_title = dao
							.list_business_title("%" + request.getParameter("search_text") + "%",condition_num2);
					String title = request.getParameter("title");
				
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				
				} else if (request.getParameter("search").equals("content")) {
					
					List<Business_doc_Dto> dtos_content = dao
							.list_business_content("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				}  else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_business_name("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_name);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_business_date("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}

		} else if (session.getAttribute("position_num").equals(4)) {
		
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
		
			List<Business_doc_Dto> list2 = dao.select_director_one(group_num);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao
							.list_group_title("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					String title = request.getParameter("title");
				
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao
							.list_group_content("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				} else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_group_name("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_name);
					
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_group_date("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}
		} else if (session.getAttribute("position_num").equals(3)) {
		
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
		
			List<Business_doc_Dto> list2 = dao.select_director_one(group_num);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao
							.list_group_title("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					String title = request.getParameter("title");
				
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao
							.list_group_content("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				} else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_group_name("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_name);
					
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_group_date("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}
		}else{
			
			List<Business_doc_Dto> list2 = dao.select_condition_num(member_id, condition_num2);
			
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
			
			if (request.getParameter("search") != null) {

				// 사원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao.list_business_id_title(member_id,
							"%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					
					// 사원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao.list_business_id_content(member_id,
							"%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
				
					// 사원용 날짜
				}  else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao.list_business_id_date(member_id,
							"%" + request.getParameter("search_text") + "%" ,condition_num2);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					


				}
			}
			else {
				
				model.addAttribute("list2", list2);
			}
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

		return "index.jsp?center=business_doc/list_Proceeding";
	}

	// 업무일지 반려처리 불러오기
	@RequestMapping("/list_Companion")
	public String list_Companion(Model model, HttpServletRequest request) throws SQLException {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);

		session = request.getSession();

		int position_num = (Integer) session.getAttribute("position_num");
		int group_num = (Integer) session.getAttribute("group_num");
		String member_id = (String) session.getAttribute("member_id");
		int condition_num2 = 3;

		if (session.getAttribute("position_num").equals(5)) {
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}

			List<Business_doc_Dto> list2 = dao.select_All_condition_num(condition_num2);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					
					List<Business_doc_Dto> dtos_title = dao
							.list_business_title("%" + request.getParameter("search_text") + "%",condition_num2);
					String title = request.getParameter("title");
				
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				
				} else if (request.getParameter("search").equals("content")) {
					
					List<Business_doc_Dto> dtos_content = dao
							.list_business_content("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				}  else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_business_name("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_name);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_business_date("%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}

		} else if (session.getAttribute("position_num").equals(4)) {
		
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
		
			List<Business_doc_Dto> list2 = dao.select_director_three(group_num);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao
							.list_group_title("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					String title = request.getParameter("title");
				
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao
							.list_group_content("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				} else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_group_name("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_name);
					
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_group_date("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}
		} else if (session.getAttribute("position_num").equals(3)) {
		
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
		
			List<Business_doc_Dto> list2 = dao.select_director_three(group_num);
			if (request.getParameter("search") != null) {
				// 임원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao
							.list_group_title("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					String title = request.getParameter("title");
				
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao
							.list_group_content("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 이름
				} else if (request.getParameter("search").equals("member_name")) {
					List<Business_doc_Dto> dtos_name = dao
							.list_group_name("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_name);
					
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					// 임원용 날짜
				} else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao
							.list_group_date("%" + request.getParameter("search_text") + "%",condition_num2,group_num);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));

				}

			}

			else {

				model.addAttribute("list2", list2);
			}
		}else{
			
			List<Business_doc_Dto> list2 = dao.select_condition_num(member_id, condition_num2);
			
			if (session != null) {
				session.removeAttribute("search");
				session.removeAttribute("search_text");
			}
			
			if (request.getParameter("search") != null) {

				// 사원용 제목
				if (request.getParameter("search").equals("title")) {
					List<Business_doc_Dto> dtos_title = dao.list_business_id_title(member_id,
							"%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_title);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					
					// 사원용 내용
				} else if (request.getParameter("search").equals("content")) {
					List<Business_doc_Dto> dtos_content = dao.list_business_id_content(member_id,
							"%" + request.getParameter("search_text") + "%",condition_num2);
					model.addAttribute("list2", dtos_content);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
				
					// 사원용 날짜
				}  else if (request.getParameter("search").equals("business_date")) {
					List<Business_doc_Dto> dtos_date = dao.list_business_id_date(member_id,
							"%" + request.getParameter("search_text") + "%" ,condition_num2);
					model.addAttribute("list2", dtos_date);
					session.setAttribute("search", request.getParameter("search"));
					session.setAttribute("search_text", request.getParameter("search_text"));
					


				}
			}
			else {
				
				model.addAttribute("list2", list2);
			}
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

		return "index.jsp?center=business_doc/list_Companion";
	}

	// 업데이트
	@RequestMapping("/business_doc_update")
	public String business_doc_update(HttpServletRequest request, Model model) {

		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();

		String member_id = (String) session.getAttribute("member_id");
		String business_num = (String) request.getParameter("business_num");
	
	
		dao.update(request.getParameter("business_title"), request.getParameter("business_content"),
				request.getParameter("approval_category_num"), request.getParameter("condition_num"),
				request.getParameter("business_num"), member_id);
		return "redirect:list_business?member_id=" + member_id;
	}
	// 업데이트
	@RequestMapping("/update_Companion")
	public String update_Companion(HttpServletRequest request, Model model) {
		
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();
		
		String member_id = (String) session.getAttribute("member_id");
		String business_num = (String) request.getParameter("business_num");
		
		
		dao.update_Companion(request.getParameter("business_title"), request.getParameter("business_content"),
				request.getParameter("approval_category_num"),
				request.getParameter("business_num"), member_id);
		return "redirect:list_business?member_id=" + member_id;
	}

	// 승인
	@RequestMapping("/update_condition_num")
	public String update_condition_num(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		String all = (String) request.getParameter("condition_num");
		int index = all.indexOf("?");
		String condition_num = all.substring(0, index);

		String business_num = all.substring(index + 1);
		dao.update_condition_num(condition_num, business_num);
		return "redirect:list_business?member_id=" + member_id;
	}

	// 입력
	@RequestMapping("/write")
	public String business_doc_write(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");

		dao.insert(request.getParameter("business_title"), request.getParameter("business_content"), member_id,
				request.getParameter("approval_category_num"), request.getParameter("condition_num"));

		return "redirect:list_business?member_id=" + member_id;
	}

	// 삭제
	@RequestMapping("/business_doc_delete")
	public String business_doc_delete(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		dao.delete(request.getParameter("business_num"), request.getParameter("member_id"));
		return "redirect:list_business?member_id=" + member_id;
	}

	// 삭제
	@RequestMapping("/list_Proceeding_delete")
	public String list_Proceeding_delete(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		dao.delete(request.getParameter("business_num"), request.getParameter("member_id"));
		return "redirect:list_Proceeding?member_id=" + member_id;
	}

	// 삭제
	@RequestMapping("/list_Approved_delete")
	public String list_Approved_delete(HttpServletRequest request, Model model) {
		Business_doc_Dao dao = sqlSession.getMapper(Business_doc_Dao.class);
		session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		dao.delete(request.getParameter("business_num"), request.getParameter("member_id"));
		return "redirect:list_Approved?member_id=" + member_id;
	}
}
