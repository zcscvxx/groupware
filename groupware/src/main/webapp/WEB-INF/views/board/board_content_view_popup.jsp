<%@page import="com.spring.mvc.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String member_id = (String) session.getAttribute("member_id");
		String member_name = (String) session.getAttribute("member_name");
		BoardDto dto = (BoardDto) request.getAttribute("content_view"); 
		pageContext.setAttribute("br","<br/>");
		pageContext.setAttribute("cn","\n");
	%>
	



	<center>
		<div class="container">
		<% 
		if(dto.getNotice_num()==1){
		%>
		<a href="#" style="text-decoration:none;"><h1>공지사항</h1></a>
		<%			
		}else{
			%>
		<a href="board_list" style="text-decoration:none;"><h1>자유 게시판</h1></a>
			<%
		}
		%>
		<table class="table table-hover">
			<form action="board_modify_view" method="post">
				<input type="hidden" name="board_num" value="${content_view.board_num}">
				<tr height="40">
					<td align="center" width="70">번호</td>
					<td>${content_view.board_num}</td>
				</tr>
				<tr height="40">
					<td align="center" width="70">조회수</td>
					<td>${content_view.board_readcount}</td>
				</tr>
				<tr height="40">
					<td align="center" width="70">이름</td>
					<td><%=dto.getMember_name() %></td>
				</tr>
				<tr height="40">
					<td align="center" width="70">제목</td>
					<td>${content_view.board_title}</td>
				</tr>
				<tr height="40">
					<td align="center" width="70">내용</td>
					<td>${fn:replace(content_view.board_content, cn, br)}</td>
				</tr>
				
			</form>
		</table>
		<input type="button" class="btn btn-default" onClick='javascript:self.close();' value="닫기">
		</div>
	</center>
</body>
</html>