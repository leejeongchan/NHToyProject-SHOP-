<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="shop.service.GoodsService"%>
<%@ page import="shop.model.GoodsVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="shop.model.PageList"%>
<%@ include file="bbsInclude.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="user.model.UserVO" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>NHSHOP</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../css/newMain.css">

</head>
<body>
	

	<!-- 상품 전체 목록 , Top5 가져오기 -->
	<%
		GoodsService goodsService = GoodsService.getInstance();
		//만약 카테고리 별 목록이 아닐 때 !! ==> 즉 첫 main에서 전체를 볼 때
		if (request.getAttribute("page") == null) {
			PageList listAll = goodsService.listAll(currentPage, pageSize, blockSize);
			System.out.println("currentPage: " + currentPage + " pageSize: " + pageSize + " blockSize: " + blockSize
					+ "listAll.startPage: " + listAll.getStartPage());

			pageContext.setAttribute("page", listAll);
			List<GoodsVO> listTop = goodsService.listTop();
			pageContext.setAttribute("listTop", listTop);

			pageContext.setAttribute("flag", 1);
		}
	%>
	<!-- 헤더네비 -->
	<%@ include file="../include/nav.jsp"%>
	<!-- 현재 날짜 구하기 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="MM/dd/yyyy" var="nowDate" />
	
	
	
	<!-- Top3 -->
	<c:if test="${flag eq 1 }">

	<section class="section-tours">
		<h3 >Top3 </h3>
		<div class="row">
		
		<c:forEach var="listTop" items="${listTop}">
			<fmt:parseDate value='${listTop.gdsStartDate}' var='startDate' pattern='MM/dd/yyyy'/>
			<fmt:parseDate value='${listTop.gdsEndDate}' var='endDate' pattern='MM/dd/yyyy'/>
			<fmt:formatDate value="${startDate}" pattern="MM/dd/yyyy" var="startDate"/>
			<fmt:formatDate value="${endDate}" pattern="MM/dd/yyyy" var="endDate"/>
			
			<!-- 출시 전! -->
			<c:if test="${nowDate < startDate }">
			<c:url var="url" value="../controller/goodsViewController.jsp">
				<c:param name="gdsNum" value="${listTop.gdsNum}" />
				<c:param name="gdsEndFlag" value="2"/>
			</c:url>
			<div class="col-lg-4 mb-4">
				<div class="my-flip-container">
					<div class="my-flip-inner my-flip-right">
						<div class="my-flip-inner-wrapper">
						
							<div class="my-flip-side my-flip-front">
								<div class="my-flip-image my-flip-image--1">
									<img src="${pageContext.request.contextPath }/images/${listTop.gdsImg }">
								</div>
								<div class="my-flip-details">
									<h4 class="my-flip-heading">${listTop.gdsName }[출시전 상품]</h4>
									<div class="my-flip-text">
										<p>${listTop.gdsDes}</p>
									</div>
								</div>
							</div>
							<div class="my-flip-side my-flip-back my-flip-back-1">
								<div class="my-flip-back-inner">
									<div class="my-flip-price">
										<h3>${listTop.gdsPrice }</h3>
									</div>
									<div class="my-flip-back-text">
										<ul>
											<li>출시전</li>
											<li>출시일:${listTop.gdsStartDate}</li>
											<li>종료일:${listTop.gdsEndDate}</li>
											<li>추천수:${listTop.gdsHit }</li>
											<li>댓글수:${listTop.gdsReplyCnt }</li>
										</ul>
									</div>
									<div class="my-flip-btn-box">
										<a href="${url }" class="my-flip-btn">View</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			
			<!-- 출시일 보다 현재일이 크거나같고 마감일보다 작으면 출시진행중!! -->
			<c:if test="${startDate <= nowDate && endDate >nowDate }">
			<c:url var="url" value="../controller/goodsViewController.jsp">
				<c:param name="gdsNum" value="${listTop.gdsNum}" />
				<c:param name="gdsEndFlag" value="0"/>
			</c:url>
			<div class="col-lg-4 mb-4">
				<div class="my-flip-container">
					<div class="my-flip-inner my-flip-right">
						<div class="my-flip-inner-wrapper">
						
							<div class="my-flip-side my-flip-front">
								<div class="my-flip-image my-flip-image--1">
									<img src="${pageContext.request.contextPath }/images/${listTop.gdsImg }">
								</div>
								<div class="my-flip-details">
									<h4 class="my-flip-heading">${listTop.gdsName }[출시 중]</h4>
									<div class="my-flip-text">
										<p>${listTop.gdsDes}</p>
									</div>
								</div>
							</div>
							<div class="my-flip-side my-flip-back my-flip-back-1">
								<div class="my-flip-back-inner">
									<div class="my-flip-price">
										<h3>${listTop.gdsPrice }</h3>
									</div>
									<div class="my-flip-back-text">
										<ul>
											<li>출시중</li>
											<li>출시일:${listTop.gdsStartDate}</li>
											<li>종료일:${listTop.gdsEndDate}</li>
											<li>추천수:${listTop.gdsHit }</li>
											<li>댓글수:${listTop.gdsReplyCnt }</li>
										</ul>
									</div>
									<div class="my-flip-btn-box">
										<a href="${url }" class="my-flip-btn">View</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			
			<!-- 마감일 보다 현재일이 크거나 같으면 마감종료!! -->
			<c:if test="${endDate <= nowDate }">
			<!-- 여기서 서비스를 호출해서 종료플래그 1로 업데이트 -->
			<c:url var="url" value="../controller/goodsViewController.jsp">
				<c:param name="gdsNum" value="${listTop.gdsNum}" />
				<c:param name="gdsEndFlag" value="1"/>
			</c:url>
			<div class="col-lg-4 mb-4">
				<div class="my-flip-container">
					<div class="my-flip-inner my-flip-right">
						<div class="my-flip-inner-wrapper">
						
							<div class="my-flip-side my-flip-front">
								<div class="my-flip-image my-flip-image--1">
									<img src="${pageContext.request.contextPath }/images/${listTop.gdsImg }">
								</div>
								<div class="my-flip-details">
									<h4 class="my-flip-heading">${listTop.gdsName }[출시 종료]</h4>
									<div class="my-flip-text">
										<p>${listTop.gdsDes}</p>
									</div>
								</div>
							</div>
							<div class="my-flip-side my-flip-back my-flip-back-1">
								<div class="my-flip-back-inner">
									<div class="my-flip-price">
										<h3>${listTop.gdsPrice }</h3>
									</div>
									<div class="my-flip-back-text">
										<ul>
											<li>출시 종료</li>
											<li>출시일:${listTop.gdsStartDate}</li>
											<li>종료일:${listTop.gdsEndDate}</li>
											<li>추천수:${listTop.gdsHit }</li>
											<li>댓글수:${listTop.gdsReplyCnt }</li>
										</ul>
									</div>
									<div class="my-flip-btn-box">
										<a href="${url }" class="my-flip-btn">View</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			</c:forEach>
		</div>
			
	</section>
	</c:if>
	
	<!-- 상품 목록 -->
	<div class="container">
		<div class="row tours">
		<c:forEach var="listAll" items="${page.list}">
			<c:set var="gdsNum" value="${listAll.gdsNum }"/>
						
			<fmt:parseDate value='${listAll.gdsStartDate}' var='startDate' pattern='MM/dd/yyyy'/>
			<fmt:parseDate value='${listAll.gdsEndDate}' var='endDate' pattern='MM/dd/yyyy'/>
			<fmt:formatDate value="${startDate}" pattern="MM/dd/yyyy" var="startDate"/>
			<fmt:formatDate value="${endDate}" pattern="MM/dd/yyyy" var="endDate"/>
			
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
			<div class="col-lg-4 mb-4">
				<div class="my-flip-container">
					<div class="my-flip-inner my-flip-right">
						<div class="my-flip-inner-wrapper">
						
							<div class="my-flip-side my-flip-front">
								<div class="my-flip-image my-flip-image--1">
									<img src="${pageContext.request.contextPath }/images/${listAll.gdsImg }">
								</div>
								<div class="my-flip-details">
									<h4 class="my-flip-heading">${listAll.gdsName }[출시전 상품]</h4>
									<div class="my-flip-text">
										<p>${listAll.gdsDes}</p>
									</div>
								</div>
							</div>
							<div class="my-flip-side my-flip-back my-flip-back-1">
								<div class="my-flip-back-inner">
									<div class="my-flip-price">
										<h3>${listAll.gdsPrice }</h3>
									</div>
									<div class="my-flip-back-text">
										<ul>
											<li>출시전</li>
											<li>출시일:${listAll.gdsStartDate}</li>
											<li>종료일:${listAll.gdsEndDate}</li>
											<li>추천수:${listAll.gdsHit }</li>
											<li>댓글수:${listAll.gdsReplyCnt }</li>
										</ul>
									</div>
									<div class="my-flip-btn-box">
										<a href="${url }" class="my-flip-btn">View</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- <div class="tourcard">
				<figure>
					<div class="tourpic">
						<img width="320" height="180"
							src="${pageContext.request.contextPath }/images/${listAll.gdsImg }">

					</div>
					<figcaption>
						<h3 class="entry-title">
							<a href="${url}">${listAll.gdsName }[출시 전]</a>
						</h3>
						<span class="description">${listAll.gdsDes }</span>
						<span class="tourprice"> 
							<span class="currency">Won</span>
							<span class="price">${listAll.gdsPrice }</span> 
						</span>
						<span>추천수:${listAll.gdsHit }</span>
						<span>댓글수:${listAll.gdsReplyCnt }</span>
					</figcaption>
					<div class="tourbtn">
						<a href="${url }" class="btn btn-sm" target="_blank"
							rel="noreferrer"> <i class="fa fa-whatsapp fa-fw"></i><span>View</span>
						</a>

					</div>
				</figure>
			</div> --%>
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
				
			<div class="col-lg-4 mb-4">
				<div class="my-flip-container">
					<div class="my-flip-inner my-flip-right">
						<div class="my-flip-inner-wrapper">
						
							<div class="my-flip-side my-flip-front">
								<div class="my-flip-image my-flip-image--1">
									<img src="${pageContext.request.contextPath }/images/${listAll.gdsImg }">
								</div>
								<div class="my-flip-details">
									<h4 class="my-flip-heading">${listAll.gdsName }[출시중 상품]</h4>
									<div class="my-flip-text">
										<p>${listAll.gdsDes}</p>
									</div>
								</div>
							</div>
							<div class="my-flip-side my-flip-back my-flip-back-1">
								<div class="my-flip-back-inner">
									<div class="my-flip-price">
										<h3>${listAll.gdsPrice }</h3>
									</div>
									<div class="my-flip-back-text">
										<ul>
											<li>출시중</li>
											<li>출시일:${listAll.gdsStartDate}</li>
											<li>종료일:${listAll.gdsEndDate}</li>
											<li>추천수:${listAll.gdsHit }</li>
											<li>댓글수:${listAll.gdsReplyCnt }</li>
										</ul>
									</div>
									<div class="my-flip-btn-box">
										<a href="${url }" class="my-flip-btn">View</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
				<%-- <div class="tourcard">
				<figure>
					<div class="tourpic">
						<img width="320" height="180"
							src="${pageContext.request.contextPath }/images/${listAll.gdsImg }">

					</div>
					<figcaption>
						<h3 class="entry-title">
							<a href="${url}">${listAll.gdsName }[출시 중]</a>
						</h3>
						<span class="description">${listAll.gdsDes }</span>
						<span class="tourprice"> 
							<span class="currency">Won</span>
							<span class="price">${listAll.gdsPrice }</span> 
						</span>
						<span>추천수:${listAll.gdsHit }</span>
						<span>댓글수:${listAll.gdsReplyCnt }</span>
					</figcaption>
					<div class="tourbtn">
						<a href="${url }" class="btn btn-sm" target="_blank"
							rel="noreferrer"> <i class="fa fa-whatsapp fa-fw"></i><span>View</span>
						</a>

					</div>
				</figure>
			</div> --%>
				
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
						<div class="col-lg-4 mb-4">
				<div class="my-flip-container">
					<div class="my-flip-inner my-flip-right">
						<div class="my-flip-inner-wrapper">
						
							<div class="my-flip-side my-flip-front">
								<div class="my-flip-image my-flip-image--1">
									<img src="${pageContext.request.contextPath }/images/${listAll.gdsImg }">
								</div>
								<div class="my-flip-details">
									<h4 class="my-flip-heading">${listAll.gdsName }[출시종료 상품]</h4>
									<div class="my-flip-text">
										<p>${listAll.gdsDes}</p>
									</div>
								</div>
							</div>
							<div class="my-flip-side my-flip-back my-flip-back-1">
								<div class="my-flip-back-inner">
									<div class="my-flip-price">
										<h3>${listAll.gdsPrice }</h3>
									</div>
									<div class="my-flip-back-text">
										<ul>
											<li>출시종료</li>
											<li>출시일:${listAll.gdsStartDate}</li>
											<li>종료일:${listAll.gdsEndDate}</li>
											<li>추천수:${listAll.gdsHit }</li>
											<li>댓글수:${listAll.gdsReplyCnt }</li>
										</ul>
									</div>
									<div class="my-flip-btn-box">
										<a href="${url }" class="my-flip-btn">View</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			
		</c:forEach>
		
		
		
		</div>
			<c:if test="${flag eq 1 }">
				<div id="paginationBox" class="mb-3" style="margin-left:50%;">
				<ul class="pagination">
					<c:if test="${! page.isEmpty() }">
						<!-- 게시판개수가 0이 아니라면 -->



						<c:if test="${page.startPage > 1}">
							<!-- 시작페이지가 1이상 즉 11 21 31 .... -->
							<c:url var="url" value="../view/main.jsp">
								<c:param name="currentPage" value="${page.startPage-1}" />
								<c:param name="pageSize" value="${page.pageSize }" />
								<c:param name="blockSize" value="${page.blockSize }" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${url }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }"
							end="${page.endPage }">
							
							<%-- 현재 페이지는 링크가 생기지 않게 한다. --%>
							<li class="page-item active"><c:if
									test="${i eq page.currentPage }">
									<a class="page-link" href="#">${i}</a>
								</c:if></li>

							<%-- 그 외 페이지는 다시 리턴 하면서 호출 --%>
							<li class="page-item"><c:if test="${i ne page.currentPage }">

									<c:url var="url" value="../view/main.jsp">
										<c:param name="currentPage" value="${i}" />
										<c:param name="pageSize" value="${page.pageSize }" />
										<c:param name="blockSize" value="${page.blockSize }" />
									</c:url>
									<a class="page-link" href="${url }">${i }</a>

								</c:if></li>
						</c:forEach>
						<%-- 마지막 페이지 번호가 전체페이지 수보다 적다면 다음 페이지가 존재한다. --%>

						<c:if test="${page.endPage < page.totalPage }">
							<li class="page-item"><c:url var="url" value="../view/main.jsp">
									<c:param name="currentPage" value="${page.endPage+1}" />
									<c:param name="pageSize" value="${page.pageSize }" />
									<c:param name="blockSize" value="${page.blockSize }" />
								</c:url> <a class="page-link" href="${url }">다음</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
				
				</c:if>
				<c:if test="${flag ne 1 }">
					<div id="paginationBox" class="mb-3" style="margin-left:50%;">
				<ul class="pagination">
					<c:if test="${! page.isEmpty() }">
						<!-- 게시판개수가 0이 아니라면 -->



						<c:if test="${page.startPage > 1}">
							<!-- 시작페이지가 1이상 즉 11 21 31 .... -->
							<c:url var="url" value="../controller/goodsCategoryController.jsp">
								<c:param name="currentPage" value="${page.startPage-1}" />
								<c:param name="pageSize" value="${page.pageSize }" />
								<c:param name="blockSize" value="${page.blockSize }" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${url }">이전</a>
						</c:if>
						<c:forEach var="i" begin="${page.startPage }"
							end="${page.endPage }">
							
							<%-- 현재 페이지는 링크가 생기지 않게 한다. --%>
							<li class="page-item active"><c:if
									test="${i eq page.currentPage }">
									<a class="page-link" href="#">${i}</a>
								</c:if></li>

							<%-- 그 외 페이지는 다시 리턴 하면서 호출 --%>
							<li class="page-item"><c:if test="${i ne page.currentPage }">

									<c:url var="url" value="../controller/goodsCategoryController.jsp">
										<c:param name="currentPage" value="${i}" />
										<c:param name="pageSize" value="${page.pageSize }" />
										<c:param name="blockSize" value="${page.blockSize }" />
									</c:url>
									<a class="page-link" href="${url }">${i }</a>

								</c:if></li>
						</c:forEach>
						<%-- 마지막 페이지 번호가 전체페이지 수보다 적다면 다음 페이지가 존재한다. --%>

						<c:if test="${page.endPage < page.totalPage }">
							<li class="page-item"><c:url var="url" value="../controller/goodsCategoryController.jsp">
									<c:param name="currentPage" value="${page.endPage+1}" />
									<c:param name="pageSize" value="${page.pageSize }" />
									<c:param name="blockSize" value="${page.blockSize }" />
								</c:url> <a class="page-link" href="${url }">다음</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
				</c:if>
	</div>
	
	
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery-3.3.1.min.js"></script>

	<script src="../js/bootstrap.min.js"></script>
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
</body>
</html>