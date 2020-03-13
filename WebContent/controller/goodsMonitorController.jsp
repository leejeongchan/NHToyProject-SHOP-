<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.service.GoodsService" %>
<%@ page import="shop.model.GoodsVO" %>
<%@ page import="java.util.*" %>
<%@ page import="shop.model.PageList" %>
<%@ include file="../view/bbsInclude.jspf" %>

<!-- 상품 관리 컨트롤
	상품 목록들을 다 가져와서 뿌려준다.
 -->
<%
	GoodsService goodsService = GoodsService.getInstance();
	PageList listAll = goodsService.listAll(currentPage,pageSize,blockSize);
	request.setAttribute("listAll", listAll);
	pageContext.forward("../admin/goodsMonitor.jsp");
%>
