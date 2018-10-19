<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 자바빈 클래스 import --%>
<%@ page import="jsp.member.model.MemberBean" %>
<%@ page import="jsp.member.model.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 처리 JSP</title>
<link href='<%=request.getContextPath() %>/css/join_style.css' rel='stylesheet' style='text/css' />
<script>
	// 확인 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href="MainForm.jsp";
	}
</script>
</head>
<body>
	<%
		// 한글 깨짐을 방지하기 위한 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
	%>
	
	<jsp:useBean id="memberBean" class="jsp.member.model.MemberBean"/>
	<jsp:setProperty property="*" name="memberBean"/>
	
	<%
		MemberDAO dao = MemberDAO.getInstance();
	
	// 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
	// insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
	dao.insertMember(memberBean);
	%>
	
	<div id="wrap">
		<br><br>
		<b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
		<br><br>
		<font color="blue"><%=memberBean.getName()%></font>님 가입을 축하드립니다.
		<br><br>
		
		<table>
			<tr>
				<td id="title">아이디</td>
				<td><%=memberBean.getId()%></td>
			</tr>
			
			<tr>
				<td id="title">비밀번호</td>
				<td><%=memberBean.getPassword()%></td>
			</tr>
			
			<tr>
				<td id="title">이름</td>
				<td><%=memberBean.getName()%></td>
			</tr>
			
			<tr>
				<td id="title">성별</td>
				<td><%=memberBean.getGender()%></td>
			</tr>
			
			<tr>
				<td id="title">생일</td>
				<td><%=memberBean.getBirthyy()%>년
					<%=memberBean.getBirthmm()%>월
					<%=memberBean.getBirthdd()%>일
				</td>
			</tr>
			
			<tr>
				<td id="title">이메일</td>
				<td>
					<%=memberBean.getMail1()%>@<%=memberBean.getMail2()%>
				</td>
			</tr>
			
			<tr>
				<td id="title">휴대전화</td>
				<td><%=memberBean.getPhone()%></td>
			</tr>
			
			<tr>
				<td id="title">주소</td>
				<td><%=memberBean.getAddress()%></td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="확인" onclick="goFirstForm()">
	</div>
</body>
</html>