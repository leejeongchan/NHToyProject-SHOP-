<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <div class="col-lg-3">

	<h1 class="my-4">NH SHOP</h1>
	<div class="list-group">
		<a href="../controller/goodsCategoryController.jsp?cateCode=1" class="list-group-item">상의</a>
		<a href="../controller/goodsCategoryController.jsp?cateCode=2" class="list-group-item">하의</a> 
		<a href="../controller/goodsCategoryController.jsp?cateCode=3" class="list-group-item">자켓</a>
		<a href="../controller/goodsCategoryController.jsp?cateCode=4" class="list-group-item">악세서리</a> 
		<a href="../controller/goodsCategoryController.jsp?cateCode=5" class="list-group-item">신발</a>
	</div>

</div> -->

<c:if test="${user.userAdmin eq 0 || user.userAdmin eq null}">
<div class="list-group" style="margin-left:20px;">
		<a href="../controller/goodsCategoryController.jsp?cateCode=1" class="list-group-item">상의</a>
		<a href="../controller/goodsCategoryController.jsp?cateCode=2" class="list-group-item">하의</a> 
		<a href="../controller/goodsCategoryController.jsp?cateCode=3" class="list-group-item">자켓</a>
		<a href="../controller/goodsCategoryController.jsp?cateCode=4" class="list-group-item">악세서리</a> 
		<a href="../controller/goodsCategoryController.jsp?cateCode=5" class="list-group-item">신발</a>
	</div>
</c:if>
<%-- <c:if test="${user.userAdmin eq 1 }">
<ul>
	<li><a href="../controller/goodsMonitorController.jsp">상품 관리</a></li>
	<li><a href="../admin/goodsWrite.jsp">상품 등록</a></li>
	<li><a href="../controller/memberListController.jsp">사용자 관리</a></li>
</ul>
</c:if> --%>
