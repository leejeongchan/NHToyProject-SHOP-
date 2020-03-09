<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	LoginServiceImpl loginService = new LoginServiceImpl();
	UserVO user =  loginService.login(userId, userPwd);
	if(user == null){
		out.println("<script>"  + 
							"alert('아이디 또는 비밀번호가 일치하지 않습니다.');" 
						  + "location.href='../view/login.jsp';" 
				  + "</script>");
	}else{
		session.setAttribute("user", user);
		session.setAttribute("userId",user.getUserId());
		session.setMaxInactiveInterval(60 * 30);
		 if(user.getUserAdmin() == 1){
			out.println("<script>" + "location.href='../view/admin.jsp';" 
		  + "</script>");
		} 
	}
	

	
	
%>
</body>
<script type="text/javascript">
	alert("로그인 성공!");
	location.href ="../view/main.jsp";
</script>
</html>