<%@page import="com.spring.mvc.drafting_doc.Drafting_Dto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String drafting_num = (String) session.getAttribute("drafting_num");
	String drafting_title = (String) session.getAttribute("drafting_title");
	String drafting_content = (String) session.getAttribute("drafting_content");
	String condition_num = (String) session.getAttribute("condition_num");
	Drafting_Dto dto = (Drafting_Dto)request.getAttribute("dto");
%>
<!-- 
<c:forEach items="${list}" var="dto">
--> 
<input type="hidden" name="drafting_num" value="${dto.drafting_num}">
<form action= "draftingmodifyproc" method="post">

<div class="container">
		<h2>[��������:��ȼ�]</h2>
		<br>
	<!--  
			<div align='left'>
				<a href="#" onclick="window.open('approvalselect.html', '_blank', 'width=550 height=500')"><button class = "btn btn-default"> ���缱 ����</button> </a>
			</div>
			<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2" >����</td>
				<td>���� ���� �ڸ�</td>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2">����</td>
				<td>����2 ���� �ڸ�</td>
				<td style="background-color: #FFECEC; text-align: center; vertical-align: middle;" rowspan="2">����</td>
				<td>����3 ���� �ڸ�</td>
			</tr>
			<tr>
				<td>�̸� �ִ� �ڸ�</td>
				<td>�̸�2 �ִ� �ڸ�</td>
				<td>�̸�3 �ִ� �ڸ�</td>
			</tr>

-->


		</table>	

		<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td>������ȣ</td>
				<td><input type="text" class="form-control" readonly style="border:none; background-color: #f9f9f9" name="drafting_num" value="${ dto.drafting_num }">
				<!--
				<td  style="text-align: left;" name="drafting_num" >${dto.drafting_num }</td>
				-->
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td  style="text-align: left;" name="member_id" >${dto.member_name}</td>
			</tr>
			<tr>
				<td>��ȼ� ����</td>
				
				<td><input type="text" class="form-control"  name="drafting_title" value="${ dto.drafting_title }"></td>
			</tr>
			<tr>
				<td>���� ����</td>
				<td>
			<div align="left">
				<%
				if(dto.condition_num ==  1){
					%>
					<button type="button"  class="btn btn-default btn-sm">������</button>
					<%
				}else if((dto.condition_num ==  3)){
					%>
					<button type="button" class="btn btn-default btn-sm" style="background-color: #F25E5E; color:#FCFCFC;">����ݷ�</button>
					<%
				}else{
					%>
					<button type="button" class="btn btn-default btn-sm" style="background-color: #A5A3A3; color:#FCFCFC;">�������</button>
					<%}%>
			</div>
				</td>
			</tr>
			
			<tr>
				<td>�ۼ���</td>
				<td  style="text-align: left;" name="drafting_date" >${dto.drafting_date }</td>
			</tr>
			
			<tr>
				<td>����</td>
				<td></td>
			</tr>
			<tr>
				
			<td colspan="2"><textarea  style="background-color: #FFFFFF; " class="form-control"  rows="20" name = drafting_content>${dto.drafting_content }</textarea></td>
		</tr>


		</table>
		
		<!-- 
		<input type="button" value="�����ϱ�" class="btn btn-default" onClick="location.href='draftingmodifyproc?drafting_num=${dto.drafting_num}'">
		-->
		<%
		if(dto.getMember_id()== dto.member_id){
			%>
							<input type="submit" value="�����ϱ�" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;">
			<%
		}
		
		%>
		
		
		  
		
		<a href="draftinglist" class="btn btn-default"  target="_top" style="background-color: #1784c7; color:#FCFCFC;">��ü �������</a>
		 <%
		 
			 
			 
		 
		 
		 if(dto.getCondition_num()==1 || dto.getCondition_num()==3){
			 %>
			 <a href="inglist" class="btn btn-default"  target="_top" style="background-color: #1784c7; color:#FCFCFC;">������ �������</a>
 			 
			 <%
		 }else if(dto.getCondition_num()==2){
		 %>
		 	<a href="complitelist" class="btn btn-default"  target="_top" style="background-color: #1784c7; color:#FCFCFC;">�Ϸ�� �������</a>
		 <%}%>
		
		
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
<!-- </c:forEach> -->
</body>
</html>