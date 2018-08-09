<%@page import="com.spring.mvc.events.Events_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<title>GroupWare</title>
</head>
<%
	String id = (String) session.getAttribute("member_id");

	Events_Dto dto = (Events_Dto)request.getAttribute("dto");
	
	String dto_member_id = dto.getMember_id();
%>
<body>
<center>
<h1>일정 보기</h1>
<table width=380 height=330 class ="table table-hover">
	<tr>
		<td>작성자</td>
		<td>${dto.member_name}</td>
	</tr>
	<tr>
		<td>일정 기간</td>
		<td><fmt:formatDate value="${dto.start_date}" pattern="yyyy년MM월dd일"/>~<fmt:formatDate value="${dto.end_date}" pattern="yyyy년MM월dd일"/></td>
	</tr>
	<tr>
		<td>일정 내용</td>
		<td><%=dto.getEvent_name() %></td>
	</tr>
	<tr>
			<td colspan="2" align="center"><input type="button" class="btn btn-default" onclick="javascript:self.close();" value="닫기"></td>
	</tr>
</table>
</center>
</body>
</html>