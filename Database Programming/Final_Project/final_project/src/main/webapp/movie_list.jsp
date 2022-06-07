<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>

<head>
<title>영화 목록 조회</title>
</head>

<body>
	<%!
	String movie_title, adult_only, adult_only_str, start_time, end_time;
	Date movie_date;
	int theater_id, running_movie_id;
	%>

	<%@include file="top.jsp"%>
	<div style="line-height:250%" align="center"><b>--- 영화 목록 조회 ---</b></div>
	<table width="75%" align="center" bgcolor="#dddcfe">
		<colgroup>
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 10%">
		</colgroup>
		<tr>
			<td><div align="center"><b>영화 제목</b></div></td>
			<td><div align="center"><b>청소년 관람</b></div></td>
			<td><div align="center"><b>상영 날짜</b></div></td>
			<td><div align="center"><b>상영 시작</b></div></td>
			<td><div align="center"><b>상영 종료</b></div></td>
			<td><div align="center"><b>상영관 번호</b></div></td>
			<td><div align="center"><b>예매</b></div></td>
		</tr>
	</table>

	<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1814798";
	String passwd = "ss2";

	Class.forName(dbdriver);
	Connection myConn = DriverManager.getConnection(dburl, user, passwd);

	String dateUpdate = request.getParameter("dateUpdate");
	String pwdUpdate = request.getParameter("pwdUpdate");

	session_id = (String) session.getAttribute("user");

	Statement stmt = myConn.createStatement();
	String mySQL = "select r.running_movie_id, i.movie_title, r.movie_date, i.adult_only, r.theater_id, r.start_time, r.end_time from movie_info_table i, running_movie_table r where i.movie_id = r.movie_id";

	ResultSet rs = stmt.executeQuery(mySQL);
	while (rs.next()) {
		movie_title = rs.getString("movie_title");
		if ((adult_only = rs.getString("adult_only")).compareTo("0") == 0) {
			adult_only_str = "청소년 관람 가능";
		} else {
			adult_only_str = "청소년 관람 불가";
		}
		
		movie_date = rs.getDate("movie_date");
		start_time = rs.getString("start_time");
		end_time = rs.getString("end_time");
		theater_id = rs.getInt("theater_id");
		running_movie_id = rs.getInt("running_movie_id");
	
	%>
	<table width="75%" align="center" bgcolor="#FFFFFF">
		<colgroup>
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 15%">
			<col style="width: 10%">
		</colgroup>
		<tr>
			<td><div align="center"><%=movie_title%></div></td>
			<td><div align="center"><%=adult_only_str%></div></td>
			<td><div align="center"><%=movie_date%></div></td>
			<td><div align="center"><%=start_time%></div></td>
			<td><div align="center"><%=end_time%></div></td>
			<td><div align="center"><%=theater_id%></div></td>
			<td>
				<div align="center">
					<form method="post" action="booking.jsp">
						<input type="hidden" name="running_movie_id" value=<%=running_movie_id%>>
						<input type="hidden" name="theater_id" value=<%=theater_id%>>
						<input type="hidden" name="adult_only" value=<%=adult_only%>>
						<input type="SUBMIT" value="예매">
					</form>
				</div>
			</td>
		</tr>
	</table>
	
	<%
	}
	CallableStatement cstmt_cnt = myConn.prepareCall("{call movie_cnt (?,?)}");
	cstmt_cnt.registerOutParameter(1, java.sql.Types.INTEGER); 
	cstmt_cnt.registerOutParameter(2, java.sql.Types.INTEGER); 
	cstmt_cnt.execute();
    int movie_cnt = cstmt_cnt.getInt(1);
    int run_cnt = cstmt_cnt.getInt(2);
	cstmt_cnt.close();	

	%>
	<table width="75%" align="center" bgcolor="#dddcfe">
		<td><div align="center"><b>영화 종류는 총 <%=movie_cnt%>편, 총 상영 개수는 <%=run_cnt%>개 입니다.</b></div></td>
	</table>
	<%
	
	
stmt.close(); 
myConn.close(); 
%>
</body>

</html>