<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String contentPage = request.getParameter("contentPage");
	if(contentPage==null)
		contentPage="FirstView.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>

<style>
	#wrap {
		width : 800px;
		margin : 0 auto 0 auto;
	}
	
	#header {
		text-align : center;
		width : 800px;
		height : 150px;
		background-color : #92FFFF;
		padding : 60px 0px;
	}
	
	#main {
		float : left;
		width : 800px;
		height : 500px;
		background-color : #FFCA6C;
		text-align : center;
		vertical-align : middle;
	}
	
	#footer {
		clear : left;
		width : 800px;
		height: 60px;
		background-color : #7DFE74;
	}
</style>
<script>
	// 로그아웃 담당 JSP로 이동
	function logoutPro(){
		location.href="member/pro/LogoutPro.jsp";
	}
</script>
</head>
<body>
	
	<div id="wrap">
		<div id="header">
			<jsp:include page="Header.jsp" />
		</div>
		<div id="main">
			<jsp:include page="<%=contentPage%>" />
		</div>
		<div id="footer">하단</div>
	</div>
</body>
</html>