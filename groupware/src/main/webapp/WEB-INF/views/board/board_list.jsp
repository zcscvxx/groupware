<%@page import="com.spring.mvc.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
				<% 
				request.setCharacterEncoding("UTF-8");
					ArrayList<BoardDto> dtos2 = (ArrayList<BoardDto>) request.getAttribute("board_list2");
				//	ArrayList<BoardDto> dtos3 = (ArrayList<BoardDto>) request.getAttribute("board_list3");
				//	int totalRecodSize3 = dtos3.size(); // 공지글의 총 수
					int totalRecodSize = dtos2.size(); // 게시글의 총 수
					int recodSizePerPage = 15; // 한 페이지의 몇개의 게시글이 나오나
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
					int b=0;
					
					String search = (String)session.getAttribute("search");
					String search_text = (String)session.getAttribute("search_text");
					
					/* if(search_text != null){
						search_text = new String(search_text.getBytes("8859_1"),"UTF-8");} */
						
					if(search != null){
							search = new String(search.getBytes("8859_1"),"UTF-8");
						}


				%>
	<center>
		<div class="container">
		<a href="board_list" style="text-decoration:none;"><h1>자유 게시판</h1></a>
			<table class="table table-hover">
				<tr class="active">
					<td width="50" align="center">번호</td>
					<td width="80" align="center">이름</td>
					<td width="300" align="center">제목</td>
					<td width="80" align="center">날짜</td>
					<td width="50" align="center">조회수</td>
				</tr>
	
				
				<c:forEach items="${board_list2}" var="dto" begin="<%=beginNum%>" end="<%=beginNum+recodSizePerPage-1%>">
				
					<tr>
						<td align="center">${dto.board_num}</td>
						<td align="center">${dto.member_name}</td>
						<td align="left"><c:forEach begin="1" end="${dto.board_re_level}">-</c:forEach> <a
							href="board_content_view?board_num=${dto.board_num}">${dto.board_title}</a></td>
						<td align="center"><fmt:formatDate value="${dto.board_regdate}" pattern="yy-MM-dd hh:mm"/></td>
						<td align="center">${dto.board_readcount}</td>
					</tr>
				</c:forEach>
				</table>
				<table width="1100">
				<tr>
					<td align="right">
						<a href="board_write_view"><input type="button" value="작성" class="btn btn-default"></a>
					</td>
					</tr>
				<tr>
					<td align="center">
				<%
				if(search==null || search_text==null){
					if(curBlock > 0){
				%>
						<input type="button" class="btn btn-default" onClick="location.href='board_list.board?curBlock=<%=curBlock-1%>'" value="이전">
				<%
					}else{
				%>
						<input type="button" class="btn btn-default disabled" onClick="location.href='board_list.board?curBlock=<%=curBlock-1%>'" value="이전">
				<%
					}
				}else{
					if(curBlock > 0){
						%>
								<input type="button" class="btn btn-default" onClick="location.href='board_list.board?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock-1%>'" value="이전">
						<%
							}else{
						%>
								<input type="button" class="btn btn-default disabled" onClick="location.href='board_list.board?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock-1%>'" value="이전">
						<%
							}
				}
				%>
					<%
						int startPage = curBlock*pageSizePerBlock; // 블록의 시작페이지
						int endPage = startPage + pageSizePerBlock; // 블록의 끝페이지
						int a = pageSize/pageSizePerBlock;
						
						for(int i=startPage;i<endPage;i++){
							if(pageSize <= i) break;
							
							if(search==null || search_text==null){
								
							
					%>
						 <input type="button" class="btn btn-default" onClick="location.href='board_list.board?curBlock=<%=curBlock%>&curPage=<%=i%>'" value="<%=i+1 %>">
					<%
						}else{
							%>
							<input type="button" class="btn btn-default" onClick="location.href='board_list.board?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock%>&curPage=<%=i%>'" value="<%=i+1 %>">
							<%
							
							}
						}
						
					if(search==null || search_text==null){
						if(curBlock < pageSize/pageSizePerBlock && (double)curBlock+1 != (double)pageSize/pageSizePerBlock){
					%>
					<input type="button" class="btn btn-default " onClick="location.href='board_list.board?curBlock=<%=curBlock+1%>'" value="다음">
					<%
						}else{
							%>
							<input type="button" class="btn btn-default disabled" onClick="location.href='board_list.board?curBlock=<%=curBlock+1%>'" value="다음">
							<%
						}
					}else{
						if(curBlock < pageSize/pageSizePerBlock && (double)curBlock+1 != (double)pageSize/pageSizePerBlock){
							%>
							<input type="button" class="btn btn-default " onClick="location.href='board_list.board?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock+1%>'" value="다음">
							<%
								}else{
									%>
									<input type="button" class="btn btn-default disabled" onClick="location.href='board_list.board?search=<%=search%>&search_text=<%=search_text%>&curBlock=<%=curBlock+1%>'" value="다음">
									<%
								}
					}
					%>
					</td>
				</tr>
				<tr>
				<form action="board_list" >
				<td>
					<select name="search">
					    <option value="title">제목</option>
					    <option value="content">내용</option>
					    <option value="title_content">제목 또는 내용</option>
					    <option value="id">작성자</option>
					</select>
				
				<input type="text" name="search_text">
				<input type="submit" value="검색" class="btn btn-default"></td>
				</form>
				</tr>
			</table>
		</div>	
	</center>
</body>
</html>