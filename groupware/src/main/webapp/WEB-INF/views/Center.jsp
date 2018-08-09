<%@page import="com.spring.mvc.business_doc.Business_doc_Dto"%>
<%@page import="com.spring.mvc.drafting_doc.Drafting_Dto"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.mvc.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.mvc.events.Events_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincalendar/style.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/maincalendar/calendar.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>VISION GROUPWARE</title>
</head>
<style>
/* .mytable {
	border-collapse: collapse;
}

.mytable th, .mytable td {
	border: 1px solid black;
} */
table.high{
	width:90%;
}
table.table.table-hover{
		width:90%;
		max-width:500px;
		font-size:1.0sem;
	}
@media screen and (max-width:520px){
	table.table.table-hover{
		min-width:360px;
		font-size:1em;
	}
}
</style>
<script>
	function popupOpenEvent(event_id) {
		var popUrl = "viewEvent?event_id=" + event_id; //팝업창에 출력될 페이지 URL
		var popOption = "width=430, height=430, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
	function popupOpenBoard(board_num) {
		var popUrl = "board_content_view_popup?board_num=" + board_num; //팝업창에 출력될 페이지 URL
		var popOption = "width=600, height=550, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
</script>
<body>
	<br>
	<br>
	<br>
	<br>
	<%
		List<Events_Dto> events_list = (List<Events_Dto>) request.getAttribute("events_list");
		ArrayList<BoardDto> dto = (ArrayList<BoardDto>) request.getAttribute("board_list_notice");
		List<Drafting_Dto> drafting_list = (List<Drafting_Dto>) request.getAttribute("drafting_list");
		List<Business_doc_Dto> business_list = (List<Business_doc_Dto>) request.getAttribute("business_list");
		
		String member_id = (String) session.getAttribute("member_id");
	
	%>
	
	<center>
		<table class="mytable" width="80%">
			<tr height="350">
				<td width="500" align="center">
				<table class="high">
						<tr>
							<td style="width: 470px;" align="center"><font size="5">최신 메일</font>
							<td>
							<td><a href="rcvMail?pagenum=1&contentnum=15" class="glyphicon glyphicon-plus" style="color:black;"></a></td>
						</tr>
					</table>
					<table class="table table-hover">
						<tr class="active">
							<td width="50" align="center">메일 제목</td>
							<td width="50" align="center">보낸사람</td>
							<td width="50" align="center">지난 시간</td>
						</tr>
						<c:forEach items="${listRecentMail}" var="dto">
							<tr>
								<td><a href="readMailRcv?mail_num=${dto.mail_num}">${dto.mail_title}</a></td>
								<td><a
									href="writeMailClick?mail_rcvmember=${dto.member_id}">${dto.member_id}</a></td>
								<td>${dto.lefted}</td>
							</tr>
						</c:forEach>
					</table>
				</td>
				<td width="500"> <!-- 공지사항  -->
				<table class="high">
				<tr>
					<td style="width:470px;" align="center"><font size="5">공지사항</font><td>
					<td><a href="board_list_notice" class="glyphicon glyphicon-plus" style="color:black;"></a></td>
				</tr>
				</table>
					<table class="table table-hover">
						<tr class="active">
							<td width="50" align="center">작성자</td>
							<td width="50" align="center">제목</td>
							<td width="50" align="center">날짜</td>
						</tr>
						<tr>
							<%
								for (BoardDto x : dto) {
							%>
						
						<tr>
							<td align="center"><%=x.getMember_name()%></td>
							<td align="left"><a
								href='javascript:popupOpenBoard("<%=x.getBoard_num()%>");'><%=x.getBoard_title()%></a></td>
							<td align="center"><fmt:formatDate value="<%=x.getBoard_regdate()%>" pattern="yy-MM-dd hh:mm" /></td>
						</tr>
						<%
							}
						%>
					</table></td>
				<td width="500" align="center"></td>
			</tr>
			<tr height="350">
				<td width="500" align="center">
					<!-- 기안서  -->
					<table class="high">
						<tr>
							<td style="width: 470px;" align="center"><font size="5">기안서</font>
							<td>
							<td><a href="draftinglist"
								class="glyphicon glyphicon-plus" style="color: black;"></a></td>
						</tr>
					</table>
					<table class="table table-hover">
						<tr class="active">
							<td width="50" align="center">작성자</td>
							<td width="50" align="center">제목</td>
							<td width="50" align="center">진행상태</td>
						</tr>
						<tr>
							<%
								for (Drafting_Dto drafting_dto : drafting_list) {
							%>
						
						<tr>
							<td align="center"><%=drafting_dto.getMember_name()%></td>
							<td align="left"><a href="draftingview?drafting_num=<%=drafting_dto.getDrafting_num()%>"><%=drafting_dto.getDrafting_title()%></a></td>
							<td align="center">
							<%
								if(drafting_dto.getCondition_num()==1){
								%>
									<button type="button" class="btn btn-default btn-sm">진행중</button>
								<%
									}else if((drafting_dto.getCondition_num() ==  3)){
								%>
										<button type="button"  class="btn btn-default btn-sm" style="background-color: #F25E5E; color:#FCFCFC;">결재반려</button>
										<%
									}else{
										%>
										<button type="button" class="btn btn-default btn-sm" style="background-color: #A5A3A3; color:#FCFCFC;">결재승인</button>
										<%}%>
						</td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
				<td width="500" align="center">
					<table class="high">
						<tr>
							<td style="width: 470px;" align="center"><font size="5">업무 일지</font>
							<td>
							<td><a href="list_business?member_id=<%=member_id%>"
								class="glyphicon glyphicon-plus" style="color: black;"></a></td>
						</tr>
					</table>
					<table class="table table-hover">
						<tr class="active">
							<td width="50" align="center">작성자</td>
							<td width="50" align="center">제목</td>
							<td width="50" align="center">진행상태</td>
						</tr>
						<tr>
							<%
								for (Business_doc_Dto business_dto : business_list) {
							%>
						
						<tr>
							<td align="center"><%=business_dto.getMember_name()%></td>
							<td align="left"><a href="business_doc_select?business_num=<%=business_dto.getBusiness_num()%>"><%=business_dto.getBusiness_title()%></a></td>
							<td align="center">
							<%
								if(business_dto.getCondition_num()==1){
								%>
									<button type="button" class="btn btn-default btn-sm">진행중</button>
								<%
									}else if((business_dto.getCondition_num() ==  3)){
								%>
										<button type="button"  class="btn btn-default btn-sm" style="background-color: #F25E5E; color:#FCFCFC;">결재반려</button>
										<%
									}else{
										%>
										<button type="button"class="btn btn-default btn-sm"
									style="background-color: #00C3FF; color: #FCFCFC;"">결재승인</button>
										<%}%>
						</td>
						</tr>
						<%
							}
						%>
					</table>
				
				</td>
				<td width="500" align="center">
					<table class="high">
					<tr>
						<td style="width:470px;" align="center"><font size="5">오늘의 일정</font><td>
						<td><a href="eventsMain" class="glyphicon glyphicon-plus" style="color:black;"></a></td>
					</tr>
					</table>
					<table class="table table-hover">
						<tr class="active">
							<td style="width:130px;" align="center">이름</td>
							<td align="center">일정 내용</td>
						</tr>
						<%
							for (Events_Dto event_dto : events_list) {
						%>
						<tr>
							<td align="center"><%=event_dto.getMember_name()%></td>
							<td><a href="javascript:popupOpenEvent(<%=event_dto.getEvent_id()%>)"><%=event_dto.getEvent_name()%></a></td>
						</tr>
						<%
							}
						%>
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>