<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
<!-- css 파일 분리 -->
<link href='<%=request.getContextPath() %>/css/join_style.css' rel='stylesheet' style='text/css'/>
<script>
	function checkValue(){
		if(!document.userInfo.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if(!document.userInfo.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(document.userInfo.password.value != document.userInfo.passwordcheck.value){
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	// 취소 버튼 클릭시 첫화면으로 이동
	function goLoginForm() {
		location.href="MainForm.jsp";
	}
</script>
</head>
<body>

	<div id="wrap">
	<br><br>
	<b><font size="6" color="gray">회원가입</font></b>
	<br><br><br>
	
	<form method="post" action="<%=request.getContextPath() %>/pro/JoinPro.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                    	<input type="text" name="id" maxlength="20">
                    	<input type="button" value="중복확인">	
                    </td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td><input type="password" name="password" maxlength="15"></td>
                </tr>
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td><input type="password" name="passwordcheck" maxlength="15"></td>
                </tr>
                <tr>
                    <td id="title">이름</td>
                    <td><input type="text" name="name" maxlength="40"/></td>
                </tr>
                <tr>
                    <td id="title">성별</td>
                    <td>
                    	<input type="radio" name="gender" value="남" checked>남
                    	<input type="radio" name="gender" value="여">여
                    </td>
                </tr>
                <tr>
                    <td id="title">생일</td>
                    <td>
                    	<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" />
                    	<select name="birthmm">
                    		<option value="">월</option>
                    		<option value="01">1</option>
                    		<option value="02">2</option>
                    		<option value="03">3</option>
                    		<option value="04">4</option>
                    		<option value="05">5</option>
                    		<option value="06">6</option>
                    		<option value="07">7</option>
                    		<option value="08">8</option>
                    		<option value="09">9</option>
                    		<option value="10">10</option>
                    		<option value="11">11</option>
                    		<option value="12">12</option>
                    	</select>
                    	<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
                    </td>
                </tr>
                <tr>
                    <td id="title">이메일</td>
                    <td><input type="text" name="mail1" maxlength="30">@
                    	<select name="mail2">
                    		<option>naver.com</option>
                    		<option>daum.net</option>
                    		<option>gmail.com</option>
                    		<option>nate.com</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                    	<input type="text" name="phone"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                    	<input type="text" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br><br><input type="submit" value="가입"/> <input type="button" value="취소" onclick="goLoginForm()">
     </form>
     </div>
</body>
</html>