<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%-- <link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css"> --%>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="../css/bootlogin.css">
<script src="../js/jquery-3.3.1.min.js"></script>

</head>
<body>

<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
			<!-- Icon -->
			<div class="fadeIn first">
				<img src="../img/nh.jpg"
					id="icon" alt="User Icon" />
				<h1 style="color:#21b14a;">회원가입</h1>
			</div>

			<!-- Login Form -->
			<form action="../controller/joinController.jsp" method="post" name="userInfo" onsubmit="return formCheck(this);">
				<input type="text" name="userId" class="his_g" placeholder="★아이디 입력" maxlength="20" onkeydown="inputIdChk()" id="userId" title="아이디">
				<input style="background-color:#21b14a;" type="button" value="검증하기" onclick="IdChk()" style="display: inline-block; height: 48px">
				<!-- id 중복 체크 이정찬 작업  -->
				<input type="hidden" name="idDuplication" value="idUncheck" id="idDuplication">
				<div style="color:red" class="checkMessage" id="chmsg"></div> 
				<h4 style="color:red;">★표시는 필수입력 사항입니다.</h4>
				<input type="password" name="userPwd" class="his_g" placeholder="★비밀번호 입력" id="userPwd" 	maxlength="20" title="비밀번호"><br>
				<input type="password" name="userPwd2" class="his_g" placeholder="★비밀번호 재입력" id="userPwd2" maxlength="20" title="비밀번호2"><br>
				
				<input type="text" name="userName"class="his_g"placeholder="★이름 입력"id="userName" maxlength="20"title="이름"> <br>
				<input type="text" name="userAddress" class="his_g"placeholder="주소 입력"id="address"maxlength="150"title="주소"> 
				<input type="text" name="userEmail"class="his_g"placeholder="★이메일 입력"id="email" maxlength="100"title="이메일"> 
				<input type="text" name="userPhNumber"class="his_g"placeholder="★폰번호 입력"id="phNumber" maxlength="20"title="폰번호"> <br>
				<input style="background-color:#21b14a;" type="submit" class="fadeIn fourth" value="회원가입">

			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a href="./login.jsp"
					class="link_join">로그인으로</a>
			</div>

		</div>
	</div>
	<!-- <div class="inner_login">
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
	</div> -->
</body>
<script type="text/javascript">
/*
 * 폼형식 단순 체크
 */
function formCheck(obj) {

	var telRegExp = /^(010)\d{3,4}\d{4}$/;
	// 전화번호	
	var emailRegExp = /^\w{1,12}@[a-z]{1,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
	// 이메일	
	//var pwdRegExp = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	// 대문자 + 소문자 + 숫자 + 특수 문자 포함 8자 이상의 비밀번호	
	if (obj.userId.value == null || obj.userId.value == "") {
		alert("아이디를 입력하세요.");
		obj.userId.focus();
		return false;
	}
	if (obj.userPwd.value == null || obj.userPwd.value == "") {
		alert("비밀번호를 입력하세요.");
		obj.userPwd.focus();
		return false;
	}
	if(document.getElementById("userName").value == null || document.getElementById("userName").value ==""){
		alert("이름을 입력하세요.");
		document.getElementById("userName").focus();
		return false;
	}
	if(document.getElementById("address").value == null || document.getElementById("address").value ==""){
		alert("주소를 입력하세요.");
		document.getElementById("address").focus();
		return false;
	}

	if(document.getElementById("email").value == null || document.getElementById("email").value ==""){
		alert("이메일을 입력하세요.");
		document.getElementById("email").focus();
		return false;
	}

	if(document.getElementById("phNumber").value == null || document.getElementById("phNumber").value ==""){
		alert("핸드폰 번호를 입력하세요.");
		document.getElementById("phNumber").focus();
		return false;
	}
/* 	if (!pwdRegExp.test(document.getElementById("userPwd").value)) {
		alert(" 비밀번호는 대문자,소문자,특수문자,숫자 포함 8자 이상 입력하세요.");
		return false;
	} */
	if (document.getElementById("userPwd").value != document
			.getElementById("userPwd2").value) {
		alert("비밀번호가 서로 일치하지 않습니다.");
		document.getElementById("userPwd").focus();
		return false;
	}
	if (!telRegExp.test(document.getElementById("phNumber").value)) {
		alert("010 xxx/xxxx xxxx 형식이 아닙니다.");
		document.getElementById("phNumber").focus();
		return false;
	}
	if (!emailRegExp.test(document.userInfo.email.value)) {
		alert("메일 입력 형식이 잘못 되었습니다.");
		document.getElementById("email").focus();
		return false;
	}
	if (document.getElementById("idDuplication").value == "idUncheck") {
		alert("아이디는 중복확인해주세요");
		return false;
	}
}
/*
 * 아이디를 다시 건들시 Uncheck 으로 바꿔준다.
 */
function inputIdChk() {
	document.userInfo.idDuplication.value = "idUncheck";
}
console.log(document.getElementById("idDuplication").value);
/*
 * 아이디 적합 유무 체크
 */

function IdChk() {
		var idRegExp = /^[a-z]+[a-z0-9]{1,15}$/g;
		if (!idRegExp.test(document.getElementById("userId").value)) {
			alert("아이디가 적합하지 않습니다 글자수는 15글자 제한입니다..");
			console.log(document.getElementById("idDuplication").value);
			return false;
		}else{
			
		
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
}
</script>
</html>