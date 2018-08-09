<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
					int recodSizePerPage = 8; // 한 페이지의 몇개의 게시글이 나오나
					int pageSizePerBlock = 5;// 블록당 페이지 수
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
	
	<h4> 기안 진행문서</h4>
	<hr>
	
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
				<button type="button" class="btn btn-default btn-xs" onclick="location.href='draftingmodify?drafting_num=${dto.drafting_num}'">
 				<span class="glyphicon glyphicon glyphicon-pencil" aria-hidden="true"></span>
				</button>
				<!-- 
				<div id = "deleteform" class="deleteform">
				<form action="draftingdelete?drafting_num=${dto.drafting_num }" name="deleteform" method="post">
				<input type="button" class="btn btn-default btn-xs" onclick="button_event()">				
 				<span class="glyphicon glyphicon glyphicon glyphicon-trash" aria-hidden="true"></span>
				</form>
				</div>
				-->
				<button type="button" class="btn btn-default btn-xs" onclick="location.href='draftingdelete?drafting_num=${dto.drafting_num}'">				
 				<span class="glyphicon glyphicon glyphicon glyphicon-trash" aria-hidden="true"></span>
				</button>
				</td>
				</tr>
			</c:forEach>
		
	</tbody>
</table>

</center>


	<center>

	<%
				if(curBlock > 0){
					%>
				<input type="button" class="btn btn-default" onclick="location.href='inglist.drafting_doc?curBlock=<%=curBlock-1%>'" value="이전">
					<%
				}
				%>
				<%
					int startPage = curBlock*pageSizePerBlock; // 블록의 시작페이지
					int endPage = startPage + pageSizePerBlock; // 블록의 끝페이지
					int a = pageSize/pageSizePerBlock;
					
					for(int i=startPage;i<endPage;i++){
						if(pageSize <= i) break;
				%>
					 <input type="button" class="btn btn-default" onClick="location.href='inglist.drafting_doc?curBlock=<%=curBlock%>&curPage=<%=i%>'" value="<%=i+1 %>">
				<%
					}
					if(curBlock < pageSize/pageSizePerBlock && (double)curBlock+1 != (double)pageSize/pageSizePerBlock){
						 
				%>
				<input type="button" class="btn btn-default" onclick="location.href='inglist.drafting_doc?curBlock=<%=curBlock+1%>'" value="다음">
				<%
					}
				%>
	</center>
<a href="/mvc/draftingwrite" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">기안서 작성</a><br>
	<br>
<br><br>
<br>
</div>

</body>
</html>
</body>
</html>