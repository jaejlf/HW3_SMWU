<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>

<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
</head>

<body>
	<%@ include file="top.jsp"%>
	<%!
	String name, u_id;
	Date date;
	%>

	<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1814798";
	String passwd = "ss2";

	Class.forName(dbdriver);
	Connection myConn;
	myConn = DriverManager.getConnection(dburl, user, passwd);

	session_id = (String) session.getAttribute("user");

	if (session_id == null)
		response.sendRedirect("login.jsp");

	Statement stmt = myConn.createStatement();
	String mySQL;

	mySQL = "select name,user_id,birthdate from user_table where user_id='" + session_id + "'";

	try {
		ResultSet rs = stmt.executeQuery(mySQL);
		rs.next();

		name = rs.getString("name");
		u_id = rs.getString("user_id");
		date = rs.getDate("birthdate");

	} catch (SQLException e) {
	}
	%>

	<table width="75%" align="center" bgcolor="#dddcfe">
		<td><div align="center">사용자 정보를 확인하고 수정할 정보를 입력해주세요.</div></td>
	</table>
	<table width="75%" align="center" border>
		<form method="post" action="update_verify.jsp">
			<tr>
				<td><div align="center">이름</div></td>
				<td><div align="center"><%=name%></div></td>
			</tr>
			<tr>
				<td><div align="center">아이디</div></td>
				<td><div align="center"><%=u_id%></div></td>
			</tr>
			<tr>
				<td><div align="center">생년월일</div></td>
				<td><div align="center"><%=date%></div></td>
			</tr>
			<tr>
				<td><div align="center">비밀번호 수정</div></td>
				<td><div align="center"><input type="password" name="pwdUpdate"></div></td>
			</tr>
			<tr>
				<td colspan=2>
					<div align="center">
						<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="비밀번호 수정">
						<INPUT TYPE="RESET" VALUE="취소">
					</div>
				</td>
		</form>
</body>

</html>