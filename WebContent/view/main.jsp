<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="shop.service.GoodsService"%>
<%@ page import="shop.model.GoodsVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<!-- 현재 날짜 구하기 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="MM/dd/yyyy" var="nowDate" />

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
						
						<fmt:parseDate value='${listTop.gdsStartDate}' var='startDate' pattern='MM/dd/yyyy'/>
						<fmt:parseDate value='${listTop.gdsEndDate}' var='endDate' pattern='MM/dd/yyyy'/>
						<fmt:formatDate value="${startDate}" pattern="MM/dd/yyyy" var="startDate"/>
						<fmt:formatDate value="${endDate}" pattern="MM/dd/yyyy" var="endDate"/>
						
						<ul style="display: inline-block;">
						<!-- 출시 전! -->
							<c:if test="${nowDate < startDate }">
							<c:url var="url" value="../controller/goodsViewController.jsp">
								<c:param name="gdsNum" value="${listTop.gdsNum}" />
								<c:param name="gdsEndFlag" value="2"/>
							</c:url>
							<li style="border: 3px solid red;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listTop.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listTop.gdsName }<p style="color:red;">[출시전 상품!]</p></a>
								</div> 
								<div class="gdsHit">
									<h3>추천수: ${listTop.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listTop.gdsReplyCnt }</h3>
								</div>
							</li>	
							</c:if>
						<!-- 출시일 보다 현재일이 크거나같고 마감일보다 작으면 출시진행중!! -->
							<c:if test="${startDate <= nowDate && endDate >nowDate }">
							<c:url var="url" value="../controller/goodsViewController.jsp">
								<c:param name="gdsNum" value="${listTop.gdsNum}" />
								<c:param name="gdsEndFlag" value="0"/>
							</c:url>
							<li style="border: 3px solid red;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listTop.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listTop.gdsName }<p style="color:red;">[출시중!]</p></a>
								</div> 
								<div class="gdsHit">
									<h3>추천수: ${listTop.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listTop.gdsReplyCnt }</h3>
								</div>
							</li>	
							
							</c:if>
							<!-- 마감일 보다 현재일이 크거나 같으면 마감종료!! -->
							<c:if test="${endDate <= nowDate }">
							<!-- 여기서 서비스를 호출해서 종료플래그 1로 업데이트 -->
							<c:url var="url" value="../controller/goodsViewController.jsp">
								<c:param name="gdsNum" value="${listTop.gdsNum}" />
								<c:param name="gdsEndFlag" value="1"/>
							</c:url>
							<li style="border: 3px solid red;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listTop.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listTop.gdsName }<p style="color:red;">[마감]</p></a>
								</div>
								<div class="gdsHit">
									<h3>추천수: ${listTop.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listTop.gdsReplyCnt }</h3>
								</div>
							</li>	
							</c:if>
							
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
						<c:set var="gdsNum" value="${listAll.gdsNum }"/>
						
						<fmt:parseDate value='${listAll.gdsStartDate}' var='startDate' pattern='MM/dd/yyyy'/>
						<fmt:parseDate value='${listAll.gdsEndDate}' var='endDate' pattern='MM/dd/yyyy'/>
						<fmt:formatDate value="${startDate}" pattern="MM/dd/yyyy" var="startDate"/>
						<fmt:formatDate value="${endDate}" pattern="MM/dd/yyyy" var="endDate"/>
						
						
						<ul style="display: inline-block;">
						
							<!-- 출시 전! -->
							<c:if test="${nowDate <startDate }">
							<c:url var="url" value="../controller/goodsViewController.jsp">
								<c:param name="gdsNum" value="${listAll.gdsNum}" />
								<c:param name="gdsEndFlag" value="2"/>
	
							</c:url>
							<%
								//출시 전 종료 플래그 2로 설정
								GoodsService gdsServ = GoodsService.getInstance();
								int gdsNum2 = (int)pageContext.getAttribute("gdsNum");
								gdsServ.endFlag(gdsNum2,2);
							%>
							<li style="border: 1px solid black;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listAll.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listAll.gdsName }<p style="color:red;">[출시전 상품!]</p></a>
								</div>
								<div class="gdsHit">
									<h3>추천수: ${listAll.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listAll.gdsReplyCnt }</h3>
								</div>
							</li>
							
							</c:if>
							
							<!-- 출시 중! -->
							<c:if test="${startDate <= nowDate && endDate >nowDate }">
							<c:url var="url" value="../controller/goodsViewController.jsp">
								<c:param name="gdsNum" value="${listAll.gdsNum}" />
								<c:param name="gdsEndFlag" value="0"/>
	
							</c:url>
							<%
								//출시 중 종료 플래그 0으로 설정
								GoodsService gdsServ = GoodsService.getInstance();
								int gdsNum0 =  (int)pageContext.getAttribute("gdsNum");
								gdsServ.endFlag(gdsNum0,0);
							%>
	
							<li style="border: 1px solid black;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listAll.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listAll.gdsName }<p style="color:red;">[출시중!]</p></a>
								</div>
								<div class="gdsHit">
									<h3>추천수: ${listAll.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listAll.gdsReplyCnt }</h3>
								</div>
							</li>
							</c:if>
							
							<!-- 마감! -->
							<c:if test="${endDate <= nowDate }">
							<c:url var="url" value="../controller/goodsViewController.jsp">
								<c:param name="gdsNum" value="${listAll.gdsNum}" />
								<c:param name="gdsEndFlag" value="1"/>
	
							</c:url>
							<%
								//마감 시 종료 플래그 1로 설정
								GoodsService gdsServ = GoodsService.getInstance();
								int gdsNum1 =(int)pageContext.getAttribute("gdsNum");
								gdsServ.endFlag(gdsNum1,1);
							%>
							<li style="border: 1px solid black;">
								<div class="goodsThumb">
									<img
										src='${pageContext.request.contextPath }/images/${listAll.gdsImg }'>
								</div>
								<div class="goodsName">
									<a href="${url }">${listAll.gdsName }<p style="color:red;">[마감]</p></a>
								</div>
								<div class="gdsHit">
									<h3>추천수: ${listAll.gdsHit }</h3>
								</div>
								<div class="gdsReplyCnt">
									<h3>댓글수: ${listAll.gdsReplyCnt }</h3>
								</div>
							</li>
							</c:if>
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