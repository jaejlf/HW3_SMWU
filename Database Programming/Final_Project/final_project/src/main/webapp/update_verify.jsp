<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%!
String sMessage;
%>

<%
String dbdriver = "oracle.jdbc.driver.OracleDriver";
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "db1814798";
String passwd = "ss2";

Class.forName(dbdriver);
Connection myConn = DriverManager.getConnection(dburl, user, passwd);

String pwdUpdate = request.getParameter("pwdUpdate");
String session_id = (String) session.getAttribute("user"); 

Statement stmt = myConn.createStatement();
String mySQL="call prc_update_pwd(?,?)";

try{
	PreparedStatement pstmt = myConn.prepareStatement(mySQL);
	pstmt.setString(1, session_id);
	pstmt.setString(2, pwdUpdate);
	ResultSet rs = pstmt.executeQuery();
   
   %>
   <script>
      alert("수정 완료");
      location.href = "main.jsp";
   </script>
   <%

}
catch(SQLException e){
	System.out.println(e.getErrorCode());
	if (e.getErrorCode() == 20504) 
		sMessage = "비밀번호는 4자리 수 이하입니다"; 
	else if (e.getErrorCode() == 20505) 
		sMessage = "비밀번호는 2자리 수 이상입니다"; 
	else if (e.getErrorCode() == 20506) 
		sMessage = "비밀번호가 입력되지 않았습니다"; 
	else if (e.getErrorCode() == 20509) 
		sMessage = "비밀번호에는 공백이 포함될 수 없습니다"; 
	else
		sMessage = "잠시 후에 다시 시도해 주십시오";
	
   %>
   <script>
      alert("실패 : " + "<%=sMessage%>");
      location.href = "main.jsp";
   </script>
   <%
}

stmt.close(); 
myConn.close(); 
%>