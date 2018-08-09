<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
	<title>기안서 작성 페이지</title>

<head>
	<body>
	<%
		
		String member_id = (String) session.getAttribute("member_id");
		String member_name = (String) session.getAttribute("member_name");
		int group_num = (Integer) session.getAttribute("group_num");
		int position_num = (Integer) session.getAttribute("position_num");
		System.out.println(member_id);
		System.out.println(group_num);
		System.out.println(position_num);
	%> 
	
			

		<div class="container">
		<h2>[문서종류:업무일지]</h2>
		<br>



		</table>	
			<form action="write" method="post">
			<input type="hidden" name="member_id" value="<%=member_id%>">
			<input type="hidden" name="condition_num" value="1">
			<input type="hidden" name="approval_category_num" value="2">
			<input type="hidden" name="position_num" value="<%=position_num%>">
		<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td>작성자</td>
				<td  style="text-align: left;" name="member_name" ><%= member_name %></td>
			</tr>
			<tr>
				<td>업무일지 제목</td>
				
				<td><input type="text" class="form-control" placeholder="제목" name="business_title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td></td>
			</tr>
			<tr>
				
			<td colspan="2"><textarea class="form-control" rows="20" name = "business_content"></textarea></td>
		</tr>


		</table>

		<button type="submit" class="btn btn-default" style="background-color: #3E454C; color:#FCFCFC;" value="작성하기  onclick="location.href='list_business?member_id=<%=member_id%>'">입력</button>&nbsp;&nbsp; 
		<button  type="button" href="/mvc/draftinglist" class="btn btn-default" style="background-color: #3E454C; color:#FCFCFC;" target="_top"  onclick="location.href='list_business?member_id=<%=member_id%>'" value="목록으로 돌아가기" >목록으로 돌아가기</button>&nbsp;&nbsp; 
	</form>
	
	</body>
	

</head>
</html>