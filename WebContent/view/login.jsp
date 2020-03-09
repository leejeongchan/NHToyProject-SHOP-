<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css">
</head>

<body>

	<div class="inner_login">

		<h1 style="margin-left: 10px;">
			<a href="./main.jsp">NH Shop</a>
		</h1>
		<div class="login_tistory">
			<%
				String userID = null;
				if (session.getAttribute("userId") != null) {
					userID = (String) session.getAttribute("userId");

				}
				System.out.println("userId: " + userID);
				if (userID != null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('로그인이 된 상태입니다.');");
					script.println("location.href='main.jsp';");
					script.println("</script>");
					script.close();

				}
			%>
			<form method="post" id="authForm"
				action="../controller/loginController.jsp">

				<fieldset>
					<legend class="screen_out">로그인 정보 입력폼</legend>
					<div class="box_login">
						<div class="inp_text">
							<label for="loginId" class="screen_out">아이디</label> <input
								type="text" id="loginId" name="userId" placeholder="ID">
						</div>
						<div class="inp_text">
							<label for="loginPw" class="screen_out">비밀번호</label> <input
								type="password" id="loginPw" name="userPwd"
								placeholder="Password">
						</div>
					</div>
					<button type="submit" class="btn_login">로그인</button>
					<div class="login_append">

						<span class="txt_find"> <a href="./join.jsp"
							class="link_find">회원가입</a>
						</span>
					</div>

				</fieldset>
			</form>

		</div>
	</div>
</body>
</html>