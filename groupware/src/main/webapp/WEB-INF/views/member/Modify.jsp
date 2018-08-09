<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.spring.mvc.member.MemberDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 수정</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	function checketc(){
	
		var emailexp = "^[a-zA-Z0-9.!#$%&'+\/=?^_'{|}!-]+@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$";
		var phoneexp = "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}";
		var address = document.modifyProc.member_address.value;
		
		if(!document.modifyProc.member_email.value.match(emailexp)){
			alert("이메일 형식에 맞게 써주세요.");
			document.modifyProc.member_email.focus();
			return false;
		}else if(!document.modifyProc.member_phone.value.match(phoneexp)){
			alert("전화번호 형식에 맞게 써주세요.");
			document.modifyProc.member_phone.focus();
			return false;
		}else if(address.length == 0){
			alert("주소를 입력해주세요.");
			document.modifyProc.member_address.focus();
			return false;
			
		}else{
			document.modifyProc.submit();
			return true;
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

.div4{
	float:left;	
	border-right:1px solid #87cefa;
	width:450px;
	height:70px;
	background-color:#b0c4de;
}

.div6{
	float:left;	
	width:450px;
	height:70px;
	margin:-70px 450px;
}


.divetc{
	text-align:center;
	font-size:23pt;
	font-weight:bold;
	line-height:70px;
	color:#778899;
}

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
	width:50%;
	height:400px;
	border:1px solid #87cefa;
	margin:20px 190px;
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

.inputtext1{
	margin:0px -10px;
}

.inputtext2{
	margin:0px -30px;
}


.inputtext5{
	margin:0px -15px;
}

.inputtext6{
	margin:0px -30px;
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
<form id="modifyProc" name="modifyProc" action="modifyProc" method="post" onsubmit="javascript:return checketc();">
<%
	String member_id = (String) session.getAttribute("member_id");
	String member_name = (String) session.getAttribute("member_name");
%>
<div class="div3">
<div class="div4">
<div class="divetc">✍정보수정</div>
</div>
<div class="div6">
<div class="divetc"><a class="delete test" href="memberdelete">✎회원탈퇴</a></div>
</div>
</div>
<div class="div1">
<div class="myinfo1">회원정보수정</div>
<div class="div2">
<dl><dt>아이디:</dt><dd align="center"><div class="inputtext1"><label name="member_id" id="member_id"><%=member_id %></label></div></dd></dl>
<dl><dt>이름</dt><dd align="center"><div class="inputtext2"><input type="text" name="member_name" value="<%=member_name %>" readonly></div></dd></dl>
<dl><dt>전화번호:</dt><dd align="center"><div class="inputtext4"><input type="text" name="member_phone"></div></dd></dl>
<dl><dt>이메일:</dt><dd align="center"><div class="inputtext5"><input type="text" name="member_email"></div></dd></dl>
<dl><dt>주소:</dt><dd align="center"><div class="inputtext6"><input type="text" name="member_address"></div></dd></dl>
<input type="hidden" id="member_id" name="member_id" value="<%=member_id %>">
</div>
<div><center><input class="btnsub" type="submit" value="수정하기"></center></div>
</div>
</form>
</body>
</html>