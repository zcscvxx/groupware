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

<body>
	<%
		ArrayList<MemberDTO> dto = (ArrayList<MemberDTO>) request.getAttribute("dto");
		int position_num = (Integer)session.getAttribute("position_num");
	%>
	<center>
		
		<div class="container">
		<form action="member_update" method="post">
			<%
			if(position_num == 5){
			%>
			<table class="table table-hover">
				<c:forEach items="${dto}" var="dto">
				<tr><td align="center">이름</td><td align="center">${dto.member_name}</td></tr>
				<tr><td align="center">아이디</td><td align="center">${dto.member_id}</td></tr>
				<tr><td align="center">직책</td>
				
				<td align="center">
					<select name="position">
 					<c:choose>
						       <c:when test="${dto.position_num == '1'}">
						          <option value="1" selected>사원</option>
						          <option value="2" >대리</option>
						          <option value="3" >팀장</option>
						          <option value="4" >부장</option>
						          <option value="5" >사장</option>
				
						       </c:when>
						       <c:when test="${dto.position_num == '2'}">
						          <option value="1" >사원</option>
						          <option value="2" selected>대리</option>
						          <option value="3" >팀장</option>
						          <option value="4" >부장</option>
						          <option value="5" >사장</option>
						       </c:when>
						       <c:when test="${dto.position_num == '3'}">
						          <option value="1" >사원</option>
						          <option value="2" >대리</option>
						          <option value="3" selected>팀장</option>
						          <option value="4" >부장</option>
						          <option value="5" >사장</option>
						       </c:when>
						       <c:when test="${dto.position_num == '4'}">
						          <option value="1" >사원</option>
						          <option value="2" >대리</option>
						          <option value="3" >팀장</option>
						          <option value="4" selected>부장</option>
						          <option value="5" >사장</option>
						       </c:when>
						       <c:otherwise>
						        <option value="1" >사원</option>
						          <option value="2" >대리</option>
						          <option value="3" >팀장</option>
						          <option value="4" >부장</option>
						          <option value="5" selected>사장</option>
						       </c:otherwise>
						   </c:choose>
 					</select>	
 				</td>
 				</tr>
				<tr><td align="center">부서</td>
				<td align="center">
				<select name="group">
 					<c:choose>
						       <c:when test="${dto.group_num == '1'}">
						          <option value="1" selected>기획부</option>
						          <option value="2" >영업부</option>
						          <option value="3" >생산부</option>
						       </c:when>
						       <c:when test="${dto.group_num == '2'}">
						          <option value="1" >기획부</option>
						          <option value="2" selected>영업부</option>
						          <option value="3" >생산부</option>
						       </c:when>
						       <c:otherwise>
							        <option value="1" >기획부</option>
							        <option value="2" >영업부</option>
							        <option value="3" selected>생산부</option>
						       </c:otherwise>
						   </c:choose>
 					</select>	
				</td></tr>
				<tr><td align="center">전화번호</td><td align="center">${dto.member_phone}</td></tr>
				<tr><td align="center">이메일</td><td align="center">${dto.member_email}</td></tr>
				<tr><td align="center">주소</td><td align="center">${dto.member_address}</td></tr>
				</c:forEach>
			</table>
			<input type="submit" class="btn btn-default" value="수정하기">
			<input type="button" class="btn btn-default" onClick='javascript:self.close();' value="닫기">
			<input type="hidden" name="member_id" value="<%=request.getParameter("member_id")%>">
			</form>
			<%
			}else{
				%>
				<table class="table table-hover">
					<c:forEach items="${dto}" var="dto">
					<tr><td align="center">이름</td><td align="center">${dto.member_name}</td></tr>
					<tr><td align="center">아이디</td><td align="center">${dto.member_id}</td></tr>
					<tr><td align="center">직책</td><td align="center">${dto.position_name}</td></tr>
					<tr><td align="center">부서</td><td align="center">${dto.group_name}</td></tr>
					<tr><td align="center">전화번호</td><td align="center">${dto.member_phone}</td></tr>
					<tr><td align="center">이메일</td><td align="center">${dto.member_email}</td></tr>
					<tr><td align="center">주소</td><td align="center">${dto.member_address}</td></tr>
					</c:forEach>
				</table>
				<input type="button" class="btn btn-default" onClick='javascript:self.close();' value="닫기">
				<input type="hidden" name="member_id" value="<%=request.getParameter("member_id")%>">
				<%
			}
			%>
		</div>
		
	</center>
</body>
</html>