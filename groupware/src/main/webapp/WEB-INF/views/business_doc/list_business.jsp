<%@page import="com.spring.mvc.business_doc.Business_doc_Dto"%>
<%@page import="com.spring.mvc.business_doc.Business_doc_Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	media="screen" type="text/css">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>

</head>
<body>

	<%
		String member_id = (String) session.getAttribute("member_id");
		String member_name = (String) session.getAttribute("member_name");
		Business_doc_Dto dto = (Business_doc_Dto) request.getAttribute("dto");
		pageContext.setAttribute("br", "<br/>");
		pageContext.setAttribute("cn", "\n");
		List<Business_doc_Dto> dtos2 = (List<Business_doc_Dto>) request.getAttribute("list2");

		int totalRecodSize = dtos2.size(); // 게시글의 총 수
		int recodSizePerPage = 3; // 한 페이지의 몇개의 게시글이 나오나
		int pageSizePerBlock = 5;// 블록당 페이지 수
		int curBlock = 0; // 페이지 블록 처리 변수
		if (request.getAttribute("curBlock") != null) {
			curBlock = Integer.parseInt(request.getAttribute("curBlock").toString());
		}
		int curPage = curBlock * pageSizePerBlock; // 게시글의 시작번호를 처리해주는 변수
		if (request.getAttribute("curPage") != null) {
			curPage = Integer.parseInt(request.getAttribute("curPage").toString());
		}
		int beginNum = curPage * recodSizePerPage; // 게시글의 시작 번호
		// 정수나누기 정수를하면 소수점을 날리기때문에 올림처리를 해줘야한다
		int pageSize = (int) Math.ceil((double) totalRecodSize / recodSizePerPage); // 총페이지수
		session = request.getSession();
	%>

	<!--  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<br>
	<div class="container">

		<h4>업무일지 진행문서(최신순으로 게시)</h4>
			<div style="text-align:right;">
		<a href="list_Proceeding?member_id=<%=member_id%>" class="btn btn-default" style="background-color: #3E454C; color:#FCFCFC;">진행중인 문서 더 보기</a><br>
		</div>
		<center>
			<table class=" table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">문서 번호</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%">제목</th>
				
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="25%">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="5%">결제상태</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%"></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list}" var="dto" begin="<%=beginNum%>"
						end="<%=beginNum+recodSizePerPage-1%>">
						<tr>
							<td>${dto.business_num}</td>
							<td><a
								href="business_doc_select?business_num=${dto.business_num}"
								style="color: black; text-decoration: none;">${dto.business_title}</a></td>
			
							<td>${dto.member_name}</td>
							<td>${dto.business_date}</td>
							<td><c:choose>
									<c:when test="${dto.condition_name eq '결재반려'}">
										<button class="btn btn-default btn-sm"
											style="background-color: #F25E5E; color: #FCFCFC;">${dto.condition_name }</button>
									</c:when>
									<c:when test="${dto.condition_name eq '진행중'}">
										<button class="btn btn-default btn-sm">${dto.condition_name }</button>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							<td>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='business_doc_select?business_num=${dto.business_num}'">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>

								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='selectUpdate?business_num=${dto.business_num}'">
									<span class="glyphicon glyphicon glyphicon-pencil"
										aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='business_doc_delete?business_num=${dto.business_num}&member_id=${dto.member_id}'">
									<span class="glyphicon glyphicon glyphicon glyphicon-trash"
										aria-hidden="true"></span>
								</button>

							</td>
						</tr>
						
					</c:forEach>
					<tr>
						<td colspan="6" align=center>
							<%
								if (curBlock > 0) {
							%> 
	<input type="button" class="btn btn-default" onClick="location.href='list_business?curBlock=<%=curBlock - 1%>'" value="이전"> <%
 	}
 %> <%
 	int startPage = curBlock * pageSizePerBlock; // 블록의 시작페이지
 	int endPage = startPage + pageSizePerBlock; // 블록의 끝페이지
 	int a = pageSize / pageSizePerBlock;

 	for (int i = startPage; i < endPage; i++) {
 		if (pageSize <= i) break;
 %> <input type="button" class="btn btn-default" onClick="location.href='list_business?curBlock=<%=curBlock%>&curPage=<%=i%>'"
 	 value=<%=i + 1%>> <%
 	}

 	if (curBlock < pageSize / pageSizePerBlock && (double) curBlock + 1 != (double) pageSize / pageSizePerBlock) {
 %> <input type="button" class="btn btn-default" onClick="location.href='list_business?curBlock=<%= curBlock+1%>'" value="다음"> 
 <%
 	}
 %>
						</td>
					</tr>

				</tbody>
			</table>


		</center>
		<br> <a  href="/mvc/writeForm" class="btn btn-default"
			style="background-color: #3E454C; color: #FCFCFC;">업무일지 작성</a><br>

		<br>
		<center></center>
	<!--  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<%


			Business_doc_Dto dtoo = (Business_doc_Dto) request.getAttribute("dto");
			List<Business_doc_Dto> dtos4 = (List<Business_doc_Dto>) request.getAttribute("list4");
		
			int totalRecodSize3 = dtos4.size(); // 게시글의 총 수
			int recodSizePerPage3 = 3; // 한 페이지의 몇개의 게시글이 나오나
			int pageSizePerBlock3 = 5;// 블록당 페이지 수
			int curBlock3 = 0; // 페이지 블록 처리 변수
			if (request.getAttribute("curBlock3") != null) {
				curBlock3 = Integer.parseInt(request.getAttribute("curBlock3").toString());
			}
			int curPage3 = curBlock3 * pageSizePerBlock3; // 게시글의 시작번호를 처리해주는 변수
			if (request.getAttribute("curPage3") != null) {
				curPage3 = Integer.parseInt(request.getAttribute("curPage3").toString());
			}
			int beginNum3 = curPage3 * recodSizePerPage3; // 게시글의 시작 번호
			// 정수나누기 정수를하면 소수점을 날리기때문에 올림처리를 해줘야한다
			int pageSize3 = (int) Math.ceil((double) totalRecodSize3 / recodSizePerPage3); // 총페이지수
			session = request.getSession();
		%>
	<br>
	<div class="container">

		<h4>업무일지 반려문서(최신순으로 게시)</h4>
			<div style="text-align:right;">
		<a href="list_Companion?member_id=<%=member_id%>" class="btn btn-default" style="background-color: #3E454C; color:#FCFCFC;">진행중인 문서 더 보기</a><br>
		</div>
		<center>
			<table class=" table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">문서 번호</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%">제목</th>
				
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="25%">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="5%">결제상태</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%"></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list4}" var="dtos4" begin="<%=beginNum3%>"
						end="<%=beginNum3+recodSizePerPage3-1%>">
						<tr>
							<td>${dtos4.business_num}</td>
							<td><a
								href="business_doc_select?business_num=${dtos4.business_num}"
								style="color: black; text-decoration: none;">${dtos4.business_title}</a></td>
			
							<td>${dtos4.member_name}</td>
							<td>${dtos4.business_date}</td>
							<td><c:choose>
									<c:when test="${dtos4.condition_name eq '결재반려'}">
										<button class="btn btn-default btn-sm"
											style="background-color: #F25E5E; color: #FCFCFC;">${dtos4.condition_name }</button>
									</c:when>
									<c:when test="${dtos4.condition_name eq '진행중'}">
										<button class="btn btn-default btn-sm">${dtos4.condition_name }</button>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							<td>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='business_doc_select?business_num=${dtos4.business_num}'">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
				
						
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='selectUpdate2?business_num=${dtos4.business_num}'">
									<span class="glyphicon glyphicon glyphicon-pencil"
										aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='business_doc_delete?business_num=${dtos4.business_num}&member_id=${dtos4.member_id}'">
									<span class="glyphicon glyphicon glyphicon glyphicon-trash"
										aria-hidden="true"></span>
								</button>
					
							</td>
						</tr>
						
					</c:forEach>
					<tr>
					<td colspan="6" align=center>
							<%
								if (curBlock3 > 0) {
							%> 
	<input type="button" class="btn btn-default" onClick="location.href='list_business?curBlock3=<%=curBlock3 - 1%>'" value="이전"> <%
 	}
 %> <%
 	int startPage3 = curBlock3 * pageSizePerBlock3; // 블록의 시작페이지
 	int endPage3 = startPage3 + pageSizePerBlock3; // 블록의 끝페이지
 	int a3 = pageSize3 / pageSizePerBlock3;

 	for (int i = startPage3; i < endPage3; i++) {
 		if (pageSize3 <= i) break;
 %> <input type="button" class="btn btn-default" onClick="location.href='list_business?curBlock3=<%=curBlock%>&curPage3=<%=i%>'"
 	 value=<%=i + 1%>> <%
 	}

 	if (curBlock3 < pageSize3 / pageSizePerBlock3 && (double) curBlock3 + 1 != (double) pageSize3 / pageSizePerBlock3) {
 %> <input type="button" class="btn btn-default" onClick="location.href='list_business?curBlock3=<%= curBlock+1%>'" value="다음"> 
 <%
 	}
 %>
						</td>
					</tr>

				</tbody>
			</table>


		</center>
		

		<center></center>


		<%
			List<Business_doc_Dto> dtos3 = (List<Business_doc_Dto>) request.getAttribute("list3");
			int totalRecodSize2 = dtos3.size(); // 게시글의 총 수
			int recodSizePerPage2 = 3; // 한 페이지의 몇개의 게시글이 나오나
			int pageSizePerBlock2 = 5;// 블록당 페이지 수
			int curBlock2 = 0; // 페이지 블록 처리 변수
			if (request.getAttribute("curBlock2") != null) {
				curBlock2 = Integer.parseInt(request.getAttribute("curBlock2").toString());
			}
			int curPage2 = curBlock2 * pageSizePerBlock2; // 게시글의 시작번호를 처리해주는 변수
			if (request.getAttribute("curPage2") != null) {
				curPage2 = Integer.parseInt(request.getAttribute("curPage2").toString());
			}
			int beginNum2 = curPage2 * recodSizePerPage2; // 게시글의 시작 번호
			// 정수나누기 정수를하면 소수점을 날리기때문에 올림처리를 해줘야한다
			int pageSize2 = (int) Math.ceil((double) totalRecodSize2 / recodSizePerPage2); // 총페이지수
		%>


		<hr>
		<br>
		<div style="text-align: left;">
			<h4>승인 완료됨</h4>
		</div>
		<div style="text-align:right;">
		<a href="list_Approved?member_id=<%=member_id%>" class="btn btn-default" style="background-color: #3E454C; color:#FCFCFC;">완료된 문서 더 보기</a><br>
		</div>
		<table class=" table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<center>
				<thead>

					<tr>
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">문서 번호</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%">제목</th>
						
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="15%">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="15%">결재일</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">결제상태</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="15%"></th>
					</tr>

				</thead>
				<tbody>
					<c:forEach items="${list3}" var="dtod" begin="<%=beginNum2%>"
						end="<%=beginNum2+recodSizePerPage2-1%>">
						<tr>
							<td>${dtod.business_num}</td>
							<td><a
								href="approved_View?business_num=${dtod.business_num}"
								style="color: black; text-decoration: none;">${dtod.business_title}</a></td>
							
							<td>${dtod.member_name}</td>
							<td>${dtod.business_date}</td>
							<td>${dtod.approved_date}</td>
							<td>
								<button class="btn btn-default btn-sm"
									style="background-color: #00C3FF; color: #FCFCFC;">${dtod.condition_name }</button>
							<td>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='approved_View?business_num=${dtod.business_num}'">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>

							</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="7" align=center>
								<%
									if (curBlock2 > 0) {
								%> <input type="button" class="btn btn-default"
								onClick="location.href='list_business?curBlock=<%=curBlock2 - 1%>'"
								value="이전"> <%
 	}
 %> <%
 	int startPage2 = curBlock2 * pageSizePerBlock2; // 블록의 시작페이지
 		int endPage2 = startPage2 + pageSizePerBlock2; // 블록의 끝페이지
 		int a2 = pageSize2 / pageSizePerBlock2;

 		for (int i = startPage2; i < endPage2; i++) {
 			if (pageSize2 <= i)
 				break;
 %> <input type="button" class="btn btn-default"
								onClick="location.href='list_business?curBlock2=<%=curBlock2%>&curPage2=<%=i%>'"
								value=<%=i + 1%>> <%
 	}

 		if (curBlock2 < pageSize2 / pageSizePerBlock2
 				&& (double) curBlock2 + 1 != (double) pageSize2 / pageSizePerBlock2) {
 %> <input type="button" class="btn btn-default"
								onClick="location.href='list_Approved?curBlock2=<%= curBlock2+1%>'"
								value="다음"> <%
 	}
 %>
							</td>
						</tr>
				</tbody>
		</table>


		<br> <br> <br> <br>
	</div>







	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>


</html>