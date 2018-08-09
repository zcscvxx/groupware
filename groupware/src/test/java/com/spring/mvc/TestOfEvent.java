package com.spring.mvc;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mvc.events.Events_Dao;
import com.spring.mvc.events.Events_Dto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class TestOfEvent {
	@Inject
	private SqlSession sqlSession;
	
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	public void selectall() throws SQLException {
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		List<Events_Dto> dto = dao.selectAll();
		System.out.println(dto);
	}

	public void insert() throws SQLException, ParseException{
		Events_Dao dao = sqlSession.getMapper(Events_Dao.class);
		Events_Dto dto = new Events_Dto();
		dto.setMember_id("pgy");
		dto.setEvent_name("회의실 사용");
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = df.parse("2018-07-09 10:00:00");
		dto.setStart_date(date);
		dto.setEnd_date(date);
		
		dao.insert(dto);
	}
}
