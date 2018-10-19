<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<link href='<%=request.getContextPath() %>/css/join_style.css' rel='stylesheet' style='text/css'/>

<script>
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if(!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if(!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}
	
	// 취소 버튼 클릭시 첫화면으로 이동
	function goJoinForm() {
		location.href="MainForm.jsp";
	}
</script>
</head>
<body>
	<div id="wrap">
		<form name="loginInfo" method="post" action="MemberLoginAction.do" onsubmit="return checkValue()">
			<img src="<%=request.getContextPath() %>/img/welcome.jpg">
			<br><br>
			
			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인"/>
			<input type="button" value="취소" onclick="goJoinForm()" />
		</form>
		
		<%
			// 아이디, 비밀번호가 틀릴 경우 화면에 메시지 표시
			// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
			String loginMsg = (String) request.getAttribute("fail");
		
			if(loginMsg!=null && loginMsg.equals("0")) {
				out.println("<br>");
				out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
			} else if(loginMsg!=null && loginMsg.equals("-1")) {
				out.println("<br>");
				out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
			}
		%>
	</div>
</body>
</html>