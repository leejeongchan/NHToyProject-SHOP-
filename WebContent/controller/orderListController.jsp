<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.service.OrderService" %>
<%@ page import="java.util.*" %>
<%@ page import="shop.model.OrderVO" %>
<%
//전체 주문 목록(관리자 입장) 가져오기

	OrderService orderService = OrderService.getInstance();
	List<OrderVO> listAll = orderService.orderAllList();
	request.setAttribute("listAll", listAll);
	pageContext.forward("../admin/bootOrderList.jsp");
%>