<%@page import="java.util.List"%>
<%@page import="com.spring.mvc.drafting_doc.Drafting_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>

<% 					
					List<Drafting_Dto> inglist = (List<Drafting_Dto>)request.getAttribute("inglist");

					int totalRecodSize = inglist.size(); // 게시글의 총 수
					int recodSizePerPage = 5; // 한 페이지의 몇개의 게시글이 나오나
					int pageSizePerBlock = 4;// 블록당 페이지 수
					int curBlock = 0; // 페이지 블록 처리 변수
					if(request.getAttribute("curBlock") != null){
						curBlock = Integer.parseInt(request.getAttribute("curBlock").toString());
					}
					int curPage = curBlock*pageSizePerBlock; // 게시글의 시작번호를 처리해주는 변수
					if(request.getAttribute("curPage") != null){
						curPage = Integer.parseInt(request.getAttribute("curPage").toString());
					}
					int beginNum = curPage * recodSizePerPage; // 게시글의 시작 번호
					// 정수나누기 정수를하면 소수점을 날리기때문에 올림처리를 해줘야한다
					int pageSize = (int)Math.ceil((double)totalRecodSize/recodSizePerPage); // 총페이지수
				%>

<%-- <script>
function button_event(){
	if(confirm("정말 삭제하시겠습니까?") == ture){
		document.deleteform.submit();
	}
	else{
		return;
	}
}

</script>

	<center>
		<div>
			<h2>게시판</h2>
			<table width="500" class="table table-hover">
				<tr>
					<td>번호</td>
					<td>이름</td>
					<td>제목</td>
					<td>날짜</td>
					<td>히트</td>
				</tr>
				<c:forEach items="${list}" var="dto ">
					<tr>
						<td>${dto.drafting_num}</td>
						<td>${dto.drafting_title}</td>
						<td>${dto.drafting_content}</td>
						
						
						
					</tr>
				</c:forEach>

				<tr height="10">
					<td colspan="5" align="center"><a href="write_view"><input type="button" value="작성" class="btn btn-default"></a></td>
				</tr>

			</table>
		</div>
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</center>
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<title>게시판</title>
</head>
<body> --%>
	<br><br>	
	<div class="container">
	<font color="#1784c7"><h1>전자결재 [기안서]</h1></font>
	<hr>
	<h4> 기안 진행문서(최신순)</h4>
	<center>
	<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<thead>
		<tr>
		<th style="background-color: #eeeeee; text-align: center;" width="10%"> 문서 번호</th>
		<th style="background-color: #eeeeee; text-align: center;" width="30%"> 제목</th>
		<th style="background-color: #eeeeee; text-align: center;" width="10%"> 작성자</th>
		<th style="background-color: #eeeeee; text-align: center;" width="25%"> 작성일</th>
		<th style="background-color: #eeeeee; text-align: center;" width="10%"> 결제상태</th>
		<th style="background-color: #eeeeee; text-align: center;" width="15%"> </th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${inglist}" var="dto"  begin="<%=beginNum%>" end="<%=beginNum+recodSizePerPage-1%>">
			<tr>
			<td>${dto.drafting_num}</td>
			<td>${dto.drafting_title }</td>
			<td>${dto.member_name }</td>
			<td>${dto.drafting_date } </td>
			<td>
			<c:choose>
				<c:when test="${dto.condition_name eq '결재반려'}"> <button class="btn btn-default btn-sm" style="background-color: #F25E5E; color:#FCFCFC;">${dto.condition_name }</button></c:when>
				<c:when test="${dto.condition_name eq '진행중'}"> <button class="btn btn-default btn-sm">${dto.condition_name }</button></c:when>
				<c:otherwise> </c:otherwise>
			</c:choose>
				

				<td>
				<button type="button" class="btn btn-default btn-xs" onclick="location.href='draftingview?drafting_num=${dto.drafting_num}'">
  				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
				
				</td>
				</tr>
			</c:forEach>
	</tbody>
</table>	

<table>
		<tr>
		<th style="text-align: center;" width="10%"> <a href="/mvc/draftingwrite" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">기안서 작성</a></th>
		<th style="text-align: center;" width="30%"> </th>
		<th style="text-align: center;" width="10%"> </th>
		<th style="text-align: center;" width="25%"> </th>
		<th style="text-align: center;" width="10%"> </th>
		<th style="text-align: center;" width="15%"> <a href="/mvc/inglist" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">진행중인 문서 더 보기</a></th>
		</tr>
		</table>

		

</center>


	<center>
	
	</center>

	

	<br>
<% 
					
					List<Drafting_Dto> complite_dtos = (List<Drafting_Dto>)request.getAttribute("complite_list");
					int totalRecodSize2 = complite_dtos.size(); // 게시글의 총 수
					int recodSizePerPage2 = 5; // 한 페이지의 몇개의 게시글이 나오나
					int pageSizePerBlock2 = 4;// 블록당 페이지 수
					int curBlock2 = 0; // 페이지 블록 처리 변수
					if(request.getAttribute("curBlock2") != null){
						curBlock2 = Integer.parseInt(request.getAttribute("curBlock2").toString());
					}
					int curPage2 = curBlock2*pageSizePerBlock2; // 게시글의 시작번호를 처리해주는 변수
					if(request.getAttribute("curPage2") != null){
						curPage2 = Integer.parseInt(request.getAttribute("curPage2").toString());
					}
					int beginNum2 = curPage2 * recodSizePerPage2; // 게시글의 시작 번호
					// 정수나누기 정수를하면 소수점을 날리기때문에 올림처리를 해줘야한다
					int pageSize2 = (int)Math.ceil((double)totalRecodSize2/recodSizePerPage2); // 총페이지수
				%>
				
				
				<hr>
	<br>
	<div style="text-align:left;">
		<h4>완료된 문서(최신순)</h4>
	</div>
	
	<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
	<center>
	<thead>
		
		<tr>
		<th style="background-color: #eeeeee; text-align: center;" width="10%"> 문서 번호</th>
		<th style="background-color: #eeeeee; text-align: center;" width="30%"> 제목</th>
		<th style="background-color: #eeeeee; text-align: center;" width="10%"> 작성자</th>
		<th style="background-color: #eeeeee; text-align: center;" width="25%"> 작성일</th>
		<th style="background-color: #eeeeee; text-align: center;" width="10%"> 결제상태</th>
		<th style="background-color: #eeeeee; text-align: center;" width="15%"> </th>
		</tr>
	
	</thead>
	<tbody>
		<c:forEach items="${complite_list}" var="complite_dto" begin="<%=beginNum2%>" end="<%=beginNum+recodSizePerPage2-1%>">
		<tr>
			<td>${complite_dto.drafting_num}</td>
			<td>${complite_dto.drafting_title }</a></td>
			<td>${complite_dto.member_name }</td>
			<td>${complite_dto.drafting_date } </td>
			<td><button class="btn btn-default btn-sm" style="background-color: #A5A3A3; color:#FCFCFC;">${complite_dto.condition_name }</button>
				<td>
				<button type="button" class="btn btn-default btn-xs" onclick="location.href='draftingview?drafting_num=${complite_dto.drafting_num}'">
  				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
				
			</td>
			</tr>
			</c:forEach>
	</tbody>
</table>
<div style="text-align:right;">
	<a href="/mvc/complitelist" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">완료된 문서 더 보기</a><br>
	</div>
	<br>
<br><br>
<br>
</div>
				
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/ bootstrap.js"></script>
</body>
</html>