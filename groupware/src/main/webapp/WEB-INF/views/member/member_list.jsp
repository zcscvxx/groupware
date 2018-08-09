<%@page import="com.spring.mvc.member.MemberDTO"%>
<%@page import="com.spring.mvc.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function popupOpen(member_id) {
	var popUrl = "member_info?member_id=" + member_id; //팝업창에 출력될 페이지 URL
	var popOption = "width=400, height=400, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
	window.open(popUrl, "", popOption);
}
</script>
<body>
	<%
		ArrayList<MemberDTO> dto1 = (ArrayList<MemberDTO>) request.getAttribute("dto1");
		ArrayList<MemberDTO> dto2 = (ArrayList<MemberDTO>) request.getAttribute("dto2");
		ArrayList<MemberDTO> dto3 = (ArrayList<MemberDTO>) request.getAttribute("dto3");
		ArrayList<MemberDTO> dto4 = (ArrayList<MemberDTO>) request.getAttribute("dto4");
	%>
	<center>
		<div class="container">
			<div
					style="float: center; width: 30%; padding: 10px; border:1px solid black; margin: 10px;">
			<h2>사장</h2>
			<table class="table table-hover">
				<tr class="active">
					<td align="center">이름</td>
					<td align="center">아이디</td>
					<td align="center">직책</td>
					<td align="center">전화번호</td>
				</tr>
				<%
						for(MemberDTO x : dto4){
						%>
						<tr>
							<td align="center"><a href='javascript:popupOpen("<%=x.getMember_id()%>");'><%=x.getMember_name() %></a></td>
							<td align="center"><%=x.getMember_id() %></td>
							<td align="center"><%=x.getPosition_name() %></td>
							<td align="center"><%=x.getMember_phone() %></td>
						</tr>
						<%
						}
					%>
			</table>
			</div>

			  

			<div
				style="float: left; width: 30%; padding: 10px; border:1px solid black; margin: 10px 10px 10px 36px;">
				<h2>기획부</h2>
				<table class="table table-hover">
					<tr class="active">
						<td align="center">이름</td>
						<td align="center">아이디</td>
						<td align="center">직책</td>
						<td align="center">전화번호</td>
					</tr>
					<%
						for(MemberDTO x : dto1){
						%>
						<tr>
							<td align="center"><a href='javascript:popupOpen("<%=x.getMember_id()%>");'><%=x.getMember_name() %></a></td>
							<td align="center"><%=x.getMember_id() %></td>
							<td align="center"><%=x.getPosition_name() %></td>
							<td align="center"><%=x.getMember_phone() %></td>
						</tr>
						<%
						}
					%>
				</table>
			</div>
			<div
				style=" float: left; width: 30%; padding: 10px; border:1px solid black; margin: 10px;">
				<h2>영업부</h2>
				<table class="table table-hover">
					<tr class="active">
						<td align="center">이름</td>
						<td align="center">아이디</td>
						<td align="center">직책</td>
						<td align="center">전화번호</td>
					</tr>
					<%
						for(MemberDTO x : dto2){
						%>
						<tr>
							<td align="center"><a href='javascript:popupOpen("<%=x.getMember_id()%>");'><%=x.getMember_name() %></a></td>
							<td align="center"><%=x.getMember_id() %></td>
							<td align="center"><%=x.getPosition_name() %></td>
							<td align="center"><%=x.getMember_phone() %></td>
						</tr>
						<%
						}
					%>
				</table>
			</div>
			<div
				style=" float: left; width: 30%; padding: 10px; border:1px solid black; margin: 10px;">
				<h2>생산부</h2>
				<table class="table table-hover">
					<tr class="active">
						<td align="center">이름</td>
						<td align="center">아이디</td>
						<td align="center">직책</td>
						<td align="center">전화번호</td>
					</tr>
					<%
						for(MemberDTO x : dto3){
						%>
						<tr>
							<td align="center"><a href='javascript:popupOpen("<%=x.getMember_id()%>");'><%=x.getMember_name() %></a></td>
							<td align="center"><%=x.getMember_id() %></td>
							<td align="center"><%=x.getPosition_name() %></td>
							<td align="center"><%=x.getMember_phone() %></td>
						</tr>
						<%
						}
					%>
				</table>
			</div>
		</div>
	</center>
</body>
</html>