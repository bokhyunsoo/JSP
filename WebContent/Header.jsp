<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상단 영역</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style type="text/css">
	#wrap{
		text-align:center;
		width:800px;
		height:150px;
	}
</style>

<script>
	function changeView(value) {
		if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
		{
			location.href="MainForm.jsp";
		}
		else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
		{
			location.href="MainForm.jsp?contentPage=member/LoginForm.jsp";
		}
		else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
		{
			location.href="MainForm.jsp?contentPage=member/JoinForm.jsp";
		}
		else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
		{
			location.href="member/LogoutPro.jsp";
		}
		else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
		{
			location.href="MainForm.jsp?contentPage=member/UserInfoForm.jsp";
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<p>
			<button class="btn btn-success" onclick="changeView(0)">HOME</button>
			<%
				// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
				if(session.getAttribute("sessionID")==null){
			%>
				<button id="loginBtn" class="btn btn-primary" onclick="changeView(1)">로그인</button>
				<button id="joinBtn" class="btn btn-primary" onclick="changeView(2)">회원가입</button>
			
			<%
				// 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
				} else {
			%>
				<button id="logoutBtn" class="btn btn-primary" onclick="changeView(3)">로그아웃</button>
				<button id="updateBtn" class="btn btn-primary" onclick="changeView(4)">내정보</button>
			<% } %>
			<button id="memberViewBtn" class="btn btn-warning">회원보기</button>
		</p>
	</div>
</body>
</html>