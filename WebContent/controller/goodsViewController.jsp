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
		//종료 플래그 받아서 1이면 alert 0이면 아래 수행
		int gdsEndFlag = Integer.parseInt(request.getParameter("gdsEndFlag"));
		if(gdsEndFlag == 0){
			GoodsService goodsService = GoodsService.getInstance();
			GoodsVO goodsVO = goodsService.goodsView(gdsNum);
			request.setAttribute("goodsVO", goodsVO);
			pageContext.forward("../view/goodsView.jsp");
		}else if(gdsEndFlag == 1){
			out.print("<script>alert('마감된 상품입니다!!'); location.href='../view/main.jsp';</script>");

		}else if(gdsEndFlag == 2 ){
			out.print("<script>alert('출시 전 상품입니다!!'); location.href='../view/main.jsp';</script>");

		}

	%>
</body>
</html>