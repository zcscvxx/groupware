<%@page import="com.spring.mvc.drafting_doc.Drafting_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String drafting_num = (String) session.getAttribute("drafting_num");
	
	String drafting_title = (String) session.getAttribute("drafting_title");
	String condition_name = (String) session.getAttribute("condition_name");
	
	String member_id = (String) session.getAttribute("member_id");
	int position_num = (Integer) session.getAttribute("position_num");
	
	
	Drafting_Dto dto = (Drafting_Dto)request.getAttribute("dto");	
	int num = dto.getCondition_num();
	int ponum = dto.getPosition_num();
	String con_name = "";
	if(num==1){
		con_name = "진행중";
	}else if(num==2){
		con_name = "결재승인";
	}else{
		con_name = "결재반려";
	}
	
%>


<c:forEach items="${inglist}" var="dto">


<div class="container">
		<h2>[문서종류:기안서]</h2>
		<br>
	<!--
			<div align='left'>
				<a href="#" onclick="window.open('approvalselect.html', '_blank', 'width=550 height=500')"><button class = "btn btn-default"> 결재선 선택</button> </a>
			</div>
			<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2" >결재</td>
				<td>직급 들어가는 자리</td>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2">협조</td>
				<td>직급2 들어가는 자리</td>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2">참조</td>
				<td>직급3 들어가는 자리</td>
			</tr>
			<tr>
				<td>이름 넣는 자리</td>
				<td>이름2 넣는 자리</td>
				<td>이름3 넣는 자리</td>
			</tr>

 -->


		</table>	
		<input type="hidden" name="drafting_num" value="${dto.drafting_num}">
		<form action= "approval?drafting_num=${dto.drafting_num }" method="post">
		<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td>작성자</td>
				<td  style="text-align: left;" name="member_id" >${dto.member_name }</td>
			</tr>
			<tr>
				<td>기안서 제목</td>
				
				<td  style="text-align: left;" name="drafting_title" >${dto.drafting_title }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td  style="text-align: left;" name="drafting_date" >${dto.drafting_date }</td>
			</tr>
			
			<tr>
				<td>진행 상태</td>
				<td>
			<div align="left">
				<%
				if(dto.condition_num ==  1){
					%>
					<button type="button" class="btn btn-default btn-sm">진행중</button>
					<%
				}else if((dto.condition_num ==  3)){
					%>
					<button type="button"  class="btn btn-default btn-sm" style="background-color: #F25E5E; color:#FCFCFC;">결재반려</button>
					<%
				}else{
					%>
					<button type="button" class="btn btn-default btn-sm" style="background-color: #A5A3A3; color:#FCFCFC;">결재승인</button>
					<%}%>
			</div>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td></td>
			</tr>
			<tr>
				
			<td colspan="2"><textarea  style="background-color: #f9f9f9; border:none; text-align: center" class="form-control" readonly rows="20" name = drafting_content>${dto.drafting_content }</textarea></td>
		</tr>


		</table>

		
		 <%
		 if(dto.getCondition_num()==1 || dto.getCondition_num()==3){
			 %>
			 <a href="inglist" class="btn btn-default"  target="_top" style="background-color: #1784c7; color:#FCFCFC;">진행중 목록으로</a>
 			 
			 <%
		 }else if(dto.getCondition_num()==2){
		 %>
		 	<a href="complitelist" class="btn btn-default"  target="_top" style="background-color: #1784c7; color:#FCFCFC;">완료된 목록으로</a>
		 <%}%>
		
		
		<a href="draftinglist" class="btn btn-default"  target="_top" style="background-color: #1784c7; color:#FCFCFC;">전체 목록으로</a>
		
		
		<!-- 
		<button type="button" class="btn btn-default btn" onclick="location.href='approval?drafting_num=${dto.drafting_num}'" name="condition_num">결재승인</button>
		 -->
		 <%	
		 if(position_num >=4){
			 if(dto.getCondition_num()==1){
				 %>
				 <input type="submit" value="결재승인" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">
	 			 <a href="returnapproval?drafting_num=${dto.drafting_num }" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">결재반려</a>
				 <%
			 }else if(dto.getCondition_num()==3){
			 %>
			 <input type="submit" value="결재승인" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">
			 <%}
		 }
		 
		
		 
		 %>
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	</body>

</head>
</html>


</c:forEach>
</body>
</html>