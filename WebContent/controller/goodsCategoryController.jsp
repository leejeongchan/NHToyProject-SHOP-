<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.model.GoodsVO" %>
<%@ page import="shop.service.GoodsService" %>
<%@ page import ="java.util.*" %>
<%@ include file="../view/bbsInclude.jspf" %>
<%@ page import="shop.model.PageList" %>
<%
	int cateCode = Integer.parseInt(request.getParameter("cateCode"));
	GoodsService goodsService = GoodsService.getInstance();
	PageList listCate  = goodsService.listCate(cateCode,currentPage,pageSize,blockSize);
	System.out.println("goodsCategory currentPage: "+currentPage+" pageSize: "+pageSize+" blockSize: "+blockSize+"listAll.startPage: "+listCate.getList().get(0).getGdsName());

	request.setAttribute("page", listCate);
	pageContext.forward("../view/main.jsp");
	
%>