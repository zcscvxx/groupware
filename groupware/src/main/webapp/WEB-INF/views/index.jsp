<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainpage/css/reset.css">
<!-- CSS reset -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mainpage/css/style.css">
<!-- Resource style -->
<script
	src="${pageContext.request.contextPath}/resources/mainpage/js/modernizr.js"></script>
<!-- Modernizr -->

<title>GroupWare</title>
</head>
<style>
.container {
  width: 1700px;
  max-width: none !important;
}
</style>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String center = request.getParameter("center");
		session.setMaxInactiveInterval(60 * 60 * 24);
		if (center == null) {
			center = "Center.jsp";
		}
		String member_id = (String) session.getAttribute("member_id");
		String member_password = (String) session.getAttribute("member_password");
		String member_name = (String) session.getAttribute("member_name");
	%>
	<header class="cd-main-header">
		<a href="index" class="cd-logo"><img
			src="${pageContext.request.contextPath}/resources/mainpage/img/logo4.PNG" width="125" alt="Logo"></a> <a href="#0" class="cd-nav-trigger" style="text-decoration:none;">Menu<span></span></a>
		
		<nav class="cd-nav">
			<ul class="cd-top-nav">
				<li class="has-children account"><a href="#0" style="text-decoration:none;"> Account </a>
					<ul>
						<li><a href="#" style="text-decoration:none;"><%=member_name %>님 환영합니다.</a></li>
						<li><a href="myinfomember?member_id=<%=member_id%>" style="text-decoration:none;">My Account</a></li>
						<li><a href="memberpwcheck?member_id=<%=member_id%>" style="text-decoration:none;">Edit Account</a></li>
						<li><a href="logout" style="text-decoration:none;">Logout</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
	<!-- .cd-main-header -->
	
	<main class="cd-main-content">
	<nav class="cd-side-nav">
		<ul>
			<li class="cd-label">Electronic Approval</li>
			<li class="has-children overview"><a href="#0" style="text-decoration:none;">전자결재</a>
				<ul>
					<li class="has-children overview"><a href="draftinglist" style="text-decoration:none;">기안서</a>
						<ul>
							<li><a href="inglist" style="text-decoration:none;">진행중인 기안서</a></li>
							<li><a href="complitelist" style="text-decoration:none;">완료된 기안서</a></li>
						</ul></li>
					<li class="has-children overview"><a href="list_business?member_id=<%=member_id%>" style="text-decoration:none;">업무일지</a>
						<ul>
							<li><a href="list_Proceeding?member_id=<%=member_id%>" style="text-decoration:none;">진행중인 업무일지</a></li>
							<li><a href="list_Approved?member_id=<%=member_id%>" style="text-decoration:none;">완료된 업무일지</a></li>
							<li><a href="list_Companion?member_id=<%=member_id%>" style="text-decoration:none;">반려된 업무일지</a></li>
						</ul></li>
				</ul></li>

			<li class="cd-label">E-MAIL</li>
			<li class="has-children comments"><a href="rcvMail?pagenum=1&contentnum=15" style="text-decoration:none;">이메일</a>
				<ul>
					<li><a href="writeMail" style="text-decoration:none;">메일쓰기</a></li>
					<li><a href="rcvMail?pagenum=1&contentnum=15" style="text-decoration:none;">받은편지함</a></li>
					<li><a href="sendMail?pagenum=1&contentnum=15" style="text-decoration:none;">보낸편지함</a></li>
					<li><a href="saveMail?pagenum=1&contentnum=15" style="text-decoration:none;">임시저장</a></li>
					<li><a href="trashMail?pagenum=1&contentnum=15" style="text-decoration:none;">휴지통</a></li>
				</ul></li>
		</ul>

		<ul>
			<li class="cd-label">Bulletin Board</li>
			<li class="has-children bookmarks"><a href="#0" style="text-decoration:none;">게시판</a>
				<ul>
					<li><a href="board_list_notice" style="text-decoration:none;">공지사항</a></li>
					<li><a href="board_list" style="text-decoration:none;">자유게시판</a></li>
				</ul></li>
		</ul>

		<ul>
			<li class="cd-label">Calendar</li>
			<li class="has-children bookmarks"><a href="#0" style="text-decoration:none;">일정</a>

				<ul>
					<li><a href="eventsMain" style="text-decoration:none;">일정</a></li>
					<li><a href="addEvent" style="text-decoration:none;">일정추가</a></li>
				</ul></li>
		</ul>
		
		<ul>
			<li class="cd-label">Company System Table</li>
			<li class="has-children users"><a href="member_list" style="text-decoration:none;">회사 조직도</a></li>
		</ul>
		

	</nav>
	<br><br><br>
<!-- 	<div class="container"> -->
	<jsp:include page="<%=center%>"/>
<!-- 	</div> -->
	<!-- .content-wrapper --> </main>
	<!-- .cd-main-content -->
	<script src="${pageContext.request.contextPath}/resources/mainpage/js/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mainpage/js/jquery.menu-aim.js"></script>
	<script src="${pageContext.request.contextPath}/resources/mainpage/js/main.js"></script>
	<!-- Resource jQuery -->
</body>
</html>