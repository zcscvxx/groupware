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
		
	%>
<body>
	<center>
		<div class="container">
		<table class="table table-hover">
			<form action="board_modify" method="post">
			<input type="hidden" name="member_id" value=<%=member_id%>>
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
					<td>${content_view.member_name}</td>
				</tr>
				<tr height="40">
					<td align="center" width="70">제목</td>
					<td><input type="text" name="board_title"
						value="${content_view.board_title}" class="form-control"></td>
				</tr>
				<tr height="40">
					<td align="center" width="70">내용</td>
					<td><textarea rows="10" name="board_content" class="form-control">${content_view.board_content}</textarea></td>
				</tr>
				<tr height="40">
					<td colspan="2"><input type="submit" value="수정" class="btn btn-default">
						&nbsp;&nbsp; <input type="button" value="취소" class="btn btn-default" onClick="location.href='board_content_view?board_num=${content_view.board_num}'"> 
						&nbsp;&nbsp; <input type="button" value="목록" class="btn btn-default" onClick="location.href='board_list'">
						</td>
						
						
						
				</tr>
			</form>
		</table>
		</div>
	</center>
</body>
</html>