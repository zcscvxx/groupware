<%@page import="com.spring.mvc.email.DtoEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.readmail{
	width:98%;
}
#conten{
padding:5% 5%;
}
</style>
</head>
<body>
<%
	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");
%>
	<table class="readmail">
		<tr>
			<td></td><td></td>
			<td colspan=4>　</td>
		</tr>
		<tr>
			<td></td><td></td>
			<td><strong>보낸사람</strong></td><td><a href="writeMailClick?mail_rcvmember=${listMail.member_id}">${listMail.member_id}</a></td>
			<td><strong>보낸시간</strong></td><td><fmt:formatDate value="${listMail.mail_senddate}" pattern="yy-MM-dd hh:mm:ss"/></td>
		</tr>
		<tr>
			<td></td><td></td>
			<td><strong>받을사람</strong></td><td><a href="writeMailClick?mail_rcvmember=${listMail.mail_rcvmember}">${listMail.mail_rcvmember}</a></td>
			<td><strong>받은시간</strong></td><td><fmt:formatDate value="${listMail.mail_rcvdate}" pattern="yy-MM-dd hh:mm:ss"/></td>
		</tr>
		<tr>
			<td></td><td></td>
			<td><strong>제목</strong></td><td colspan=3>${listMail.mail_title}</td>
		</tr>
		<tr>
			<td></td><td></td>
			<td id="conten" colspan=4>${fn:replace(listMail.mail_content,cn,br)}</td>
		</tr>
		<tr>
			<td></td><td></td>
			<td colspan=2 align=center><a href="moveTrashRcv?mail_num=${listMail.mail_num}">휴지통</a></td>
			<td colspan=2 align=center><a href="moveSaveRcv?mail_num=${listMail.mail_num}">저장</a></td>
		</tr>
	</table>
</body>
</html>