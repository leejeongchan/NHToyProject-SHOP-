<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="shop.service.GoodsService"%>
<%@ page import="shop.model.GoodsVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NH쇼핑몰</title>
<link rel="stylesheet" href="../css/main.css?ver=1">
<!-- 상품 목록 전체를 위한 스타일 -->
<style>
section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.goodsThumb img {
	width: 200px;
	height: 200px;
}

section#content div.goodsName {
	padding: 10px 0;
	text-align: center;
}

section#content div.goodsName a {
	color: #000;
}

</style>
</head>
<body>
	
	<!-- 상품 전체 목록 , Top5 가져오기 -->
	<%
		GoodsService goodsService = GoodsService.getInstance();
		//만약 카테고리 별 목록이 아닐 때 !! ==> 즉 첫 main에서 전체를 볼 때
		if(request.getAttribute("listAll")==null){
			List<GoodsVO> listAll = goodsService.listAll();
			pageContext.setAttribute("listAll", listAll);
			List<GoodsVO> listTop = goodsService.listTop();
			pageContext.setAttribute("listTop", listTop);
			
			pageContext.setAttribute("flag",1);
		}
		
	%>
	<div id="root">
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
		<aside id="aside">
			<%@ include file="../include/aside.jsp"%>
		</aside>
		<c:if test="${flag eq 1}">
		<h3>top5</h3>
		<section id="container">
			<div id="container_box">

				<section id="content">
					<c:forEach var="listTop" items="${listTop}">
						<c:url var="url" value="../controller/goodsViewController.jsp">
							<c:param name="gdsNum" value="${listTop.gdsNum}" />

						</c:url>
						<ul style="display: inline-block;">

							<li style="border: 3px solid red;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listTop.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listTop.gdsName }</a>
								</div>
								<div class="gdsHit">
									<h3>추천수: ${listTop.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listTop.gdsReplyCnt }</h3>
								</div>
							</li>
						</ul>

					</c:forEach>




				</section>



			</div>
		</section>
		
		</c:if>
		
		<br>
		<h3 style="margin-left: 180px;">
		상품목록
		</h3>
		<section id="container">
			<div id="container_box">

				<section id="content">
					<c:forEach var="listAll" items="${listAll}">
						<c:url var="url" value="../controller/goodsViewController.jsp">
							<c:param name="gdsNum" value="${listAll.gdsNum}" />

						</c:url>
						<ul style="display: inline-block;">

							<li style="border: 1px solid black;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listAll.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listAll.gdsName }</a>
								</div>
								<div class="gdsHit">
									<h3>추천수: ${listAll.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listAll.gdsReplyCnt }</h3>
								</div>
							</li>
						</ul>
					</c:forEach>





				</section>



			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>

	</div>
</body>
<!-- Ajax로 카테고리별 바꿔보기..??? -->

</html>