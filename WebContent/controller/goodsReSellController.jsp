<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.service.GoodsService" %>
<%
//재판매 업데이트 호출
	GoodsService goodsService = GoodsService.getInstance();
	int gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
	int gdsStock = Integer.parseInt(request.getParameter("gdsStock"));
	String gdsEndDate = (String)request.getParameter("gdsEndDate");
	
	goodsService.resellGoods(gdsNum, gdsStock, gdsEndDate);
	pageContext.forward("../view/admin.jsp");
%>