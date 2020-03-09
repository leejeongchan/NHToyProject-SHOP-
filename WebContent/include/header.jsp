<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="title">
	<c:if test="${user.userAdmin eq 0 || user.userAdmin eq null }">
		<a href="../view/main.jsp">NH SHOP</a>

	</c:if>
	<c:if test="${user.userAdmin eq 1 }">
		<a href="../view/main.jsp">NH SHOP Admin</a>
	</c:if>
</h1>