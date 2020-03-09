<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="shop.model.OrderVO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="shop.service.CartService" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	OrderVO orderVO = new OrderVO();
	//사용자 아이디
	String userId = (String) session.getAttribute("userId");

	//주문번호 랜덤
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	String subNum = "";
	
	for (int i = 1; i <= 6; i++) {
		subNum += (int) (Math.random() * 10);
	}
	String orderId = ymd + "_" + subNum;
	//수취인, 주소, 전화번호, 총 합계
	String orderRec = request.getParameter("orderRec");
	String userAddress = request.getParameter("userAddress");
	String orderPhon = request.getParameter("orderPhon");
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	orderVO.setOrderId(orderId);
	orderVO.setUserAddress(userAddress);
	orderVO.setAmount(amount);
	orderVO.setOrderRec(orderRec);
	orderVO.setUserId(userId);
	orderVO.setOrderPhon(orderPhon);
	
	//주문 서비스 호출
	CartService cartService = CartService.getInstance();
	cartService.orderCart(orderVO);
	
	
%>
<script>
	alert("주문 완료!");
	location.href="../view/main.jsp";
</script>