<%@page import="com.spring.mvc.business_doc.Business_doc_Dto"%>
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
	String condition_num = (String) session.getAttribute("condition_num");
	String drafting_title = (String) session.getAttribute("drafting_title");
	String condition_name = (String) session.getAttribute("condtion_name");
	int position_num = (Integer) session.getAttribute("position_num");
	
	String member_id = (String) session.getAttribute("member_id");
	int group_num = (Integer) session.getAttribute("group_num");
	
	
	Business_doc_Dto dto = (Business_doc_Dto) request.getAttribute("dto");
	System.out.println(dto);
	System.out.println(member_id);
	int num = dto.getCondition_num();
	String con_name = "";
	if(num==1){
		con_name = "결재중";
	}else if(num==2){
		con_name = "결재승인";
	}else{
		con_name = "결재반려";
	}
	
%>


<c:forEach items="${dto}" var="dto">


<div class="container">
		<h2>[문서종류:업무일지]</h2>
		
		<input type="hidden" name="business_num" value="<%=dto.getBusiness_num()%>">
		<form action= "update_Companion" method="post">
		<table class =" table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td>작성자</td>
				<td  style="text-align: left;" name="member_id" ><%=dto.getMember_id()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td  style="text-align: left;"><input type="text" class="form-control" style="border:none; background-color: #f9f9f9" name="business_title" value="<%=dto.getBusiness_title()%>" ></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td  style="text-align: left;" name="business_date" ><%=dto.getBusiness_date()%></td>
			</tr>
			<tr>
			<td >진행 상태</td>
			<td><input type="text" class="form-control" readonly style="border:none; background-color: #f9f9f9" name="condition_name" value="<%= dto.getCondition_name() %>" ></td>
				
			</tr>
			
			<tr>
				<td>내용</td>
				<td></td>
			</tr>
			<tr>
				
			<td colspan="2"><textarea   rows="25" cols ="170" style="background-color: #f9f9f9; class="form-control" name = business_content><%= dto.getBusiness_content() %></textarea></td>
		</tr>


		</table>
			<input type="hidden" class="form-control" readonly style="border:none; background-color: #f9f9f9" name="business_num" value="<%=dto.getBusiness_num()%>" >	
			<input type="hidden" class="form-control" readonly style="border:none; background-color: #f9f9f9" name="condition_num" value="<%=dto.getCondition_num()%>" >	
			<input type="hidden" class="form-control" readonly style="border:none; background-color: #f9f9f9" name="approval_category_num" value="<%= dto.getApproval_category_num() %>" >	

		
		
		<a href="list_Proceeding?member_id=<%=member_id%>"  class="btn btn-default"  target="_top" style="background-color: #3E454C; color:#FCFCFC;">진행중 목록으로</a>
		<a href="list_Approved?member_id=<%=member_id%>" class="btn btn-default"  target="_top" style="background-color: #3E454C; color:#FCFCFC;">완료된 목록으로</a>
		
		<a href="list_business?member_id=<%=member_id%>" class="btn btn-default"  target="_top" style="background-color: #3E454C; color:#FCFCFC;">전체 목록으로</a>

				 <input type="submit" value="수정" class="btn btn-default" style="background-color: #3E454C; color:#FCFCFC;">
	
	</form>
	</body>

</head>
</html>


</c:forEach>
</body>
</html>