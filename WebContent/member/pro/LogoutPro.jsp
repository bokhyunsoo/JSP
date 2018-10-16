<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃 처리</title>
</head>
<body>
	<%
		session.invalidate(); // 모든 세션정보 삭제
		response.sendRedirect("../view/LoginForm.jsp");
	%>
</body>
</html>