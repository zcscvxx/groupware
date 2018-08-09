<%@page import="java.util.List"%>
<%@page import="com.spring.mvc.business_doc.Business_doc_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	media="screen" type="text/css">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>
<title>VISION GROUPWARE</title> 
</head>
<body>
	<script type="text/javascript">
		function changehtml() {
			var property = document.getElementById('search').value;
			var show = document.getElementById('show');

			if (property == "none") {
				show.innerHTML = '';
			} else if (property == "title") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="text" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';

			} else if (property == "content") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="text" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';
			} else if (property == "member_name") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="text" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';

			} else if (property == "business_date") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="date" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';

			} 

		}
		function changehtml_tow() {
			var property = document.getElementById('search').value;
			var show = document.getElementById('show');

			if (property == "none") {
				show.innerHTML = '';
			} else if (property== "title") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="text" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';

			} else if (property == "content") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="text" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';
			} else if (property == "business_date") {
				show.innerHTML = '<div class="form-group col-sm-10"><div class="input-group"><input type="date" class="form-control" name="search_text" placeholder="검색어"> <span class="input-group-btn"><button type="submit" class="btn btn-primary btn-flat" id="searchBtn"><i class="fa fa-search"></i> 검색</button></span></div></div>';

			}

		}
	</script>



	<%
		int position_num = (Integer) session.getAttribute("position_num");
		String member_id = (String) session.getAttribute("member_id");
		String member_name = (String) session.getAttribute("member_name");
		Business_doc_Dto dto = (Business_doc_Dto) request.getAttribute("dto");
		pageContext.setAttribute("br", "<br/>");
		pageContext.setAttribute("cn", "\n");
		request.setCharacterEncoding("UTF-8");
		List<Business_doc_Dto> dtos2 = (List<Business_doc_Dto>) request.getAttribute("list2");
		System.out.println(dtos2);
		//	ArrayList<BoardDto> dtos3 = (ArrayList<BoardDto>) request.getAttribute("board_list3");
		//	int totalRecodSize3 = dtos3.size(); // 공지글의 총 수
		int totalRecodSize = dtos2.size(); // 게시글의 총 수
		int recodSizePerPage = 15; // 한 페이지의 몇개의 게시글이 나오나
		int pageSizePerBlock = 5;// 블록당 페이지 수
		int curBlock = 0; // 페이지 블록 처리 변수
		if (request.getAttribute("curBlock") != null) {
			curBlock = Integer.parseInt(request.getAttribute("curBlock").toString());
		}
		int curPage = curBlock * pageSizePerBlock; // 게시글의 시작번호를 처리해주는 변수
		if (request.getAttribute("curPage") != null) {
			curPage = Integer.parseInt(request.getAttribute("curPage").toString());
		}
		int beginNum = curPage * recodSizePerPage; // 게시글의 시작 번호
		// 정수나누기 정수를하면 소수점을 날리기때문에 올림처리를 해줘야한다
		int pageSize = (int) Math.ceil((double) totalRecodSize / recodSizePerPage); // 총페이지수
		int b = 0;

		String search = (String) session.getAttribute("search");
		String search_text = (String) session.getAttribute("search_text");

		/* if(search_text != null){
			search_text = new String(search_text.getBytes("8859_1"),"UTF-8");} */

		if (search != null) {
			search = new String(search.getBytes("8859_1"), "UTF-8");
		}
	%>

	<!--  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


	<br>
	<div class="container">
	<br> <a  href="list_business?member_id=<%=member_id%>" class="btn btn-default"
			style="background-color: #3E454C; color: #FCFCFC;">업무일지 전체보기</a><br>

		<br>
		<h4>업무일지 반려문서(최신순으로 게시)</h4>
		
		<center>
			<table class=" table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">문서 번호</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%">제목</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="10%">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="25%">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="5%">결제상태</th>
						<th style="background-color: #eeeeee; text-align: center;"
							width="30%"></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list2}" var="dto" begin="<%=beginNum%>"
						end="<%=beginNum+recodSizePerPage-1%>">
						<tr>
							<td>${dto.business_num}</td>
							<td><a
								href="business_doc_select?business_num=${dto.business_num}"
								style="color: black; text-decoration: none;">${dto.business_title}</a></td>
						
							<td>${dto.member_name}</td>
							<td>${dto.business_date}</td>
							<td><c:choose>
									<c:when test="${dto.condition_name eq '결재반려'}">
										<button class="btn btn-default btn-sm"
											style="background-color: #F25E5E; color: #FCFCFC;">${dto.condition_name }</button>
									</c:when>
									<c:when test="${dto.condition_name eq '진행중'}">
										<button class="btn btn-default btn-sm">${dto.condition_name }</button>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							<td>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='business_doc_select?business_num=${dto.business_num}'">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>

								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='selectUpdate2?business_num=${dto.business_num}'">
									<span class="glyphicon glyphicon glyphicon-pencil"
										aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default btn-xs"
									onclick="location.href='list_Proceeding_delete?business_num=${dto.business_num}&member_id=${dto.member_id}'">
									<span class="glyphicon glyphicon glyphicon glyphicon-trash"
										aria-hidden="true"></span>
								</button>

							</td>
						</tr>
						
					</c:forEach>
					<tr>
						<td colspan="6" align=center>
							<%
								if (search == null || search_text == null) {
									if (curBlock > 0) {
							%> <input type="button" class="btn btn-default"
							onClick="location.href='list_Companion?curBlock=<%=curBlock - 1%>'"
							value="이전"> <%
 	} else {
 %> <input type="button" class="btn btn-default disabled"
							onClick="location.href='list_Companion?curBlock=<%=curBlock - 1%>'"
							value="이전"> <%
 	}
 	} else {
 		if (curBlock > 0) {
 %> <input type="button" class="btn btn-default"
							onClick="location.href='list_Companion?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock - 1%>'"
							value="이전"> <%
 	} else {
 %> <input type="button" class="btn btn-default disabled"
							onClick="location.href='list_Companion?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock - 1%>'"
							value="이전"> <%
 	}
 	}
 %> <%
 	int startPage = curBlock * pageSizePerBlock; // 블록의 시작페이지
 	int endPage = startPage + pageSizePerBlock; // 블록의 끝페이지
 	int a = pageSize / pageSizePerBlock;

 	for (int i = startPage; i < endPage; i++) {
 		if (pageSize <= i)
 			break;

 		if (search == null || search_text == null) {
 %> <input type="button" class="btn btn-default"
							onClick="location.href='list_Companion?curBlock=<%=curBlock%>&curPage=<%=i%>'"
							value="<%=i + 1%>"> <%
 	} else {
 %> <input type="button" class="btn btn-default"
							onClick="location.href='list_Companion?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock%>&curPage=<%=i%>'"
							value="<%=i + 1%>"> <%
 	}
 	}

 	if (search == null || search_text == null) {
 		if (curBlock < pageSize / pageSizePerBlock
 				&& (double) curBlock + 1 != (double) pageSize / pageSizePerBlock) {
 %> <input type="button" class="btn btn-default "
							onClick="location.href='list_Companion?curBlock=<%=curBlock + 1%>'"
							value="다음"> <%
 	} else {
 %> <input type="button" class="btn btn-default disabled"
							onClick="location.href='list_Companion?curBlock=<%=curBlock + 1%>'"
							value="다음"> <%
 	}
 	} else {
 		if (curBlock < pageSize / pageSizePerBlock
 				&& (double) curBlock + 1 != (double) pageSize / pageSizePerBlock) {
 %> <input type="button" class="btn btn-default "
							onClick="location.href='list_Companion?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock + 1%>'"
							value="다음"> <%
 	} else {
 %> <input type="button" class="btn btn-default disabled"
							onClick="location.href='list_Companion?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock + 1%>'"
							value="다음"> <%
 	}
 	}
 %>
					</tr>

				</tbody>
			</table>
	<form action="list_Companion" method="post">
				<%
					if (position_num >= 3) {
				%>



				<div class="box-footer">

					<div class="form-group col-sm-2">
						<select name="search" class="form-control"
							onchange="changehtml();" id="search" class="form-control"
							>
							<option value="none">::선택::</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="member_name">작성자</option>
							<option value="business_date">날짜</option>

						</select>
					</div>

					<div id="show"></div>
					</div>




					<%
						} else {
					%>

					<div class="box-footer">

					<div class="form-group col-sm-2">
						<select name="search" class="form-control"
							onchange="changehtml_tow();" id="search" class="form-control"
							>
							<option value="none">::선택::</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="business_date">날짜</option>

						</select>
					</div>

					<div id="show"></div>
					</div>


					<%
						}
					%>
				
			</form>

		</center>
	


	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>