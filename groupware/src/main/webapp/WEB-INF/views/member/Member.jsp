<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.spring.mvc.member.MemberDTO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<script>

	function passwordcheckk(){
		var member_password = document.getElementById("member_password").value;
		var member_passwordcheck = document.getElementById("member_passwordcheck").value;
		
		if(member_passwordcheck == ""){
			document.getElementById("same").innerHTML=""
		}
		else if(member_password != member_passwordcheck){
			document.getElementById("same").innerHTML="<b><font color=red size=2px>비밀번호가 일치X</font></b>"
		}
		else{
			document.getElementById("same").innerHTML="<b><font color=blue size=2px>비밀번호 일치</font></b>"
		}
	}
	
	
	function popupOpen() {
		var member_id = document.getElementById("member_id").value;
		var popUrl = "checkidview?member_id=" + member_id; //팝업창에 출력될 페이지 URL
		var windowW = 220;  // 창의 가로 길이
        var windowH = 100;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		window.open(popUrl,"","top="+top+", left="+left+", height="+windowH+", width="+windowW);

	}
	
		
	function checkmethod(){
		var id = document.memberProc.member_id.value;
		var name = document.memberProc.member_name.value;
		var pass = document.memberProc.member_password.value;
		var passcheck = document.memberProc.member_passwordcheck.value;
		var address = document.memberProc.member_address.value;
		var pwexp = "^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$";
		var emailexp = "^[a-zA-Z0-9.!#$%&'+\/=?^_'{|}!-]+@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$";
		var phoneexp = "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}";
		
	if( id.length == 0 || id == null){
		alert("아이디를 입력해주세요.");
		document.memberProc.member_id.focus();
		return false;
		
	}else if( name.length == 0 || name == null){
		alert("이름을 입력해주세요.");
		document.memberProc.member_name.focus();
		return false;	
		
	}else if( pass.length<8 || pass == null){
		alert("비밀번호를 입력해주세요(8글자 이상).");
		document.memberProc.member_password.focus();
		return false;
		
	}else if(!document.memberProc.member_password.value.match(pwexp)){
		alert("비밀번호는 8~20자리의 숫자와 영문을 조합해주세요");
		document.memberProc.member_password.focus();
		return false;
		
	}else if(passcheck.length == 0 || passcheck == null){
		alert("비밀번호 확인을 입력해주세요");
		document.memberProc.member_password.focus();
		return false;
		
	}else if(!document.memberProc.member_phone.value.match(phoneexp)){
		alert("전화번호 형식에 맞게 써주세요.");
		document.memberProc.member_phone.focus();
		return false;
				
	}
	else if(!document.memberProc.member_email.value.match(emailexp)){
		alert("이메일 형식에 맞게 써주세요.");
		document.memberProc.member_email.focus();
		return false;
		
	}else if(address == 0 || name == null){
		alert("주소를 입력해주세요.");
		document.memberProc.member_address.focus();
		return false;
		
	}else{
		document.memberProc.submit();
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
	background-color:#b0c4de;
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

.div1{
	float:left;
	width:900px;
	height:600px;
	border:1px solid #000000;
	border-radius:10px;
}

.div2{
	float:left;
	width:650px;
	height:400px;
	border:1px solid #87cefa;
	margin:20px 120px;
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
	outline: 0;
	vertical-align: middle;
	font-size: 14px;
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
	color:#191970;
	background-color:#40e0d0;
}

.inputtext1{
	margin:0px -118px;
}

.inputtext2{
	margin:0px -66px;
}

.inputtext3{
	margin:0px -32px;
}

.inputtext4{
	margin:0px 0px;
}


.inputtext5{
	margin:0px -32px;
}

.inputtext6{
	margin:0px -47px;
}

.inputtext7{
	margin:0px -63px;
}


.div8{
	margin:
}

</style>

</head>
<body>
<center>
<form id="memberProc" name="memberProc" action="memberProc" method="post" onsubmit="javascript:return checkmethod();">

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
<div class="myinfo1">회원가입입력란</div>
<!-- <span id="same"></span> -->
<div class="div2">
<dl><dt>아이디:</dt><dd align="center"><div class="inputtext1"><input type="text" name="member_id" onkeyup="idcheck()" id="member_id">
<input type="button" onclick="location.href='javascript:popupOpen();'" value="중복체크"></div></dd></dl>
<dl><dt>이름</dt><dd align="center"><div class="inputtext2"><input type="text" name="member_name"></div></dd></dl>
<dl><dt>비밀번호:</dt><dd align="center"><div class="inputtext3"><input type="password" name="member_password" id="member_password"></div></dd></dl>
<dl><dt>비밀번호확인:</dt><dd align="center"><div class="inputtext4"><input type="password" name="member_passwordcheck" id="member_passwordcheck" onkeyup="javascript:passwordcheckk();"><div class="same"><span id="same"></span></div></div></dd></dl>
<dl><dt>전화번호:</dt><dd align="center"><div class="inputtext5"><input type="text" name="member_phone"></div></dd></dl>
<dl><dt>이메일:</dt><dd align="center"><div class="inputtext6"><input type="text" name="member_email"></div></dd></dl>
<dl><dt>주소:</dt><dd align="center"><div class="inputtext7"><input type="text" name="member_address"></div></dd></dl>
<dl><dt>직급</dt><dd><select name="position_num">
<option value="1">사원</option>
<option value="2">대리</option>
<option value="3">팀장</option>
<option value="4">부장</option>
<option value="5">사장</option>
</select></dd></dl>
<dl><dt>부서</dt><dd><select name="group_num">
<option value="1">기획부</option>
<option value="2">영업부</option>
<option value="3">생산부</option>
</select></dd></dl>
</div>
<div class="div8"><input class="btnsub"  type="submit" value="다음으로"></div>

</div>
</form>
</center>
</body>
</html>