<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!-- Page Content -->
	<div class="wrapper">
		<header>
		
			<div class="container">
				<div id="logo" ><a href="../view/main.jsp">NH SHOP</a></div>

				<nav>
					<a href="../controller/goodsCategoryController.jsp?cateCode=1">상의</a>
					<a href="../controller/goodsCategoryController.jsp?cateCode=2">하의</a>
					<a href="../controller/goodsCategoryController.jsp?cateCode=3">자켓</a>
					<a href="../controller/goodsCategoryController.jsp?cateCode=4">악세서리</a>
					<a href="../controller/goodsCategoryController.jsp?cateCode=5">신발</a>
					<c:if test="${user == null }">
					<a href="../view/login.jsp">로그인</a>
					<a href="../view/join.jsp">회원가입</a>
					</c:if>
					<c:if test="${user != null }">
					<a href="../controller/cartListController.jsp">장바구니</a>
					<a href="../view/orderList.jsp">주문목록</a>
					<a href="../view/logout.jsp">로그아웃</a>
				
					</c:if>
				</nav>

			</div>
		</header>

		<a id="scrollToTop" class="hide" href="#"><i
			class="fa fa-arrow-circle-up"></i></a>

	</div>