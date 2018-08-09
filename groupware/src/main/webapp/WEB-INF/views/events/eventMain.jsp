<%@page import="java.sql.Array"%>
<%@page import="com.spring.mvc.events.Events_Dto"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("member_id");
	List<Events_Dto> list = (List<Events_Dto>) request.getAttribute("list");

	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1; // +1
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	request.setCharacterEncoding("utf-8");
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = nowYear; // 현재의 년을 받아옴.
	int month = nowMonth; // 현재의 월을 받아옴.
	int i;
	if (strYear != null) {
		year = Integer.parseInt(strYear);
	}

	if (strMonth != null) {
		month = Integer.parseInt(strMonth);
	}

	cal.set(year, month - 1, 1);
	int startDay = 1;

	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int week = cal.get(Calendar.DAY_OF_WEEK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function window_onload() {
		for (i = 2017; i <= 2030; i++) {
			var op = new Option(i + "년", i);
			syear.options[i - 2017] = op;
			if (i ==
<%=year%>
	) {
				syear.options[i - 2017].selected = "selected";
			}
		}
		for (i = 1; i <= 12; i++) {
			var op = new Option(i + "월", i);
			smonth.options[i - 1] = op;
			if (i ==
<%=month%>
	) {
				smonth.options[i - 1].selected = "selected";
			}
		}
	}
	function month_onchange() {
		var month = smonth.value;
		var year = syear.value;
		var addr = "eventsMain?year=" + year + "&month=" + month;
		// alert(addr);
		//addr 이 가지는 주소값으로  페이지를 이동시킨다.       
		location.href = addr;

	}
	function year_onchange() {
		var year = syear.value;
		var month = smonth.value;
		var addr = "eventsMain?year=" + year + "&month=" + month;

		location.href = addr;

	}

	function popupOpen(event_id) {
		var popUrl = "viewEvent?event_id=" + event_id; //팝업창에 출력될 페이지 URL
		var popOption = "width=430, height=430, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(popUrl, "", popOption);
	}
</script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.bordertable {
	border: 1px solid gray;
	border-collapse: collapse;
	width:1100px;
}
</style>
<body onload="window_onload()">
	<center>
		<div class="container">
			<h1><%=year%>년  <%=month%>월</h1>
			<b>&nbsp; <select id="syear" onchange="year_onchange()">
					<option></option>
			</select>
			</b><b>&nbsp; <select id="smonth" onchange="month_onchange()">
					<option></option>
			</select>
			</b><a href="addEvent?member_id=<%=id%>" class="btn btn-default">일정 추가</a>
			<table class="bordertable" style="table-layout:fixed; align="center" cellspacing="1"
				cellpadding="2" bgcolor="#cccccc">
				<tr>
					<td bgcolor="#e6e4e6" width="11%" height="20" style="color: red;"
						align="center">일</td>
					<td align="center" bgcolor="#e6e4e6" width="11%" height="20">월</td>
					<td align="center" bgcolor="#e6e4e6" width="11%" height="20">화</td>
					<td align="center" bgcolor="#e6e4e6" width="11%" height="20">수</td>
					<td align="center" bgcolor="#e6e4e6" width="11%" height="20">목</td>
					<td align="center" bgcolor="#e6e4e6" width="11%" height="20">금</td>
					<td align="center" bgcolor="#e6e4e6" width="11%" height="20"
						style="color: blue;">토</td>

				</tr>
				<%
					int newLine = 0;
					out.print("<tr class='bordertabletr'>");

					for (i = 1; i < week; i++) {
						out.print("<td height='140' bgcolor='#ffffff'>&nbsp;</td>");
						newLine++;
					}

					Map<Integer, ArrayList<String>> map = new HashMap();
					ArrayList<String>[] dayLists = new ArrayList[] { new ArrayList(), new ArrayList(), new ArrayList(),
							new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(),
							new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(),
							new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(),
							new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(),
							new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList(),
							new ArrayList(), new ArrayList(), new ArrayList(), new ArrayList() };

					for (int a = 0; a < list.size(); a++) {
						int event_id = list.get(a).getEvent_id();
						int same_data = list.get(a).getSame_data();
						String start_date = list.get(a).getStart_date().toString();
						String end_date = list.get(a).getEnd_date().toString();
						String member_id = list.get(a).getMember_id().toString();
						String event_name = list.get(a).getEvent_name().toString();
						String[] start_day = start_date.split(" ");
						String[] end_day = end_date.split(" ");
						int int_startday = Integer.parseInt(start_day[2]); // 시작 날짜
						int int_endday = Integer.parseInt(end_day[2]); // 종료 날짜
						/* System.out.println("날짜:"+intday+":"+event_name); */

						/* System.out.println("시작일: "+int_startday);
						System.out.println("종료일: "+int_endday); */

						if ((int_endday - int_startday) > 0) {
							for (int e = 0; e <= (int_endday - int_startday); e++) {
								dayLists[int_startday + e].add(event_name + "!" + event_id + "!" + member_id + "!" + same_data);
							}
						} else {
							dayLists[int_startday].add(event_name + "!" + event_id + "!" + member_id + "!" + same_data);
						}

					}

					for (int a = 1; a < dayLists.length; a++) {
						map.put(a, dayLists[a]);
					}
					for (i = startDay; i <= endDay; i++) {
						String fontColor = (newLine == 0) ? "red" : (newLine == 6) ? "blue" : "black";
						String bgColor = (nowYear == year) && (nowMonth == month) && (nowDay == i) ? " #e6e4e6" : "#ffffff";
						out.print("<td class='bordertable' height='140' bgcolor=" + bgColor + "><font color="
								+ fontColor + ">");
						out.println("<table height='140'>");
						if (map.get(i).isEmpty()) {
							out.print("<tr><td height='24' style='font-size:13px'>" + i + "</td></tr>");
							out.print("<tr><td height='24'></td></tr>");
							out.print("<tr><td height='24'></td></tr>");
							out.print("<tr><td height='24'></td></tr>");
							out.print("<tr><td height='24'></td></tr>");
						} else {
							out.print("<tr><td height='24'>" + i + "</td></tr>");
							if (!map.get(i).isEmpty()) {
								String value = map.get(i).toString();
								value = value.substring(1, value.length() - 1);
								String[] buf = new String[5];
								buf = value.split(",");
								for (int x = 0; x < buf.length; x++) {
									if (buf[x] != null || !buf[x].isEmpty()) {
										String[] finalbuf = new String[5];
										String[] member_id = new String[5];
										String[] same_data = new String[5];
										finalbuf = buf[x].split("!");
										buf[x] = finalbuf[0];
										member_id[x] = finalbuf[2];
										same_data[x] = finalbuf[3];
				%>
				<tr>
					<%
						out.print("<td height='24'><a href='javascript:popupOpen(" + finalbuf[1].trim()
													+ ");' style='color:black; text-decoration:none; font-size:13px;'>"
													+ buf[x].trim() + "</a></td>");
											if (id.equals(member_id[x].trim())) {
												out.print("<td width='20' height='24'>");
					%>
					<td align="right">
						<button class="btn btn-default btn-xs" data-toggle="modal"
							data-target="#myModal">
							<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>
						</button>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">취소</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">이벤트 삭제</h4>
									</div>
									<!-- 모달창 영역에 버튼태그의 data-dismiss 속성을 적용하면 모달을 닫게하는 기능을 적용하겠다라는 의미 
      class="modal fade"에서 fade없으면 부드럽게 창이 뜨지 않는다.
      -->

									<div class="modal-body">
										<p>이벤트를 삭제하시겠습니까 ?</p>
									</div>
									<div class="modal-footer">
										<%
											out.print("<a href='deleteEvent?event_id=" + finalbuf[1].trim() + "&member_id="
																			+ member_id[x].trim() + "&event_name=" + buf[x].trim() + "&same_data="
																			+ same_data[x] + "' class='btn btn-primary'>이벤트 삭제</a>");
										%>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
									<!-- data-dismiss="modal" : 모달을 닫는 기능을 갖고있다. -->
								</div>
								<!-- 모달 콘텐츠 -->
							</div>
							<!-- 모달 다이얼로그 -->
						</div> <!-- 모달 전체 윈도우 -->
					</td>
				</tr>
				<%
					}
									}
								}
								for (int z = 0; z < 4 - (buf.length); z++) {
									out.print("<tr><td height='24'></td></tr>");
								}

							}
						}
						out.println("</td></tr></table>");
						out.print("</font></td>");

						newLine++;

						if (newLine == 7 && i != endDay) {
							out.print("</tr><tr>");
							newLine = 0;
						}
					}
					while (newLine > 0 && newLine < 7) {
						out.print("<td height='140' bgcolor='#ffffff'>&nbsp;</td>");
						newLine++;
					}
					out.print("</tr>");
				%>
			</table>
		</div>
	</center>
</body>
</html>