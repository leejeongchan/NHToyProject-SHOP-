<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.service.GoodsService" %>
<%@ page import= "shop.model.GoodsVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
	<% 
		int gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
		GoodsService goodsService = GoodsService.getInstance();
		GoodsVO goodsVO = goodsService.goodsView(gdsNum);
		//댓글도 가져오기 ??
		request.setAttribute("goodsVO", goodsVO);
		pageContext.forward("../view/goodsView.jsp");
	%>
</body>
</html>