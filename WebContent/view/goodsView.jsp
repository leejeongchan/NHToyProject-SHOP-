<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="user.model.UserVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품조회</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/view.css">
<link rel="stylesheet" href="../css/newMain.css?ver=1">
<style>
 div.replyModal { position:relative; z-index:1; display:none; }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px);  padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
</style>
<script src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function replyList() {
		var str = "";
		var gdsNum = $(".Num").val();
		var data = {
			gdsNum : gdsNum
		};
		console.log("gdsNum: " + gdsNum);
		$.ajax({
			url : "../ReplyListAjax",
			type : "post",
			data : data,
			dataType : "json",
			async : false,
			success : function(data) {
			
				var box = data.vo;
				var txt = "";
				for (i in box) {
					txt += '<li>';
					txt += '<div class="userInfo">';
					txt += '<span class="userName">' + box[i].userId
							+ '</span>';
					txt += '<span class="date">' + box[i].repReg + '</span>';
					txt += '</div>';
					txt += '<div class="replyContent">' + box[i].repContent
							+ '</div>';
					txt += '<div class="replyFooter">';
					
					txt += '<button type="button" class="modify" data-repNum='+box[i].repNum+'>'+"수정"+'</button>';
					txt += '<button type="button" class="delete" data-repNum='+box[i].repNum+'>'+"삭제"+'</button>';
					
					txt += '</div>';
					txt += '</li>';
					
				}
				$("section.replyList ol").html(txt);
			},
			error : function() {
				$("section.replyList ol").html("댓글이 없네요ㅠ. 아무나 등록해주세요~");
				replyList();
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>

	<div id="root">
		

		<section id="container">
			<div id="container_box">

				<section id="content">
					<div class="goods">
						<div class="goodsImg">
							<img
								src="${pageContext.request.contextPath}/images/${goodsVO.gdsImg}">
						</div>

						<div class="goodsInfo">
							<input type="text" class="Num" name="gdsNum"
								value="${goodsVO.gdsNum}" readonly>
							<p class="gdsName">
								<span>상품명</span>${goodsVO.gdsName}</p>

							<p class="cateName">
								<span>카테고리</span>
								<c:if test="${goodsVO.cateCode eq 1}">상의</c:if>
								<c:if test="${goodsVO.cateCode eq 2}">하의</c:if>
								<c:if test="${goodsVO.cateCode eq 3}">자켓</c:if>
								<c:if test="${goodsVO.cateCode eq 4}">악세서리</c:if>
								<c:if test="${goodsVO.cateCode eq 5}">신발</c:if>
							</p>

							<p class="gdsPrice">
								<span>가격 </span>
								<fmt:formatNumber pattern="###,###,###"
									value="${goodsVO.gdsPrice}" />
								원
							</p>

							<p class="gdsStock">
								<span>재고 </span>
								<fmt:formatNumber pattern="###,###,###"
									value="${goodsVO.gdsStock}" />
								EA
							</p>
							<p class="gdsHit">
								<span>추천 수</span>
								<h3 id="gdsHit">${goodsVO.gdsHit }</h3>
							</p>

							<c:if test="${goodsVO.gdsStock != 0}">

								<p class="cartStock">
									<span>구입 수량</span> <input type="number" class="numBox" min="1"
										max="5" value="1" /> <input type="hidden"
										value="${goodsVO.gdsStock}" class="gdsStock_hidden" />

								</p>
								<p class="addToCart">
									<input type="button" value="카트에 담기" onClick="addCart()">
									<input type="button" value="추천하기" onClick="recommand()">
									<!-- <button type="button" class="addCart_btn">카트에 담기</button> -->
									<!-- 카트담기 ajax -->
									<script type="text/javascript">
										function addCart() {
											var gdsNum = $(".Num").val();
											var cartStock = $(".numBox").val();
											if(cartStock == 0){
												alert("재고가 부족합니다!");
												return;
											}

											var data = {
												gdsNum : gdsNum,
												cartStock : cartStock
											};
											console.log("data: " + gdsNum+ "cartStock: "+ cartStock);
											$.ajax({
													url : "../addCartAjax",
													type : "post",
													data : data,
													async : false,
													dataType : "json",
													success : function(result) {
														if (result == 1) {
															alert("카트 담기 성공");
															$(".numBox").val("1");
														} else {
															alert("회원만 사용 가능합니다.");
															$(".numBox").val("1");
																location.href = "../view/login.jsp";
															}
														},
														error : function() {
															alert("카트 담기 실패!");
														}
													});
										}
										
										function recommand(){
											var gdsNum = $(".Num").val();
											var data ={
												gdsNum: gdsNum	
											};
											console.log("recommand gdsNum: "+gdsNum);
											$.ajax({
												url:"../RecommandAjax",
												data: data,
												type:"post",
												dataType:"json",
												async:false,
												success: function(result){
													console.log("result: "+result);
													if(result == '-1'){
														alert("로그인 후 추천가능합니다.");
														location.href="../view/login.jsp";
													}else{
														$("#gdsHit").html(result);	
													}
													
												},
												error: function(){
													alert("추천하기 실패!");
												}
											});
										}
									</script>

								</p>

							</c:if>

							<c:if test="${goodsVO.gdsStock == 0}">
								<p>상품 수량이 부족합니다.</p>
							</c:if>
						</div>

						<div class="gdsDes">${goodsVO.gdsDes}</div>
					</div>


					<div id="reply">

						<c:if test="${user == null }">
							<p>
								소감을 남기시려면 <a href="../view/login.jsp">로그인</a>해주세요
							</p>
						</c:if>

						<c:if test="${user != null}">
							<section class="replyForm">
								<input type="hidden" name="gdsNum" id="gdsNum"
									value="${goodsVO.gdsNum}">
								<div class="input_area">
									<textarea name="repContent" id="repCon"></textarea>
								</div>
								<div class="input_area">
									<button type="button" id="reply_btn">소감 남기기</button>
									<script>
										$("#reply_btn")
												.click(
														function() {

															var formObj = $(".replyForm form[role='form']");
															var gdsNum = $("#gdsNum").val();
															var repContent = $("#repCon").val();

															// ReplyVO 형태로 데이터 생성
															var data = {
																gdsNum : gdsNum,
																repContent : repContent
															};
															console.log("data:"+ gdsNum+ "repContent: "+ repContent);
															$.ajax({
																		url : "../RegisterReplyAjax",
																		type : "post",
																		data : data,
																		async : false,
																		dataType : "json",
																		success : function(result) {
																			//alert("댓글 등록 완료!");
																			replyList();  // 리스트 새로고침
																			$("#repCon").val(""); // 텍스트에어리어를 초기화
																		},
																		error : function() {
																			alert("댓글 작성 실패!");
																		}
																	});
														});
									</script>

								</div>

							</section>
						</c:if>

						<section class="replyList">

							<ol>
						
							</ol>
							<script>
								replyList();
							</script>
							
						
						
					
						<script>
							//수정 모달창 띄우고 버튼에 댓글 번호 속성 부여
							$(document).on("click", ".modify", function(){
								$(".replyModal").fadeIn(200);
								
								var repNum = $(this).attr("data-repNum");
								var repCon = $(this).parent().parent().children(".replyContent").text();
								
								$(".modal_repCon").val(repCon);
								$(".modal_modify_btn").attr("data-repNum", repNum);
								
								
							});
							$(document).on("click",".modal_modify_btn",function(){
								//댓글 수정 Ajax
								
									var modifyConfirm = confirm("정말로 수정하시겠습니까?");
									
									if(modifyConfirm) {
										var data = {
													repNum : $(this).attr("data-repNum"),
													repContent : $(".modal_repCon").val()
												};  
										
										$.ajax({
											url : "../ModifyReplyAjax",
											type : "post",
											data : data,
											dataType: "json",
											async: false,
											success : function(result){
												
												if(result == 1) {
													replyList();
													$(".replyModal").fadeOut(200);
												} else {
													alert("작성자 본인만 할 수 있습니다.");							
												}
											},
											error : function(){
												alert("로그인하셔야합니다.")
											}
										});
									}

							
							});
							
							//댓글 삭제 Ajax						
							// 스크립트로 인해 생성된 HTML의 이벤트는 .click() 메서드를 사용할 수 없음
							$(document).on("click", ".delete", function(){
								
								// 사용자에게 삭제 여부를 확인
								var deletConfirm = confirm("정말로 삭제하시겠습니까?"); 
								
								if(deletConfirm) {
								
									var data = {repNum : $(this).attr("data-repNum")};  // ReplyVO 형태로 데이터 생성
									
									$.ajax({
										url : "../DeleteReplyAjax",
										type : "post",
										data : data,
										dataType: "json",
										async:false,
										success : function(result){
											console.log(result);
											// result의 값에 따라 동작
											if(result == 1) {
												replyList();  // 리스트 새로고침
											} else {
												alert("작성자 본인만 할 수 있습니다.")  // 본인이 아닌 경우										
											}
										},
										error : function(){
											// 로그인하지 않아서 에러가 발생한 경우
											alert("로그인하셔야합니다.")
										}
									});
								}
							});
						
						</script> 

						</section>


					</div>
				</section>


			</div>
		</section>

	
	

	</div>
	<%@ include file="../include/footer.jsp"%>
	
<!-- 댓글 수정 모달창 -->
<div class="replyModal">

	 <div class="modalContent">
		  
		  <div>
		   	<textarea class="modal_repCon" name="modal_repCon"></textarea>
		  </div>
		  
		  <div>
		   <button type="button" class="modal_modify_btn">수정</button>
		   <button type="button" class="modal_cancel">취소</button>
		  </div>
		  
	 </div>
	
	 <div class="modalBackground"></div>
 
</div>
<script>
$(".modal_cancel").click(function(){
 	//$(".replyModal").attr("style", "display:none;");
 	$(".replyModal").fadeOut(200);
});
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
</body>
</html>