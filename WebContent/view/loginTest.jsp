<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인디자인테스트</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootlogin.css">
<script src="../js/jquery-3.3.1.min.js"></script>

</head>
<body>

<div class="wrapper fadeInDown">
		  <div id="formContent">
		    <!-- Tabs Titles -->
		
		    <!-- Icon -->
		    <div class="fadeIn first">
		      <img src="../img/nh.jpg" id="icon" alt="User Icon" style="width:150px; height:150px;" />
		      <h1 style="color:#21b14a;">NH SHOP</h1>
		    </div>
		
		    <!-- Login Form -->
		    <form action="<%=request.getContextPath() %>/userView/loginOk.jsp" method="post" name="userInfoForm" onsubmit="return formCheck(this);">
		      <input type="text" id="userId" class="fadeIn second" name="userId" placeholder="username">
		      <input type="password" id="userPwd" class="fadeIn third" name="userPwd" placeholder="password">
		      <input type="submit" class="fadeIn fourth" style="background-color:#21b14a;" value="로그인">
		     
		    </form>
		
		    <!-- Remind Passowrd -->
		    <div id="formFooter">
		      <a href="<%=request.getContextPath()%>/userView/userRegister.jsp" class="link_join" style="color:green;">회원가입</a>
		    </div>
		
		  </div>
	</div>
	<%-- <div class="inner_login">

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
	</div> --%>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery-3.3.1.min.js"></script>

	<script src="../js/bootstrap.min.js"></script>
</body>
</html>