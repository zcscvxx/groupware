<%@page import="com.spring.mvc.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<%
		String member_id = (String) session.getAttribute("member_id");
		String member_name = (String) session.getAttribute("member_name");
		BoardDto dto = (BoardDto) request.getAttribute("reply_view");
	%>
<body>
	<center>
		<div class="container">
		<table class="table table-hover">
			<form action="board_reply" method="post">
				<input type="hidden" name="board_num" value="${reply_view.board_num}"> <input
					type="hidden" name="board_ref" value="${reply_view.board_ref}"> <input
					type="hidden" name="board_re_step" value="${reply_view.board_re_step}"> <input
					type="hidden" name="board_re_level" value="${reply_view.board_re_level}">
					<input type="hidden" name="member_id" value=<%=member_id%>>
				<tr height="40">
					<td align="center" width="70">번호</td>
					<td>${reply_view.board_num}</td>
				</tr>
				<tr height="40">
					<td align="center" width="70">히트</td>
					<td>${reply_view.board_readcount}</td>
				</tr>
				<tr height="40">
					<td align="center" width="70">이름</td>
					<td><input type="text" name="member_id"
						class="form-control" value=<%=member_name%> readOnly=true></td>
				</tr>
				<tr height="40">
					<td align="center" width="70">제목</td>
					<td><input type="text" name="board_title"
						value="<%
							if(dto.getBoard_re_step()==0){
								%>　┖ <%
							}else{
									%>　<%
							}
						%>${reply_view.board_title}" class="form-control"></td>
						
				</tr>
				<tr height="40">
					<td align="center" width="70">내용</td>
					<td><textarea rows="10" name="board_content" class="form-control"></textarea></td>
				</tr>
				<tr height="40">
					<td colspan="2" align="center"><input type="submit" value="답변" class="btn btn-default">
						<input type="button" value="목록" class="btn btn-default" onClick="location.href='board_list'"></td>
				</tr>
			</form>
		</table>
		</div>
	</center>
</body>
</html>