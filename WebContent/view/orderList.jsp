<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="shop.service.OrderService" %>
<%@ page import="java.util.*" %>
<%@ page import="shop.model.OrderVO" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/newMain.css?ver=1">

<script src="../js/jquery-3.3.1.min.js"></script> 

<style>
section#content ul li { margin:10px 0; padding:10px 0; border-bottom:1px solid #999; }
		section#content ul li img { width:250px; height:250px; }
		section#content ul li::after { content:""; display:block; clear:both; }
		section#content div.thumb { float:left; width:250px; }
		section#content div.gdsInfo { float:right; width:calc(100% - 320px); }
		section#content div.gdsInfo { font-size:20px; line-height:2; }
		section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		section#content div.gdsInfo .delete { text-align:right; }
		section#content div.gdsInfo .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.allCheck { float:left; width:200px; }
		.allCheck input { width:16px; height:16px; }
		.allCheck label { margin-left:10px; }
		.delBtn { float:right; width:300px; text-align:right; }
		.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.checkBox { float:left; width:30px; }
		.checkBox input { width:16px; height:16px; }
		
		.listResult { padding:20px; background:#eee; }
		.listResult .sum { float:left; width:45%; font-size:22px; }
		
		.listResult .orderOpne { float:right; width:45%; text-align:right; }
		.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
		.listResult::after { content:""; display:block; clear:both; } 
		
		.orderInfo { border:5px solid #eee; padding:20px; display:none; }
		.orderInfo .inputArea { margin:10px 0; }
		.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
		
		.orderInfo .inputArea #sample2_address { width:230px; }
		.orderInfo .inputArea #sample2_detailAddress { width:280px; }
		.orderInfo .inputArea #sample2_extraAddress { display:none; }

</style>
</head>
<body>
	<% 
		//주문 목록 받아오기(원래 컨트롤러로 해야하는데 직접 가져옴)
		OrderService orderService = OrderService.getInstance();
		String userId = (String)session.getAttribute("userId");
		List<OrderVO> orderList = orderService.orderList(userId);
		pageContext.setAttribute("orderList", orderList);
	%>
	<%@ include file="../include/nav.jsp"%>

	<div class="root">
		


		<section id="container">
			<div id="container_box">

				<section id="content">
					<h1>주문목록</h1>
						<ul>
					
	
					<c:forEach items="${orderList}" var="orderList">
					<li>
						
					
						
						<div class="gdsInfo">
							<p>
								<span >주문번호</span><h3 style="color:red; ">${orderList.orderId}</h3><br />
								<span>수취인</span>${orderList.orderRec}<br />
								<span>주문인</span>${orderList.userId}<br />
								<span>주소</span>${orderList.userAddress} <br />
								<span>핸드폰번호</span>${orderList.orderPhon }<br/>
								<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원<br/>
								<span>배송 상태</span>
								<c:if test="${orderList.orderState eq 1 }"><h3 style="color:red;">Y</h3></c:if>
								<c:if test="${orderList.orderState eq 0 }"><h3 style="color:red;">N</h3></c:if>
							</p>
							
							
						
						</div>			
					</li>
					
				
					
					</c:forEach>
				</ul>
			
				</section>
			</div>
		</section>
	</div>
</body>
<script>
$(document).on('scroll', function() {

	if ($(this).scrollTop() > 1) {
		$('header').addClass('stivky');
	}

	else {
		$('header').removeClass('stivky');
	}
});

/*top botton Scroll to top animatioon change JQuery code below*/

$(document).on('click', '#scrollToTop', function() {
	$('html,body').animate({
		scrollTop : 0
	}, 500);
	return false;
});

/*top botton show/hide animatioon change JQuery code below*/

$(document).scroll(function(e) {
	var scrollpos = $(this).scrollTop();

	if (scrollpos < 500) {
		$('#scrollToTop').addClass('hide');
	} else {
		$('#scrollToTop').removeClass('hide');

	}

});
</script>
</html>