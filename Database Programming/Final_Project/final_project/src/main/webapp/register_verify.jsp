<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
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
request.setCharacterEncoding("UTF-8");
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");
String userBirthDate = request.getParameter("userBirthDate");
String userName = request.getParameter("userName").trim();
Statement stmt = myConn.createStatement();
String mySQL = "call prc_register_verify(?,?,?,?)";

try{
   PreparedStatement pstmt = myConn.prepareStatement(mySQL);
   pstmt.setString(1, userID);
   pstmt.setString(2, userPassword);
   pstmt.setString(3, userBirthDate);
   pstmt.setString(4, userName);
   ResultSet rs = pstmt.executeQuery();
		   
   %>
   <script>
      alert("회원가입 되었습니다.");
      location.href="main.jsp";
   </script>
   <%

}
catch(SQLException ex){
	
	if (ex.getErrorCode() == 20501) 
		sMessage = "아이디는 4자리 수 이하입니다"; 
	else if (ex.getErrorCode() == 20502) 
		sMessage = "아이디는 2자리 수 이상입니다"; 
	else if (ex.getErrorCode() == 20503) 
		sMessage = "아이디가 입력되지 않았습니다"; 
	else if (ex.getErrorCode() == 20504) 
		sMessage = "비밀번호는 4자리 수 이하입니다"; 
	else if (ex.getErrorCode() == 20505) 
		sMessage = "비밀번호는 2자리 수 이상입니다"; 
	else if (ex.getErrorCode() == 20506) 
		sMessage = "비밀번호가 입력되지 않았습니다"; 
	else if (ex.getErrorCode() == 20507) 
		sMessage = "생년월일의 입력 형식은 ex)990101 입니다"; 
	else if (ex.getErrorCode() == 20508) 
		sMessage = "아이디에는 공백이 포함될 수 없습니다"; 
	else if (ex.getErrorCode() == 20509) 
		sMessage = "비밀번호에는 공백이 포함될 수 없습니다"; 
	else if (ex.getErrorCode() == 20510) 
		sMessage = "이름은 15자리를 넘을 수 없습니다"; 
	else if (ex.getErrorCode() == 20511) 
		sMessage = "이름에는 공백이 포함될 수 없습니다"; 
	else if (ex.getErrorCode() == 20512) 
		sMessage = "이름이 입력되지 않았습니다"; 
	else if (ex.getErrorCode() == 00001) 
		sMessage = "이미 존재하는 아이디입니다"; 
	else if (ex.getErrorCode() == 1861) 
		sMessage = "잘못된 생년월일입니다"; 
	else if (ex.getErrorCode() == 1841) 
		sMessage = "잘못된 생년월일입니다"; 
	else sMessage=ex.getErrorCode() + " error 발생, 잠시 후 다시 시도해 주십시오.";

   %>
   <script>
      alert("<%=sMessage%>");
      location.href = "register.jsp";
   </script>
   <%
}

stmt.close(); 
myConn.close(); 
%>