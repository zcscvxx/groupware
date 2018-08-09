<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function getSelectValue(frm)
{
 frm.reciever.value += ','+frm.selectBox.options[frm.selectBox.selectedIndex].value;
}

</script>
<%
	String member_id = (String)request.getAttribute("member_id");
%>
<style type="text/css">
.mailbox{
	width:98%;
}
.textcol1{
	width:100%;
}
.textcol{
	width:86%;
}
.textcol2{
	width:89%;
}
#tdcol{
	width:20%
}
@media screen and (max-width:784px){
	.mailbox{
		font-size:0.8em;
		}
}

</style>
</head>
<body>
	<form action="confirmMail" method="post" name="form">
	<table class="mailbox">
		<tr>
			<td></td><td></td>
			<td colspan=3>
				<input type="submit"  value="메일보내기">
				<input type="reset" value="재입력">
			</td>
		</tr>
		<tr>
			<td></td><td></td><td id="tdcol">보내는사람</td >
			<td colspan="2"><input class="textcol" type="text" name="sender" value="<%=member_id%>" disabled></td>
		</tr>
		<tr>
			<td></td><td></td><td>받을사람</td><td><input class="textcol1" type="text" name="reciever" value="${mail_rcvmember}" required></td>
			<td>
				<select name="selectBox" onChange="getSelectValue(this.form);">
 					<c:forEach items="${writemember}" var="dto">
 						<option value="${dto.member_id}">${dto.member_name}</option>
 					</c:forEach>
 				</select>				
			</td>
		</tr>
		<tr>
			<td></td><td></td><td>제목</td><td colspan="2"><input class="textcol" type="text" name="title"></td>
		</tr>
		<tr>
			<td></td><td></td><td colspan=3><textarea class="textcol2" rows="10" cols="20" name="content" ></textarea>
		</tr>
		
	</table>
	</form>

	
</body>
</html>