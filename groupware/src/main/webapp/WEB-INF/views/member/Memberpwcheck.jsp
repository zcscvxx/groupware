<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.spring.mvc.member.MemberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- <script>	
	function checkpass(){
		var pass = document.memberpwcheckProc.member_password.value;		
		if(pass.length == 0 || pass.length == null){
        	alert("비밀번호를 입력해 주세요");
        	return false;
		}
    }		
</script> -->

<style>
.div3{
	float:left;	
	border:1px solid #87cefa;
	width:900px;
	height:70px;
	margin:40px 151px;
	border-radius:10px;
}

.div5{
	float:left;	
	border-right:1px solid #87cefa;
	width:900px;
	height:70px;
	margin:0px 0px;
	border-radius:10px;
	background-color:#b0c4de;
}


.divetc{
	text-align:center;
	font-size:23pt;
	font-weight:bold;
	line-height:70px;
}

.div1{
	float:left;
	width:500px;
	height:300px;
	margin:0px 360px;
	border:1px solid #000000;
	border-radius:10px;
}

.div2{
	float:left;
	width:50%;
	height:100px;
	border:1px solid #87cefa;
	margin:20px 130px;
	border-radius:10px;
}

.div6{
	text-align:center;
	line-height:150px;
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
dt{
	float:left;
}

.btnsub{
	display: inline-block;
	margin: 5px 0;
	padding: .5em .75em;
	border-radius: .25em;
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	background: transparent;
	outline: 0;
	vertical-align: middle;
	font-family: inherit;
	font-size: 14px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	color:#191970;
	background-color:#40e0d0;
}

.divetc2{
	text-align:center;
	font-size:10pt;
	line-height:normal;
	margin:35px 0px;
}

</style>

</head>
<body>
<%
	MemberDTO dto = (MemberDTO)request.getAttribute("dto");
	String member_id = (String) session.getAttribute("member_id");
	String member_password = (String) session.getAttribute("member_password");
%>
<form id="memberpwcheckProc" name="memberpwcheckProc" action="memberpwcheckProc" method="post" onsubmit="javascript:return checkpass();">
<div class="div3">
<div class="div5">
<div class="divetc">✍정보수정</div>
</div>
</div>

<div class="div1">
<div class="myinfo1">비밀번호확인</div>
<div class="div2">
<div class="div6">
<div class="divetc2"><dl><dt>비밀번호:</dt><dd align="center"><input type="password" name="member_password2"></dd></dl></div></div>
</div>
<div><center><input class="btnsub" type="submit" value="정보수정으로"></center></div>
</div>
</form>
</body>
</html>