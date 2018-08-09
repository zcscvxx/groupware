<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

table.table.table-hover{
		width:100%;
		max-width:500px;
		font-size:1.0sem;
	}
@media screen and (max-width:520px){
	table.table.table-hover{
		min-width:360px;
		font-size:1em;
	}
}
</style>
</head>
<body>
			
	<table class="table table-hover">
		<tr><td>최신메일<a href="rcvMail?pagenum=1&contentnum=15">더보기</a></td></tr>
		<tr>
			<td>메일제목</td><td>보낸사람</td><td>지난시간</td>
		</tr>
		<c:forEach items="${listRecentMail}" var="dto">
		<tr>
			<td><a href="readMailRcv?mail_num=${dto.mail_num}">${dto.mail_title}</a></td>
			<td><a href="writeMailClick?mail_rcvmember=${dto.member_id}">${dto.member_id}</a></td>
			<td>${dto.lefted}</td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>