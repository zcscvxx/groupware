<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String name = (String) session.getAttribute("member_name");
%>
<body>
	<center>
		<h2>이벤트 등록</h2>
		<form action='addEventProc' method='post'>
			<table width='800' >
				<tr height='30'>
					<td width='150' align='center'>등록자</td>
					<td width='550' align='left'><label><%=name%></label></td>
				</tr>
				<tr height='30'>
					<td width='150' align='center'>일정 내용</td>
					<td width='550' align='left'><input type='text' name='event_name' size='70'></td>
				</tr>
				<tr height='30'>
					<td width='150' align='center'>일정 시작일</td>
					<td width='550' align='left'><input type='date' name='start_date'></td>
				</tr>
				<tr height='30'>
					<td width='150' align='center'>일정 종료일</td>
					<td width='550' align='left'><input type='date' name='end_date'></td>
				</tr>
				<tr height='30'>
					<td align='center' colspan='2'><input type='submit' value='일정 추가' class="btn btn-primary">
					<a href="eventsMain" class="btn btn-default">돌아가기</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>