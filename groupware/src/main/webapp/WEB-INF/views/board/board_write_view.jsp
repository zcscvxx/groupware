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
<body>
<%
		String member_id = (String) session.getAttribute("member_id");
		String member_name = (String) session.getAttribute("member_name");
		int position_num = (Integer)session.getAttribute("position_num");
		
	%>
<div class="container">
	<table width="500" class="table table-hover">
		<form action="board_write" method="post">
				<input type="hidden" name="member_id" value=<%=member_id%>>
			<tr>
				<td> <input type="radio" name="notice_num" value="2" required>일반글
				<%
				if(position_num>=3){
					%>
				<input type="radio" name="notice_num" value="1" >공지글</td>
					<%
				}else{
					%>
				<input type="radio" name="notice_num" value="1" disabled>공지글</td>
					<%
				}
				%>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="member_name" size = "50" class="form-control" value=<%=member_name%> readOnly=true> </td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="board_title" size = "50" class="form-control"> </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea name="board_content" rows="10" class="form-control"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="입력" class="btn btn-default"> &nbsp;&nbsp;
				<input type="button" value="목록" class="btn btn-default" onClick="location.href='board_list'">
				</td>
			</tr>
		</form>
	</table>
	<div class="container">
	
</body>
</html>