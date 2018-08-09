<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>VISION GROUPWARE</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<link
	href="${pageContext.servletContext.contextPath }/resources/css/login.css"
	rel="stylesheet" type="text/css">
<script>
	function memberjoin() {
		window.open("memberclause", "", "width=920 height=750")
	}
</script>
</head>
<body>

	<div class="login-page">
		<div class="form">
			<img
				src="${pageContext.servletContext.contextPath}/resources/img/img_login.jpg" />

			<form class="login-form" name="loginform" method="post" action="loginproc">
				<input name="employeeNo" id="employeeNo" placeholder="아이디를 입력하세요" />
				<input type="password" name="password" id="password"
					placeholder="비밀번호를 입력하세요" />
				<button>login</button>
				<p class="message">
					계정이 없으신가요? <a href="memberclause"
						onclick="memberjoin();return false;">회원가입</a>
				</p>
			</form>
		</div>
	</div>

</body>
</html>