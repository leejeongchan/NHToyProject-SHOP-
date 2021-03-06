<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="shop.service.GoodsService" %>
<%@page import="shop.model.GoodsVO" %>
<%@page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="../css/main.css">
<script src="../js/jquery-3.3.1.min.js"></script>

<style>
section#content ul li {
	margin: 10px 0;
	padding: 10px 0;
	border-bottom: 1px solid #999;
}

section#content ul li img {
	width: 250px;
	height: 250px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 250px;
}

section#content div.gdsInfo {
	float: right;
	width: calc(100% - 320px);
}

section#content div.gdsInfo {
	font-size: 20px;
	line-height: 2;
}

section#content div.gdsInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

section#content div.gdsInfo .delete {
	text-align: right;
}

section#content div.gdsInfo .delete button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.delBtn {
	float: right;
	width: 300px;
	text-align: right;
}

.delBtn button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.checkBox {
	float: left;
	width: 30px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}

.listResult {
	padding: 20px;
	background: #eee;
}

.listResult .sum {
	float: left;
	width: 45%;
	font-size: 22px;
}

.listResult .orderOpne {
	float: right;
	width: 45%;
	text-align: right;
}

.listResult .orderOpne button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #999;
	background: #fff;
}

.listResult::after {
	content: "";
	display: block;
	clear: both;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

#userAddr2, #userAddr3 {
	width: 250px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}

.orderInfo .inputArea #sample2_address {
	width: 230px;
}

.orderInfo .inputArea #sample2_detailAddress {
	width: 280px;
}

.orderInfo .inputArea #sample2_extraAddress {
	display: none;
}
</style>
</head>
<body>

	<div class="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>


		<section id="container">
			<div id="container_box">

				<section id="content">

					<ul>
						<c:forEach items="${memberlist}" var="listAll">
							<li>
								
								<div class="gdsInfo">
									<p>
										<span>아이디</span>${listAll.userId}<br /> 
										<span>이름</span>${listAll.userName}"<br />
										<span>관리자</span><c:if test="${listAll.userAdmin eq 1 }">Y</c:if><c:if test="${listAll.userAdmin eq 0 }">N</c:if><br />
									</p>

									<div class="delete">
										<button type="button" class="delete_${listAll.userId}_btn" data-userId="${listAll.userId}">삭제</button>

										<script>
											$(".delete_${listAll.userId}_btn").click(function() {
																var confirm_val = confirm("정말 회원을 삭제하시겠습니까?");
																if (confirm_val) {
												
																	var userID = $(this).attr("data-userId");
																	console.log(userID);

																	$.ajax({
																				url : "../DeleteMemberAjax",
																				type : "post",
																				dataType : "json",
																				async : false,
																				data : {
																					userID : userID
																				},
																				success : function(result) {
																					if (result == 1) {
																						location.href = "../controller/memberListController.jsp";
																					} else {
																						alert("삭제 실패");
																					}
																				},
																				error : function() {
																					alert("삭제를 할 수 없습니다.");
																				}
																			});
																}
															});
										</script>
									</div>
									<c:if test="${listAll.userAdmin eq 0 }">
									
									
									<div class="delete">
										<button type="button" class="update_${listAll.userId}_btn" data-userId="${listAll.userId}">관리자전환</button>
										<script>
											$(".update_${listAll.userId}_btn").click(function() {
																var confirm_val = confirm("관리자로 승급시키겠습니까?");
																if (confirm_val) {
												
																	var userID = $(this).attr("data-userId");
																	console.log(userID);

																	$.ajax({
																				url : "../AdminMemberAjax",
																				type : "post",
																				dataType : "json",
																				async : false,
																				data : {
																					userID : userID
																				},
																				success : function(result) {
																					if (result == 1) {
																						location.href = "../controller/memberListController.jsp";
																					} else {
																						alert("승급 실패");
																					}
																				},
																				error : function() {
																					alert("승급을 할 수 없습니다.");
																				}
																			});
																}
															});
										</script>
									</div>
								</c:if>
								</div>
							</li>

						</c:forEach>
					</ul>


				</section>
			</div>
		</section>
	</div>
</body>
</html>