<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../css/main.css">
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
	<div class="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>


		<section id="container">
			<div id="container_box">

				<section id="content">
					
					
						<ul>
					
				
					<%-- jsp상의 변수 선언 --%>
					<c:set var="sum" value="0" />
				
					<c:forEach items="${cartList}" var="cartList">
					<li>
						
					
						<div class="thumb">
							<img src="${pageContext.request.contextPath }/images/${cartList.gdsImg}" />
						</div>
						<div class="gdsInfo">
							<p>
								<span>상품명</span>${cartList.gdsName}<br />
								<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원<br />
								<span>구입 수량</span>${cartList.cartStock} 개<br />
								<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원
							</p>
							
							<div class="delete">
								<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
								
								<script>
									$(".delete_${cartList.cartNum}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
										
										if(confirm_val) {
											//var checkArr = new Array();
											
											//checkArr.push($(this).attr("data-cartNum"));
											var cartNum = $(this).attr("data-cartNum");
											console.log(cartNum);
											
											$.ajax({
												url : "../CartDeleteAjax",
												type : "post",
												dataType: "json",
												async: false,
												data : { cartNum : cartNum },
												success : function(result){
													if(result == 1) {												
														location.href = "../view/cartList.jsp";
													} else {
														alert("삭제 실패");
													}
												},error: function(){
													alert("삭제를 할 수 없습니다.");
												}
											});
										}	
									});
								</script> 
							</div>
						</div>			
					</li>
					
					<%-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 --%>
					<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
					
					</c:forEach>
				</ul>
				<div class="listResult">
					<div class="sum">
						총 합계: <fmt:formatNumber pattern="###,###,###" value="${sum }"/>
					</div>
					<div class="orderOpen">
						<button type="button" class="orderOpen_bnt">주문정보 입력</button>
						<script>
							$(".orderOpen_bnt").click(function(){
								$(".orderInfo").slideDown();
								$(".orderOpen_bnt").slideUp();
							});
						</script>
					</div>
				</div>
				<!-- 주문 폼 -->
				<div class="orderInfo">
					<input type="checkbox" id="checkMe">나에게
					<form action="../controller/orderController.jsp" method="post" autocomplete="off">
						<input type="hidden" name="amount" value="${sum }"/>
						<div class="inputArea">
							<label for="">수령인</label>
							<input type="text" name="orderRec" id="orderRec">
						</div>
						<div class="inputArea">
							<label for="">연락처</label>
							<input type="text" name="orderPhon" id="orderPhon">
						</div>
						<div class="inputArea">
							<label for="">주소</label>
							<input type="text" name="userAddress" id="userAddress">
						</div>
						<div class="inputArea">
						    <button type="submit" class="order_btn">주문</button>
						    <button type="button" class="cancel_btn">취소</button> 
						 </div>
						 <script type="text/javascript">
						 	$(".cancel_btn").click(function(){
						 		 $(".orderInfo").slideUp();
								 $(".orderOpen_bnt").slideDown();	
						 	});
						 	//나에게 선택이 된다면 로그인 정보를 폼에 넣어주기.
						 	$(document).ready(function(){
						 		
    							$("#checkMe").change(function(){
        						if($("#checkMe").is(":checked")){
            							var confirm_val = confirm("나에게 배송하시겠습니까?");
            							var orderRec = '${sessionScope.user.userId}';
            							var orderPhon = '${sessionScope.user.userPhNumber}';
            							var userAddress = '${sessionScope.user.userAddress}';
            							
            							$("#orderRec").val(orderRec);
            							$("#orderPhon").val(orderPhon);
            							$("#userAddress").val(userAddress);
            						
            						
       							}else{
       								$("#orderRec").val("");
        							$("#orderPhon").val("");
        							$("#userAddress").val("");        					    
        						}
 						  	  });
							});
						 	
							
						 </script>
					</form>
				</div>
				</section>
			</div>
		</section>
	</div>
</body>
</html>