<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
.mailnav{
	
	float:left;
	margin: 0 auto;
	padding: 0 5%;
}
@media screen and (max-width:736px){
	.mailnav{
		font-size:0.7em;
		}
}
@media screen and (max-width:500px){
	.mailnav{
		margin: 0 auto;
		padding: 0 3%;
	}
}
</style>

</head>
<body>
<%
	String root = (String)session.getAttribute("root");
	
%>

<div class="mailnav"><a href="writeMail">메일쓰기</a></div>	
<div class="mailnav"><a href="rcvMail?pagenum=1&contentnum=15">받은메일</a></div>	
<div class="mailnav"><a href="sendMail?pagenum=1&contentnum=15">보낸메일</a></div>	
<div class="mailnav"><a href="saveMail?pagenum=1&contentnum=15">저장메일</a></div>	
<div class="mailnav"><a href="trashMail?pagenum=1&contentnum=15">휴지통</a></div>	
	
</body>
</html>