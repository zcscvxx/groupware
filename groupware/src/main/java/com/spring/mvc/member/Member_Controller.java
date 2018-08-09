package com.spring.mvc.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Member_Controller {
	@Autowired
	private SqlSession sqlSession;
	private HttpSession session;
	
	@RequestMapping("/login")
	public String member_login(Model model, HttpServletRequest request) {
		return "member/login";
	}
	
	@RequestMapping("/loginproc")
	public String member_loginproc(Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		
		String member_id = request.getParameter("employeeNo");
		String member_password = request.getParameter("password");
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("member_id",member_id);
		map.put("member_password",member_password);
		
		int res = dao.login(map);
		
		MemberDTO dto = dao.select(member_id);
		
		if(res==0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디나 비밀번호가 틀립니다.'); location.href='login';</script>");
			out.flush();
			return null;
		}else {
			session = request.getSession();
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_password", member_password);
			session.setAttribute("member_name", dto.getMember_name());
			session.setAttribute("position_num", dto.getPosition_num());
            session.setAttribute("group_num", dto.getGroup_num());
			return "redirect:index";
		}
	}
	
	// 회원가입으로 가는 맵핑
	@RequestMapping("/Member")
	public String memberjoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
	

		return "member/Member";
	}

	@RequestMapping("/memberpwcheck")
	public String memberpwcheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "index.jsp?center=member/Memberpwcheck";
	}

	@RequestMapping("/memberpwcheckProc")
	public String memberpwcheckProc(HttpServletRequest request, Model model, HttpServletResponse response)
			throws Exception {
		session = request.getSession();
		String member_password = (String) session.getAttribute("member_password");
		String member_password2 = (String) request.getParameter("member_password2");

		if (member_password.equals(member_password2)) {

			return "index.jsp?center=member/Modify";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 잘못 입력하였습니다.'); history.go(-1);</script>");
			out.flush();

			return "index.jsp?center=member/Memberpwcheck";
		}
	}

	@RequestMapping("/checkidview")
	public String CheckId(Model model, String string, HttpServletRequest request) throws Exception {
		
		String id = request.getParameter("member_id");
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		int cnt = dao.checkidview(id);
		model.addAttribute("cnt", cnt);
		return "member/checkidview";
	}

	// 회원가입 결과를 보내주는 맵핑
	@RequestMapping("/memberProc")
	public String memberProcjoin(HttpServletRequest request, Model model) throws Exception {
	
		model.addAttribute("request", request);

		String member_id = request.getParameter("member_id");
		String member_name = request.getParameter("member_name");
		String member_password = request.getParameter("member_password");
		String member_phone = request.getParameter("member_phone");
		String member_email = request.getParameter("member_email");
		String member_address = request.getParameter("member_address");
		int position_num = Integer.parseInt(request.getParameter("position_num"));
		int group_num = Integer.parseInt(request.getParameter("group_num"));

		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		dao.insert(member_id, member_name, member_password, member_phone, member_email, member_address, position_num,
				group_num);

		return "member/MemberSuccess";
	}

	// 정보수정으로 가는 맵핑
	@RequestMapping("/Modify")
	public String modifyjoin(HttpServletRequest request, Model model) throws Exception {

		session = request.getSession();
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		MemberDTO dto = dao.select_id(request.getParameter("member_id"));
		model.addAttribute("dto", dto);

		return "index.jsp?center=member/Modify";
	}

	// 정보수정 결과를 보내주는 맵핑
	@RequestMapping("/modifyProc")
	public String modifyProcjoin(HttpServletRequest request, Model model) throws Exception {

		model.addAttribute("request", request);
		String member_phone = request.getParameter("member_phone");
		String member_email = request.getParameter("member_email");
		String member_address = request.getParameter("member_address");
		String member_id = request.getParameter("member_id");

		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		dao.update(member_phone, member_email, member_address, member_id);
		return "redirect:index";
	}

	// 정보삭제로 가는 맵핑
	@RequestMapping("/memberdelete")
	public String memberdeletejoin(Model model) throws Exception {
	

		return "index.jsp?center=member/MemberDelete";
	}

	// 정보 삭제를 해주는 Proc
	@RequestMapping("/deleteProc")
	public String deleteProcjoin(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);

		model.addAttribute("request", request);
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		
		int cnt = dao.delete_member(member_id, member_password);
		
		if(cnt==1) {
			dao.delete_member(member_id, member_password);			
			return "redirect:logout";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); history.go(-1);</script>");
			out.flush();

			return "redirect:memberdelete";
		}
	}

	// 회원가입이용약관으로 가는 맵핑
	@RequestMapping("/memberclause")
	public String MemberClause(Model model, HttpServletRequest request) {
		return "member/MemberClause";
	}

	// 회원가입 성공으로 가는 맵핑
	@RequestMapping("/membersucess")
	public String MemberSuccess(Model model, HttpServletRequest request) {
		return "member/Login";
	}

	// 내정보로 가는 맵핑
	@RequestMapping("/myinfomember")
	public String myinfomember(Model model, HttpServletRequest request) {
		session = request.getSession();
		Member_Dao dao = sqlSession.getMapper(Member_Dao.class);
		MemberDTO dto = dao.select_id(request.getParameter("member_id"));
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");

		model.addAttribute("dto", dto);
		return "index.jsp?center=member/MyInfoMember";
	}
}
