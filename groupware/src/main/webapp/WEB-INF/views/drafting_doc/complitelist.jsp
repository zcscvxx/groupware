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

<script type="text/javascript">
		function changehtml(){
			var property = document.getElementById('select').value;
			var show = document.getElementById('show');
			
			if(property=="none"){
				show.innerHTML ='';
			}else if(property=="title") {
				show.innerHTML ='<div class="col-lg-6" style="margin-bottom:-100%;"><div class="input-group"><input type="text" name="search_text" class="form-control"  style="height:30px; width:150px;"><span class="input-group-btn"><input type="submit" value="검색" class="btn btn-default btn-sm" style="background-color: #1784c7; color:#FCFCFC;"></span></div></div>';
				
			}else if(property=="date") {
				show.innerHTML ='<div class="col-lg-6" style="margin-bottom:-100%;"><div class="input-group"><input type="date" name="search_date" class="form-control" style="height: 30px; width:150px;"><span class="input-group-btn"><input type="submit" value="검색" class="btn btn-default btn-sm" style="background-color: #1784c7; color:#FCFCFC;"></span></div></div>';
			}
		}
		function hello(){
			alert("안녕하세요 고객님");
		}
	</script>



	<br><br>	
	<div class="container">
		

	<br>
<% 
					
					List<Drafting_Dto> complite_dtos = (List<Drafting_Dto>)request.getAttribute("complite_list");
					int totalRecodSize2 = complite_dtos.size(); // 게시글의 총 수
					int recodSizePerPage2 = 8; // 한 페이지의 몇개의 게시글이 나오나
					int pageSizePerBlock2 = 5;// 블록당 페이지 수
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
					String search = (String)session.getAttribute("search");
					String search_text = (String)session.getAttribute("search_text");
					String search_date = (String)session.getAttribute("search_date");
					
				%>
				
				
				
	<br>
	<div style="text-align:left;">
		<h4>완료된 문서</h4>
		<hr>
	</div>
	<div style="text-align:right;">
	
	</div>
	<table class ="table table-striped" style="text-align: center; border: 1px solid #dddddd">
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
		<c:forEach items="${complite_list}" var="complite_dto" begin="<%=beginNum2%>" end="<%=beginNum2+recodSizePerPage2-1%>">
		<tr>
			<td>${complite_dto.drafting_num}</td>
			<td>${complite_dto.drafting_title }</td>
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

	<center>
	<%
					
				if(curBlock2 > 0){
					%>
				<input type="button" class="btn btn-default" onclick="location.href='complitelist.drafting_doc?curBlock2=<%=curBlock2-1%>'" value="이전2">
					<%
				}
				%>
				<%
					int startPage2 = curBlock2*pageSizePerBlock2; // 블록의 시작페이지
					int endPage2 = startPage2 + pageSizePerBlock2; // 블록의 끝페이지
					int a2 = pageSize2/pageSizePerBlock2;
					
					for(int i=startPage2;i<endPage2;i++){
						if(pageSize2 <= i) break;
				%>
				<%
				if(search_text!=null){
				%>
					 <input type="button" class="btn btn-default" onClick="location.href='complitelist.drafting_doc?search=<%=search%>&search_text=<%=search_text%>&curBlock2=<%=curBlock2%>&curPage2=<%=i%>'" value="<%=i+1 %>">
				<%
					
				}else if(search_date!=null){
					%>
					 <input type="button" class="btn btn-default" onClick="location.href='complitelist.drafting_doc?search=<%=search%>&search_date=<%=search_date%>&curBlock2=<%=curBlock2%>&curPage2=<%=i%>'" value="<%=i+1 %>">
					<%
				}else{
					%>
					 <input type="button" class="btn btn-default" onClick="location.href='complitelist.drafting_doc?curBlock2=<%=curBlock2%>&curPage2=<%=i%>'" value="<%=i+1 %>">
					<%
				}
					}
					if(curBlock2 < pageSize2/pageSizePerBlock2 && (double)curBlock2+1 != (double)pageSize2/pageSizePerBlock2){
						
				%>
				<input type="button" class="btn btn-default" onclick="location.href='complitelist.drafting_doc?curBlock2=<%=curBlock2+1%>'" value="다음2">
				<%
					}
				%>
				</center>
	</center>
	
		
	
	<form action="complitelist">
	<table>
	<tr>
	
	<td>
	<select  name="search" style="height:30px; font-size:10px; vertical-align: top" id="select" class="form-control" onchange="changehtml();">
		<option value="none">조건선택</option>
		<option value="title">제목</option>
		<option value="date">날짜</option>
	</select>
	
	</td>
	<td>
	<div  id="show" >
	</div>
	
	
	</td>
	<td>
	</tr>
	
	</div>
	</table>
	</form>
	
	
	
	
	<br>
<br><br>
<br>
</div>
				
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/ bootstrap.js"></script>
</body>
</html>