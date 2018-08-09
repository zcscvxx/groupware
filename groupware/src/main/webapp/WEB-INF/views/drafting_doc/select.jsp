
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
</head>
	<body>
	select.jsp
	<br>
	<br>
	<br>
	
			<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2" >결재</td>
				<td>직급 들어가는 자리</td>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2">협조</td>
				<td>직급2 들어가는 자리</td>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2">참조</td>
				<td>직급3 들어가는 자리</td>
			</tr>
			<tr>
				<td><select id="select" style="  " onchange="changehtml();">
	<!-- <select id="select"> -->
		<option value="text">text</option>
		<option value="radio">radio</option>
		<option value="checkbox">checkbox</option>
		<option value="button">button</option>
		<option value="textarea">textarea</option>
	</select></td>
				<td><select id="select" style="  " onchange="changehtml();">
	<!-- <select id="select"> -->
		<option value="text">text</option>
		<option value="radio">radio</option>
		<option value="checkbox">checkbox</option>
		<option value="button">button</option>
		<option value="textarea">textarea</option>
	</select></td>
				<td><select id="select" style="  " onchange="changehtml();">
	<!-- <select id="select"> -->
		<c:forEach items="${select3}" var="dto3">
		<option value="${dto3.member_name }">${dto3.member_name }${dto3.position_name}</option>
		</c:forEach>
	</select></td>
			</tr>




			</table>	
	
	
	
	
	<table border="1">
<tr>
	<th>기획부</th>
</tr>
	<c:forEach items="${select1}" var="dto1">
	
	<td></td>
	<td>${dto1.member_name }</td>
	<td>${dto1.position_name}</td>
<tr>
	</c:forEach>
	<th>영업부</th>
</tr>
	<c:forEach items="${select2}" var="dto2">
	<td></td>
	<td>${dto2.member_name }</td>
	<td>${dto2.position_name}</td>
<tr>
	</c:forEach>
	<th>생산부</th>
</tr>
	<c:forEach items="${select3}" var="dto3">
	<td></td>
	<td>${dto3.member_name }</td>
	<td>${dto3.position_name}</td>
<tr>
	</c:forEach>
	
	
	</table>
	
	
	
	</body>

	</head>

</htm>