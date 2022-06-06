<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String dbdriver = "oracle.jdbc.driver.OracleDriver";
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "db1814798";
String passwd = "ss2";

Class.forName(dbdriver);
Connection myConn = DriverManager.getConnection(dburl, user, passwd);

int booking_id = Integer.parseInt(request.getParameter("booking_id"));

Statement stmt = myConn.createStatement();
String mySQL="delete from user_booking_table where booking_id = " + booking_id;

try{
	stmt.executeQuery(mySQL);
	
	%>
	<script>
		alert("예매 취소가 완료되었습니다.");
		location.href="booking_list.jsp";
	</script>
	<%

} catch(SQLException e){
}
stmt.close();
myConn.close();
%>