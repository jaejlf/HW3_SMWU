<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매 시스템 회원가입</title>
</head>
<body>
	<link rel='stylesheet' href='style.css' />
	<table width="75%" align="center" bgcolor="#938ffa">
		<tr>
			<td><div align="center"><b>회원가입 정보를 입력하세요</b></div></td>
	</table>
	<table width="75%" align="center">
		<form method="post" action="register_verify.jsp">
			<tr>
				<td><div align="center">아이디</div></td>
				<td><div align="center"><input type="text" name="userID"></div></td>
			</tr>
			<tr>
				<td><div align="center">패스워드</div></td>
				<td><div align="center"><input type="password" name="userPassword"></div></td>
			</tr>
			<tr>
			<tr>
				<td><div align="center">생년월일 ex) 990101</div></td>
				<td><div align="center"><input type="text" name="userBirthDate"></div></td>
			</tr>
			<tr>
			<tr>
				<td><div align="center">이름</div></td>
				<td><div align="center"><input type="text" name="userName"></div></td>
			</tr>
			<tr>
				<td colspan=2><div align="center">
						<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="회원 가입">
						<INPUT TYPE="RESET" VALUE="취소">
					</div></td>
			</tr>
		</form>
	</table>
</body>
</html>