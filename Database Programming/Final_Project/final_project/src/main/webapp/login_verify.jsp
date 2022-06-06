<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String dbdriver = "oracle.jdbc.driver.OracleDriver";
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "db1814798";
String passwd = "ss2";

Class.forName(dbdriver);
Connection myConn = DriverManager.getConnection(dburl, user, passwd);

String userID=request.getParameter("userID");
String userPassword=request.getParameter("userPassword");

Statement stmt = myConn.createStatement();
String mySQL="select user_id from user_table where user_id='" + userID + "'and pwd='" + userPassword + "'";

try{
	ResultSet rs = stmt.executeQuery(mySQL);
	rs.next();
	String user_id = rs.getString("user_id");
	session.setAttribute("user", user_id);
	
	%>
	<script>
		alert("로그인되었습니다.");
		location.href="main.jsp";
	</script>
	<%

}
catch(SQLException e){
	%>
	<script>
		alert("아이디와 패스워드가 올바르지 않습니다.");
		location.href="login.jsp";
	</script>
	<%
}
stmt.close();
myConn.close();
%>