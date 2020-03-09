<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
<c:if test="${user == null}">
	<li>
		<a href="../view/login.jsp"><h3>로그인</h3></a>
	</li>
	<li>
		<a href="../view/join.jsp"><h3>회원가입</h3></a>
	</li>
</c:if>
<c:if test="${user != null}">

<c:if test="${user.userAdmin == 1}">
<li>
	<h3 style="color:red;">관리자 </h3>	
</li>	
</c:if>

	<li>
		<h3 style="display:inline-block;">${user.userName}</h3>님 환영합니다.
	</li>
	<c:if test="${user.userAdmin eq 0 }">
	<li>
		<a href="../controller/cartListController.jsp"><h3>장바구니</h3></a>
	</li>
	<li>
		<a href="../view/orderList.jsp"><h3>주문목록</h3></a>
	</li>
	</c:if>
	<li>
		<a href="../view/logout.jsp"><h3>로그아웃</h3></a>
	</li>
</c:if>

</ul>