<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매 시스템</title>
</head>

<body>
	<%@include file="top.jsp"%>
	<table width="75%" align="center" height="100%">
	<% if (session_id != null) { %>
		<tr> <td align="center"><br><%=session_id%>님 안녕하세요.<br> [영화 예매 사이트] 방문을 환영합니다. <br> <br> </td> </tr>
		<% } 
	else { %>
		<tr> <td align="center"> [영화 예매 사이트] 방문을 환영합니다.<br><br> 로그인한 후 사용하세요.</td> </tr> 
		<% }
	%>
 	</table>
</body> 
</html>