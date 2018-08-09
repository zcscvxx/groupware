<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복체크</title>
<style>
.btnsub{
	display: inline-block;
	margin: 5px 0;
	padding: .5em .75em;
	border-radius: .25em;
	box-sizing: content-box;
	-moz-box-sizing: content-box;
	outline: 0;
	vertical-align: middle;
	font-size: 14px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	color:#cd853f;
	background-color:#ffefd5;
}

.div1{
	width:200px;
	height:80px;
	border:1px solid #000000;
	border-radius:10px;
}

.div2{
	width:200px;
	height:80px;
	border:1px solid #87cefa;
	border-radius:10px;
}

</style>
</head>
<body>
<%
	int cnt = (Integer)request.getAttribute("cnt");
	if(cnt == 1){
		%>
		<div class="div1">아이디가 중복입니다.
		<%
	}else{
		%>
		<div class="div2">사용가능한 아이디입니다.
		<%
	}
%>
<dt align="center"><input class="btnsub" type="button" value="닫기" onclick="window.close()"></dt></div></div>
</body>
</html>