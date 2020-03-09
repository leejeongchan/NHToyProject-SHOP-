<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.model.GoodsVO" %>
<%@ page import="shop.service.GoodsService" %>
<%@ page import ="java.util.*" %>
<%
	int cateCode = Integer.parseInt(request.getParameter("cateCode"));
	GoodsService goodsService = GoodsService.getInstance();
	List<GoodsVO> listCate  = goodsService.listCate(cateCode);
	request.setAttribute("listAll", listCate);
	pageContext.forward("../view/main.jsp");
	
%>