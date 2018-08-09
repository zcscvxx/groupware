<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="resources/email/css/mailbox.css"> -->
<style type="text/css">
/* img {
	width:15px;
	height:15px;
} */
table.table.table-striped{
		width:80%;
		max-width:800px;
		font-size:1.5em;
	}
@media screen and (max-width:520px){
	table.table.table-striped{
		min-width:360px;
		font-size:1em;
	}
}
</style>
</head>
<body>
<%
//	session.setAttribute("root","mailMain.jsp?right=email/");
	String right = request.getParameter("right");
	if(right==null){
		right = "homeMail.jsp";
	}
%>
<center>
	
	<table class="table table-striped" >
		<tr align="center">
			<td><jsp:include page="leftMail.jsp"></jsp:include> </td>
		</tr>
		<tr >
			<td ><jsp:include page="<%=right %>"></jsp:include></td>
		</tr>		
	</table>
	
</center>
</body>
</html>