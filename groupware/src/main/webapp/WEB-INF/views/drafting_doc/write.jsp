<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
	<title>��ȼ� �ۼ� ������</title>

<head>
	<body>
	<%
		
		String member_id = (String) session.getAttribute("member_id");
		int group_num = (Integer) session.getAttribute("group_num");
		int position_num = (Integer) session.getAttribute("position_num");
	%> 
	
			

		<div class="container">
		<h2>[��������:��ȼ�]</h2>
		<br>
	<!--  
			<div align='left'>
				<a href="#" onclick="window.open('select', '_blank', 'width=550 height=500')"><button class = "btn btn-default"> ���缱 ����</button> </a>
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
			<form action="draftingwriteproc" method="post">
			<input type="hidden" name="member_id" value=<%=member_id%>>
			<input type="hidden" name="group_num" value=<%=group_num%>>
			<input type="hidden" name="position_num" value=<%=position_num%>>
		<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td>�ۼ���</td>
				<td  style="text-align: left;" name="member_id" >${member_name }</td>
			</tr>
			<tr>
				<td>��ȼ� ����</td>
				
				<td><input type="text" class="form-control" placeholder="����" name="drafting_title"></td>
			</tr>
			<tr>
				<td>����</td>
				<td></td>
			</tr>
			<tr>
				
			<td colspan="2"><textarea class="form-control" rows="20" name = drafting_content></textarea></td>
		</tr>


		</table>

		<input type="submit" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;" value="�ۼ��ϱ�">
		<a href="/mvc/draftinglist" class="btn btn-default" style="background-color: #1784c7; color:#FCFCFC;" target="_top">�������</a>
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