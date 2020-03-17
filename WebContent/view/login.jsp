<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%-- <link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css"> --%>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootlogin.css">
<script src="../js/jquery-3.3.1.min.js"></script>

</head>

<body>
	<div class="wrapper fadeInDown">
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
		  <div id="formContent">
		    <!-- Tabs Titles -->
		
		    <!-- Icon -->
		    <div class="fadeIn first">
		      <img src="../img/nh.jpg" id="icon" alt="User Icon" style="width:150px; height:150px;" />
		      <h1 style="color:#21b14a;">NH SHOP</h1>
		    </div>
		
		    <!-- Login Form -->
		    <form action="../controller/loginController.jsp" method="post">
		      <input type="text" id="userId" class="fadeIn second" name="userId" placeholder="username">
		      <input type="password" id="userPwd" class="fadeIn third" name="userPwd" placeholder="password">
		      <input type="submit" class="fadeIn fourth" style="background-color:#21b14a;" value="로그인">
		     
		    </form>
		
		    <!-- Remind Passowrd -->
		    <div id="formFooter">
		      <a href="./join.jsp" class="link_join" style="color:green;">회원가입</a>
		    </div>
		
		  </div>
	</div>

	
	
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>