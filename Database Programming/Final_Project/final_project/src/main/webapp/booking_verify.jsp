<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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

String[] seats = request.getParameterValues("seats");
int run_id = Integer.parseInt(request.getParameter("running_movie_id"));
int theater_id = Integer.parseInt(request.getParameter("theater_id"));
String adult_only = request.getParameter("adult_only");
String user_id = (String) session.getAttribute("user");

if (user_id == null) {
	%>
	<script>
		alert("로그인 후 예매하세요.");
		location.href = "login.jsp";
	</script>
	<%
}


if (seats == null) {
	%>
	<script>
		alert("좌석을 선택하세요.");
		location.href="booking.jsp?running_movie_id=" + <%=run_id%> + "&theater_id=" + <%=theater_id%> + "&adult_only=" + <%=adult_only%>;
	</script>
	<%
	return;
}

CallableStatement cstmt = myConn.prepareCall("{call Insert_booking(?,?,?,?,?)}");
cstmt.setString(1, user_id);
cstmt.setInt(2, run_id);
cstmt.setInt(3, theater_id);
cstmt.setString(4, adult_only);

int seat_cnt = seats.length;
for (int i = 0; i < seat_cnt; i++) {
	cstmt.setString(5, seats[i]);
	try {
		cstmt.execute();
	} catch (SQLException ex) {
		if (ex.getErrorCode() == 20001) {
			%>
			<script>
				alert("청소년 관람불가 영화입니다.");
				location.href = "movie_list.jsp"
			</script>
			<%
		} else if (ex.getErrorCode() == 20002) {
			%>
			<script>
				alert("예매자 오류: 로그인 후 예매하세요");
				location.href = "movie_list.jsp"
			</script>
			<%
		} else if (ex.getErrorCode() == 20003) {
			%>
			<script>
				alert("예매 정보를 정확히 입력해주세요.");
				location.href = "movie_list.jsp"
			</script>
			<%
		}
		System.err.println("SQLException: " + ex.getMessage());
	}
}

%>
<script>
	alert(<%=seat_cnt%>	+ "개 좌석이 예약되었습니다.");
	location.href = "booking_list.jsp"
</script>
<%

myConn.commit();
cstmt.close();
myConn.close();
%>