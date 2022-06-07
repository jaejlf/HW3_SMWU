<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<title>예매 내역 조회</title>
</head>

<body>
	<%@include file="top.jsp"%>
	<div style="line-height:250%" align="center"><b>--- 예매 내역 조회 ---</b></div>

	<%
	if (session_id != null) {
	%>
		<table width="75%" align="center" bgcolor="#dddcfe" >
			<colgroup>
				<col style="width: 20%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 10%">
			</colgroup>
			<tr>
				<td><div align="center"><b>영화 제목</b></div></td>
				<td><div align="center"><b>청소년 관람</b></div></td>
				<td><div align="center"><b>상영 날짜</b></div></td>
				<td><div align="center"><b>상영 시작</b></div></td>
				<td><div align="center"><b>상영 종료</b></div></td>
				<td><div align="center"><b>상영관 번호</b></div></td>
				<td><div align="center"><b>좌석 번호</b></div></td>
				<td><div align="center"><b>예매 취소</b></div></td>
			</tr>
		</table>
	
		<%
		String dbdriver = "oracle.jdbc.driver.OracleDriver";
		String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "db1814798";
		String passwd = "ss2";
	
		Class.forName(dbdriver);
		Connection myConn = DriverManager.getConnection(dburl, user, passwd);
	
		Statement stmt = myConn.createStatement();
		String user_id = (String) session.getAttribute("user");
	
		String bookingListViewSQL =
				"create or replace view BookingList (user_id, booking_id, seat_id, theater_id, running_movie_id) " +
				"as select user_id, booking_id, seat_id, theater_id, running_movie_id " +
				"from user_booking_table";
				
		String movieInfoViewSQL =
				"create or replace view MovieInfoView (running_movie_id, movie_title, adult_only, movie_date, start_time, end_time) " +
				"as select Run.running_movie_id, Movie.movie_title, Movie.adult_only, Run.movie_date, Run.start_time, Run.end_time " +
				"from Running_Movie_Table Run join Movie_Info_Table Movie on Run.movie_id = Movie.movie_id";
		
		try {
			stmt.execute(bookingListViewSQL);
			stmt.execute(movieInfoViewSQL);
			
			ResultSet bookingList = stmt.executeQuery("select * from BookingList where user_id = '" + user_id + "'");
			if (bookingList != null) {
				while (bookingList.next()) {
						
					int booking_id = bookingList.getInt("booking_id");
					String seat_id = bookingList.getString("seat_id");
					int theater_id = bookingList.getInt("theater_id");
					int running_movie_id = bookingList.getInt("running_movie_id");
									
					CallableStatement cstmt_info = myConn.prepareCall("{call get_movie_info(?,?,?,?,?,?)}");
					cstmt_info.setInt(1, running_movie_id);
					cstmt_info.registerOutParameter(2, java.sql.Types.VARCHAR);
					cstmt_info.registerOutParameter(3, java.sql.Types.CHAR);
					cstmt_info.registerOutParameter(4, java.sql.Types.DATE);
					cstmt_info.registerOutParameter(5, java.sql.Types.VARCHAR);
					cstmt_info.registerOutParameter(6, java.sql.Types.VARCHAR);
					cstmt_info.execute();
					
					String movie_title = cstmt_info.getString(2);
					String adult_only = "청소년 관람 가능";
					if(cstmt_info.getString(3).equals("1")) adult_only = "청소년 관람 불가";
					Date movie_date = cstmt_info.getDate(4);
					String start_time = cstmt_info.getString(5);
					String end_time = cstmt_info.getString(6);
				   	
				   	cstmt_info.close();
				   	
					%>
					<table width="75%" align="center" bgcolor="#FFFFFF">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 10%">
							<col style="width: 10%">
							<col style="width: 10%">
							<col style="width: 10%">
							<col style="width: 10%">
						</colgroup>
						<tr>
							<td><div align="center"><%=movie_title%></div></td>
							<td><div align="center"><%=adult_only%></div></td>
							<td><div align="center"><%=movie_date%></div></td>
							<td><div align="center"><%=start_time%></div></td>
							<td><div align="center"><%=end_time%></div></td>
							<td><div align="center"><%=theater_id%></div></td>
							<td><div align="center"><%=seat_id%></div></td>
							<td>
								<div align="center">
									<form method="post" action="booking_cancel.jsp">
										<input type="hidden" name="booking_id" value=<%=booking_id%>>
										<input type="SUBMIT" value="예매 취소">
									</form>
								</div>
							</td>
						</tr>
					</table>
					<%
				}
				
				CallableStatement cstmt_cnt = myConn.prepareCall("{call Ticket_Cnt(?,?)}");
				cstmt_cnt.setString(1, user_id);
				cstmt_cnt.registerOutParameter(2, java.sql.Types.INTEGER); 
				cstmt_cnt.execute();
		        int cnt = cstmt_cnt.getInt(2);
				cstmt_cnt.close();	
				
				%>
				<table width="75%" align="center" bgcolor="#dddcfe">
					<td><div align="center"><b>예매 티켓 수는 총 <%=cnt%>매 입니다.</b></div></td>
				</table>
				<%
			}
		} catch (SQLException e) {
		}
		
		stmt.close();
		myConn.close();
	} else {
	%>
	<table width="75%" align="center">
		<tr>
			<td align="center">로그인한 후 사용하세요.</td>
		</tr>
	</table>
	
	<%
	}
	%>

</body>

</html>