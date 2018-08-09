<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script>
	
	function checkValue(){
        if(!document.deleteProc.member_id.value){
            alert("아이디를 입력해 주세요");
            return false;
        }else if(!document.deleteProc.member_password.value){
        	alert("비밀번호를 입력해 주세요");
        	return false;
        }
    }
	
</script>

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
	width:450px;
	height:70px;
}

.div6{
	float:left;	
	width:450px;
	height:70px;
	margin:-70px 450px;
	background-color:#b0c4de;
}
.modify.test:hover{
	color:#0000cd;
	text-decoration:none;
	background-color:#87cefa;
}

.delete.test:hover{
	color:#0000cd;
	text-decoration:none;
	background-color:#87cefa;
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

</style>

</head>
<body>
<form id="deleteProc" name="deleteProc" action="deleteProc" method="post" onsubmit="return checkValue()">
<%
	String member_id = (String) session.getAttribute("member_id");
%>
<div class="div3">
<div class="div5">
<div class="divetc"><a class="modify test" href="Modify?member_id=<%=member_id%>">✍정보수정</a></div>
</div>
<div class="div6">
<div class="divetc"><a class="delete test" href="memberdelete">✎회원탈퇴</a></div>
</div>
</div>

<div class="div1">
<div class="myinfo1">회원탈퇴</div>
<div class="div2">
<dl><dt>아이디:</dt><dd><input type="text" name="member_id"></dd></dl>
<dl><dt>비밀번호:</dt><dd><input type="password" name="member_password"></dd></dl>
</div>
<div><center><input class="btnsub" type="submit" value="탈퇴하기"></center></div>
</div>
</form>
</body>
</html>