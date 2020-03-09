<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="shop.service.CartService" %>
<%@ page import="shop.model.CartListVO" %>
<%
	//해당 접속자의 카트 목록 불러오기 ( 조인)
	CartService cartService = CartService.getInstance();
	String userId = (String)session.getAttribute("userId");
	List<CartListVO> list = cartService.getCartList(userId);
	request.setAttribute("cartList", list);
	pageContext.forward("../view/cartList.jsp");
%>