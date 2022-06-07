<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>영화 예매 시스템 로그인</title>
</head>
<link rel='stylesheet' href='style.css' />

<body>
	<table width="75%" align="center" bgcolor="#938ffa" >
		<tr>
			<td>
				<div align="center"><b>아이디와 패스워드를 입력하세요</b></div>
			</td>
	</table>
	<table width="75%" align="center" >
		<form method="post" action="login_verify.jsp">
			<tr>
				<td>
					<div align="center">아이디</div>
				</td>
				<td>
					<div align="center">
						<input type="text" name="userID">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">패스워드</div>
				</td>
				<td>
					<div align="center">
						<input type="password" name="userPassword">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<div align="center">
						<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인">
						<INPUT TYPE="BUTTON" VALUE="취소" onclick="location.href = 'main.jsp'">
					</div>
				</td>
			</tr>
		</form>
	</table>
</body>

</html>