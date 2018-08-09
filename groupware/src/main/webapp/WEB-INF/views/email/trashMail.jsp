<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function page(idx){
		var pagenum = idx;
		var contentnum = 15;
		
		location.href="${pageContext.request.contextPath}/trashMail?pagenum="+pagenum+"&contentnum="+contentnum;
	}
	function sndata(){
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var cnt = 0;
			var arraycheck = new Array();
			$("input:checkbox[class=check]:checked").each(function(){		
				arraycheck.push($(this).val());
				cnt++;
			});
			location.href="deleteMole?check="+arraycheck+"&cnt="+cnt;
		    document.form.submit();
		}else{   //취소
		    return;
		}
	}
	function sndata3(){
		var cnt = 0;
		var arraycheck = new Array();
		$("input:checkbox[class=check]:checked").each(function(){		
			arraycheck.push($(this).val());
			cnt++;
		});
		location.href="recoverMailTrashMole?check="+arraycheck+"&cnt="+cnt;
	}
	function allch(){
		$("#allcheck").change(function(){ 
			  if($("#allcheck").is(":checked")){ 
			    $(".check").prop("checked", true); //class:nameCheck 전체선택
			  }else{ 
			    $(".check").prop("checked", false); //class:nameCheck 전체해제
			  } 
			}); 
		}
			
		function ch(){
		$(".check").change(function(){ 
			  if( $(this).is(":checked") ){ 
			    checkTrueCnt = $(".check:checkbox:checked").length; //체크되어 있는 체크박수 수
			    checkBoxCnt = $(".check:checkbox").length;          //체크박스 수
				if( checkTrueCnt == checkBoxCnt ){                      //둘이 같으면 전체체크박스 체크
					$("#allcheck").prop("checked", true);
				}
			  }else{ 
			    $("#allcheck").prop("checked", false);              //체크 해제 시 전체 전체 체크박스 체크해제
			  } 
			});
		}	
</script>
<style type="text/css">
/* img {
	width:15px;
	height:15px;
} */
.mailbox{
	width:98%;
}
@media screen and (max-width:768px){
	.mailbox{
		font-size:0.7em;
		}
}
@media screen and (max-width:585px){
	#mailnav{
		display:none;
		}
	#rcvday{
		display:none;
	}
}
</style>
</head>
<body>
	<div>
		<input type="button" name="moltrash" value="삭제" onclick="location.href='javascript:sndata()'">
		<input type="button" name="molsave" value="복원" onclick="location.href='javascript:sndata3()'">
	</div>
	<table class="mailbox">
		<tr id="mailnav">
			<td><input type="checkbox" id="allcheck" onclick="allch()"></td>
			<td>읽음</td><td>제목</td><td>보낸사람</td><td>받는사람</td><td>보낸시간</td><td>받은시간</td>
		</tr>
		<c:forEach items="${listTrashMail}" var="dto">
		<tr>
			<td><input type="checkbox" class="check" onclick="ch()" value="${dto.mail_num}"></td>
			<td>
				<c:choose>
					<c:when test="${dto.read=='안읽음'}">
						<img src="resources/email/email01.jpg" width="15px" height="15"/>
					</c:when>
					<c:otherwise>
						<img src="resources/email/email02.jpg" width="15px" height="15"/>
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<a href="readMailTrash?mail_num=${dto.mail_num}">${dto.mail_title}</a></td>
			<td>${dto.member_id}</td>
			<td>${dto.mail_rcvmember}</td>
			<td><fmt:formatDate value="${dto.mail_senddate}" pattern="yy-MM-dd hh:mm:ss"/></td>
			<td id="rcvday"><fmt:formatDate value="${dto.mail_rcvdate}" pattern="yy-MM-dd hh:mm:ss"/></td>
		</tr>	
		</c:forEach>
		<tr>
			<td colspan=7 align="center">
				<c:if test="${page.prev}">
					<a href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
				</c:if>
				<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
					<c:choose>
						<c:when test="${idx==0}">
							휴지통에 편지가 없습니다.
						</c:when>
						<c:otherwise>
							<a href="javascript:page(${idx});">${idx}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.next}">
					<a href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
				</c:if>	
			</td>	
		</tr>
	
	</table>
</body>
</html>