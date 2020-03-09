<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sha" class="encrypt.SHA256"></jsp:useBean>
<%@page import="user.model.UserVO" %>
<%@page import="user.service.LoginServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- useBean을 사용하여 회원가입 폼에 값들을 user로 묶어준다. -->
<jsp:useBean id="user" class="user.model.UserVO" scope="request">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean>

<%
	//암호화하여 넣어주기.
	user.setUserPwd(sha.getSHA256(user.getUserPwd()));
	//컨트롤러로 서비스를 호출
	LoginServiceImpl loginService = new LoginServiceImpl();
	loginService.register(user);

%>
</body>
<script type="text/javascript" lang="javascript">
	alert("회원가입을 축하드립니다 \n 다시 로그인해주세요!");
	location.href ="../view/login.jsp";
</script>
</html>