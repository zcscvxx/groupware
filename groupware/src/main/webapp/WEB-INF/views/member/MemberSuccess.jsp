<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 완료</title>
<style>
.div3{
	float:left;	
	border:1px solid #87cefa;
	width:900px;
	height:70px;
	border-radius:10px;
}

.div4{
	float:left;	
	border-right:1px solid #87cefa;
	width:300px;
	height:70px;
	border-radius:10px;
	
}

.div5{
	float:left;	
	border-right:1px solid #87cefa;
	width:300px;
	height:70px;
	margin:-70px 300px;
	border-radius:10px;
}

.div6{
	float:left;	
	width:300px;
	height:70px;
	margin:-70px 600px;
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
	width:900px;
	height:600px;
	border:1px solid #000000;
	border-radius:10px;
}

.div2{
	float:left;
	width:540px;
	height:400px;
	border:1px solid #87cefa;
	margin:20px 150px;
	border-radius:10px;
}

.btnsub{
	display: inline-block;
	margin: 5px 400px;
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

.success1{
	font-size:20pt;
	font-weight:bold;
}
</style>
</head>
<body>
<div class="div3">
<div class="div4">
<div class="divetc">✏회원약관</div>
</div>
<div class="div5">
<div class="divetc">✍회원가입</div>
</div>
<div class="div6">
<div class="divetc">✎가입완료</div>
</div>
</div>
<div class="div1">
<div class="div2">
<div class="success1">축하드립니다!회원가입에 성공하셨습니다.</div>
</div>
<div><input class="btnsub" type="button" value="닫기" onclick="window.close()"></div>
</div>
</form>
</body>
</html>