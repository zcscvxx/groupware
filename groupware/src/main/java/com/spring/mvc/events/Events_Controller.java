package com.spring.mvc.events;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Events_Controller {
	@Autowired
	private SqlSession sqlSession;
	private HttpSession session;

	
	@RequestMapping("/eventsMain")
	public String batchForm(Model model, HttpServletRequest request) {
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		Calendar now_calendar = Calendar.getInstance();
		
		int now_year = now_calendar.get(now_calendar.YEAR);
		int now_month = now_calendar.get(now_calendar.MONTH)+1;
		int now_date = now_calendar.get(now_calendar.DATE);
		
		now_calendar.set(now_year, now_month, 1);
		int now_end_day = now_calendar.getActualMaximum(now_calendar.DAY_OF_MONTH); // 마지막 일 구하기
		
		List<Events_Dto> list = dao.selectDate(now_year+"-"+now_month+"-01", now_year+"-"+now_month+"-"+now_end_day);
		
		if(year!=null || month!=null) {
			Calendar calendar = Calendar.getInstance();
			int select_year = Integer.parseInt(year);
			int select_month = Integer.parseInt(month);
			calendar.set(select_year,select_month-1, 1);
			
			int end_day = calendar.getActualMaximum(calendar.DAY_OF_MONTH); // 마지막 일 구하기
			
			list = dao.selectDate(year+"-"+month+"-01", year+"-"+month+"-"+end_day);
		}
		model.addAttribute("list", list);
		
		return "index.jsp?center=events/eventMain";
	}
	
	@RequestMapping("/addEvent")
	public String addEvent(Model model, HttpServletRequest request) {
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		return "index.jsp?center=events/addEvent";
	}
	
	@RequestMapping("/addEventProc")
	public String addEventProc(Model model, HttpServletRequest request) throws ParseException, SQLException {
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		Events_Dto dto = new Events_Dto();
		session = request.getSession();
		
		String member_id = (String) session.getAttribute("member_id");
		dto.setEvent_name(request.getParameter("event_name"));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = df.parse(request.getParameter("start_date"));
		Date end_date = df.parse(request.getParameter("end_date"));
		
		String[] start_buf = request.getParameter("start_date").split("-");
		String[] end_buf = request.getParameter("end_date").split("-");
		
		int start_year = Integer.parseInt(start_buf[0]);
		int end_year = Integer.parseInt(end_buf[0]);
		int start_month = Integer.parseInt(start_buf[1]);
		int end_month = Integer.parseInt(end_buf[1]);
		
		if(start_month==end_month) {
			dto.setStart_date(start_date);
			dto.setEnd_date(end_date);
			dto.setMember_id(member_id);
			dto.setSame_data(1);
			dao.insert(dto);
		}else {
			Calendar calendar = Calendar.getInstance();
			calendar.set(start_year,start_month-1, 1);
			int start_month_end_day = calendar.getActualMaximum(calendar.DAY_OF_MONTH); // 마지막 일 구하기
			String a = start_year+"-"+start_month+"-"+start_month_end_day+"";
			Date end_date1 = df.parse(a);
			dto.setStart_date(start_date);
			dto.setEnd_date(end_date1);
			dto.setMember_id(member_id);
			dto.setSame_data(2);
			dao.insert(dto);
			
			String b = end_year+"-"+end_month+"-"+1;
			Date start_date1 = df.parse(b);
			dto.setStart_date(start_date1);
			dto.setEnd_date(end_date);
			dto.setMember_id(member_id);
			dto.setSame_data(2);
			dao.insert(dto);
		}
			
		return "redirect:eventsMain";
	}
	
	@RequestMapping("/viewEvent")
	public String viewEvent(Model model, HttpServletRequest request) throws SQLException {
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		Events_Dto dto = dao.selectByKey(event_id);
		model.addAttribute("dto", dto);
		return "events/viewEvent";
	}
	
	@RequestMapping("/deleteEvent")
	public String eventdelete(Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		String member_id = request.getParameter("member_id");
		int same_data = Integer.parseInt(request.getParameter("same_data"));
//		String event_name = request.getParameter("event_name");
		if(same_data==1) {
			dao.delete(event_id, member_id);			
		}
		else {
			dao.deleteSameData(event_id);
		}
		
		return "redirect:eventsMain";
	}
}
