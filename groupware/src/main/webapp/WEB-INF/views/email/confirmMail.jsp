<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<%
	ArrayList<String> error_rcv = (ArrayList<String>)request.getAttribute("error_rcv");
%>
<body>
	<center>
	<img src="resources/email/send.jpg" style="width:180px; height:150px; margin:10%;">
		<h2>메일전송이 완료되었습니다.</h2>
		<%-- <c:forEach items="${error_rcv}" var="err">
			${err.rcvsp[i]}
		</c:forEach> --%>
		
		<table>
		<%
		if(error_rcv!=null && !error_rcv.isEmpty()){
			for(String x:error_rcv){
				%>
					<tr>
						<td style="color:red;"><%=x%></td>
						<td>아이디가 올바르지 않습니다.</td>
					</tr>
				<%
			}			
		}
		%>
		</table>
		<a href = "sendMail?pagenum=1&contentnum=15">보낸 메일함으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "writeMaill">메일 쓰기</a>
		</center>
</body>
</html>