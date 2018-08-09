<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.spring.mvc.member.MemberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 정보</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

.div1{
	float:left;
	width:800px;
	height:600px;
	margin:0px 200px;
	border:1px solid #000000;
	border-radius:10px;
}

.div2{
	float:left;
	width:60%;
	height:400px;
	border:1px solid #87cefa;
	margin:30px 150px;
	border-radius:10px;
}

.myinfo1{
	background-color: #e0ffff;
	text-align:center;
	font-size:15pt;
	font-weight:bold;
	color: #00bfff;
	height:50px;
	margin:10px 10px;
	line-height:50px;
}

.divtext1{
	text-align:center;
	
}

dl{
	margin:5px 30px 0px;
}

dt{
	float:left;
}

.div3{
	float:left;	
	border:1px solid #87cefa;
	width:800px;
	height:70px;
	margin:40px 200px;
	border-radius:10px;
}

.div6{
	float:left;	
	width:300px;
	height:70px;
	margin:-70px 600px;
	border-radius:10px;
}


.divetc{
	text-align:center;
	font-size:23pt;
	font-weight:bold;
	line-height:70px;
}


</style>
</head>
<body>
<%
	MemberDTO dto = (MemberDTO)request.getAttribute("dto");
	String member_id = (String) session.getAttribute("member_id");
%>	
<div class="div3">
<div class="div4">
<div class="divetc">✏내정보</div>
</div>
</div>
<div class="div1">
<div class="myinfo1"><%=dto.getMember_id() %>님의 회원정보</div>
<div class="div2">
<dl><dt>이름:</dt><dd align="center"><%=dto.getMember_name() %></dd></dl><br><br>
<dl><dt>이메일:</dt><dd align="center"><%=dto.getMember_email() %></dd></dl><br><br>
<dl><dt>전화번호:</dt><dd align="center"><%=dto.getMember_phone() %></dd></dl><br><br>
<dl><dt>주소:</dt><dd align="center"><%=dto.getMember_address() %></dd></dl><br><br>
<dl><dt>직급:</dt><dd align="center"><%=dto.getPosition_name() %></dd></dl><br><br>
<dl><dt>부서:</dt><dd align="center"><%=dto.getGroup_name() %></dd></dl><br><br><br><br>
</div>
</div>
</body>
</html>