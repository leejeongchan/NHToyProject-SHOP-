<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Admin</title>


<link rel="stylesheet" href="../css/main.css">


<style>
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #eee;
}


</style>


<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}
</style>

</head>
<body>
	<div id="root">
		

		<section id="container">

			<div id="container_box">
				<h2>상품 등록</h2>

				<form role="form" action="../controller/goodswriteController.jsp" method="post" autocomplete="off" enctype="multipart/form-data">

					<div class="inputArea">
						<label>분류</label>
						 <select class="category1" name="cateCode">
							<option value="1">상의</option>
							<option value="2">하의</option>
							<option value="3">자켓</option>
							<option value="4">악세서리</option>
							<option value="5">신발</option>
						</select>

					</div>

					<div class="inputArea">
						<label for="gdsName">상품명</label> <input type="text" id="gdsName"
							name="gdsName" />
					</div>

					<div class="inputArea">
						<label for="gdsPrice">상품가격</label> <input type="text"
							id="gdsPrice" name="gdsPrice" />
					</div>

					<div class="inputArea">
						<label for="gdsStock">상품수량</label> <input type="text"
							id="gdsStock" name="gdsStock" />
					</div>

					<div class="inputArea">
						<label for="gdsDes">상품소개</label>
						<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
					</div>
					
					<div class="inputArea">
						<label for="exampleInputFile">이미지</label>
						<input type="file" name="gdsImg" id="exampleInputFile">
					</div>
					

					<div class="inputArea" style="display:inline-block;">
						<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
					</div>
					<div class="inputArea" style="display:inline-block;">
						<a href="../view/main.jsp" style="border: 1px solid black; color:black;">돌아가기</a>
					</div>
					

				</form>

			</div>
		</section>

	

	</div>