<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>카테고리</h3>
<c:if test="${user.userAdmin eq 0 || user.userAdmin eq null}">
<ul>
	<li><a href="../controller/goodsCategoryController.jsp?cateCode=1">상의</a></li>
	<li><a href="../controller/goodsCategoryController.jsp?cateCode=2">하의</a></li>
	<li><a href="../controller/goodsCategoryController.jsp?cateCode=3">자켓</a></li>
	<li><a href="../controller/goodsCategoryController.jsp?cateCode=4">악세서리</a></li>
	<li><a href="../controller/goodsCategoryController.jsp?cateCode=5">신발</a></li>
</ul>
</c:if>
<c:if test="${user.userAdmin eq 1 }">
<ul>
	<li><a href="../controller/goodsMonitorController.jsp">상품 관리</a></li>
	<li><a href="../admin/goodsWrite.jsp">상품 등록</a></li>
	<li><a href="../controller/memberListController.jsp">사용자 관리</a></li>
</ul>
</c:if>
