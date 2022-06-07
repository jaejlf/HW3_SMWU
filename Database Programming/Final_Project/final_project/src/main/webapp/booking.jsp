<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<title>예약 좌석 선택</title>
<style>
div {
	text-align: center;
}
</style>
</head>

<body>
	<%@ include file="top.jsp"%>
	<%
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_user = "db1814798";
	String db_pw = "ss2";
	Connection myConn = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		myConn = DriverManager.getConnection(dburl, db_user, db_pw);
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	Statement stmt = myConn.createStatement();

	int run_id = Integer.parseInt(request.getParameter("running_movie_id"));
	int theater_id = Integer.parseInt(request.getParameter("theater_id"));
	String adult_only = request.getParameter("adult_only");

	String seatSQL = "select seat_id from SEAT_INFO_TABLE where seat_id NOT IN (select seat_id from USER_BOOKING_TABLE where running_movie_id = "
			+ run_id + ") and theater_id=" + theater_id + " order by seat_id";
	
	try {
		ResultSet result_seats = stmt.executeQuery(seatSQL);
		if (!result_seats.next()) {
			%>
			<script>
				alert("좌석이 매진되었습니다.");
				location.href = "movie_list.jsp"
			</script>
			<%
		} else {
			%>
			<div>
				<br>
				<img src="seat_img.jpg" style="width: 60%; height: auto;">
				<br>예매 가능한 좌석입니다.<br>
				<form method="post" action="booking_verify.jsp">
				<%
				do {
					String seat_id = result_seats.getString("seat_id");
					%>
					<input type="checkbox" name="seats" value=<%=seat_id%>>
					<%=seat_id%>
					&nbsp;
					<%
				} while (result_seats.next());
		}
	} catch (SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
					%>
					<input type="hidden" name="running_movie_id" value=<%=run_id%>>
					<input type="hidden" name="theater_id" value=<%=theater_id%>>
					<input type="hidden" name="adult_only" value=<%=adult_only%>>
					<input type="SUBMIT" value="예매">
				</form>
			</div>
</body>

</html>