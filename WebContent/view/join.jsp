<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css">
<script src="../js/jquery-3.3.1.min.js"></script> 
</head>
<body>
	<div class="inner_login">
		<div class="login_tistory">

			<form method="post" id="authForm" action="../controller/joinController.jsp" name="userInfo">

				<fieldset>
					<legend class="screen_out">회원가입 입력폼</legend>
					<div class="box_login">
						<div class="inp_text">
							<label for="loginId" class="screen_out">아이디</label> <input
								type="text" id="userId" name="userId" placeholder="ID" onkeydown="inputIdChk()">
								
								
						</div>
						<input type="hidden" name="idDuplication" value="idUncheck" id="idDuplication">
						<input style="background-color:#21b14a;" type="button" value="검증하기" onclick="IdChk()" style="display: inline-block; height: 48px">
						<div style="color:red" class="checkMessage" id="chmsg"></div> 
						<div class="inp_text">
							<label for="loginPw" class="screen_out">비밀번호</label> <input
								type="password" id="loginPw" name="userPwd"
								placeholder="Password">
						</div>
						<div class="inp_text">
							<label for="loginId" class="screen_out">이름</label> <input
								type="text" id="userName" name="userName" placeholder="Name">
						</div>
						<div class="inp_text">
							<label for="loginId" class="screen_out">이메일</label> <input
								type="email" id="userEmail" name="userEmail" placeholder="Email">
						</div>
						<div class="inp_text">
							<label for="loginId" class="screen_out">주소</label> <input
								type="text" id="userAddress" name="userAddress" placeholder="Address">
						</div>
						<div class="inp_text">
							<label for="loginId" class="screen_out">핸드폰번호</label> <input
								type="text" id="userPhNumber" name="userPhNumber" placeholder="PhNum">
						</div>
						
					</div>
					
					<button type="submit" class="btn_login">회원가입</button>
					<div class="login_append">

						<span class="txt_find"> <a href="./login.jsp"
							class="link_find">로그인페이지로</a>
						</span>
					</div>

				</fieldset>
			</form>

		</div>
	</div>
</body>
<script type="text/javascript">
/*
 * 아이디를 다시 건들시 Uncheck 으로 바꿔준다.
 */
function inputIdChk() {
	document.userInfo.idDuplication.value = "idUncheck";
}

/*
 * 아이디 적합 유무 체크
 */

function IdChk() {
	  
		var userId = $("#userId").val();
		console.log("userId=" + userId);
		//ajax 
		$.ajax({
			type : "POST",
			url : "../UserRegisterCheckAjax",
			async : false,
			data : {
				userId : userId
			},
			success : function(result) {
				console.log("result=" + result);
				//alert(result);
				if (result == 1) {
					//alert("존재하지 않으므로 사용 가능합니다.");
					$('#chmsg').html("존재하지 않으므로 사용 가능합니다.");

				} else {
					//alert("아이디가 존재합니다.")
					$('#chmsg').html("아이디가 존재 합니다.");
				}
			},
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error); // 실패 시 처리
			}
		})
		//alert("사용 하실수 있습니다.");

		document.getElementById("idDuplication").value = "idCheck";
		console.log(document.getElementById("idDuplication").value);
	
}
</script>
</html>