<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="shop.service.GraphService"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.model.GoodsStockVO" %>
<%@page import="com.softwarefx.chartfx.server.*"%>
<%@ page import ="com.softwarefx.server.data.ObjectProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>상품 등록</title>

<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="../css/fontawesome.min.css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css" />

<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="../css/templatemo-style.css">
<script src="../js/jquery-3.3.1.min.js"></script>
<style>
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }


</style>
</head>
<script type="text/javascript">
$(document).ready(function() {     
     $('#loading').hide();   
    }); 
</script>
<body>
<div id="loading"><img id="loading-image" src="../img/ajax-loader.gif" alt="Loading..." /></div>

	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="../view/admin.jsp">
				<h1 class="tm-site-title mb-0">NHShop ADMIN</h1>
			</a>
			<button class="navbar-toggler ml-auto mr-0" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars tm-nav-icon"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">
					<li class="nav-item"><a class="nav-link"
						href="../view/admin.jsp"> 상품관리 </a></li>


					<li class="nav-item"><a class="nav-link"
						href="../admin/bootgoodsWrite.jsp"> 상품작성 </a></li>

					<li class="nav-item"><a class="nav-link"
						href="../controller/memberListController.jsp"> 사용자 관리 </a></li>

					<li class="nav-item"><a class="nav-link"
						href="../controller/orderListController.jsp"> 주문 관리 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="../admin/bootGraph.jsp"> 그래프 </a></li>

				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="../view/logout.jsp"> 관리자, <b>로그아웃</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">그래프</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
												
						<%
						
							GraphService graphService = GraphService.getInstance();
							
							//1. 파이 그래프(상품별 최초 재고)
							HashMap<Integer, Integer> map = graphService.getFixStock();
							ChartServer chart1 = new ChartServer(pageContext, request, response);
							chart1.getData().setSeries(1);
							chart1.getData().setPoints(map.size());
							chart1.setGallery(Gallery.PIE);

							Iterator<Integer> keys = map.keySet().iterator();
							while (keys.hasNext()) {
								Integer key = keys.next();
								//여기에 키 값 받아와서 그래프 값 설정
								chart1.getData().set(0, key, map.get(key));
								chart1.getData().getLabels().set(key, graphService.getGoodsName(key));
								System.out.println(String.format("키: %d, 값:%d", key, map.get(key)));
							}
							chart1.getLegendBox().setVisible(true);
							chart1.getLegendBox().setFont(new java.awt.Font("휴먼우린체",java.awt.Font.BOLD,7));
							chart1.setWidth(300);
							chart1.setHeight(300);
							chart1.getTitles().add(new TitleDockable("상품별 최초 재고(%)"));
							chart1.getTitles().get(0).setFont(new java.awt.Font("휴먼우린체",java.awt.Font.BOLD,10));

							chart1.getAllSeries().getPointLabels().setVisible(true);
							chart1.getView3D().setEnabled(true);
							chart1.renderControl();
							
							
							//2. 상품별 재고 실시간 현황
							HashMap<Integer, Integer> map2 = graphService.getCurrentStock();
							ChartServer chart2 = new ChartServer(pageContext, request, response);
							chart2.getData().setSeries(1);
							chart2.getData().setPoints(map2.size());
							chart2.setGallery(Gallery.PIE);

							Iterator<Integer> keys2 = map2.keySet().iterator();
							while (keys2.hasNext()) {
								Integer key = keys2.next();
								//여기에 키 값 받아와서 그래프 값 설정
								chart2.getData().set(0, key, map2.get(key));
								chart2.getData().getLabels().set(key, graphService.getGoodsName(key));
								System.out.println(String.format("키: %d, 값:%d", key, map2.get(key)));
							}
							chart2.getLegendBox().setVisible(true);
							chart2.getLegendBox().setFont(new java.awt.Font("휴먼우린체",java.awt.Font.BOLD,7));
							chart2.setWidth(300);
							chart2.setHeight(300);
							chart2.getTitles().add(new TitleDockable("상품별 실시간 재고현황(%)"));
							chart2.getTitles().get(0).setFont(new java.awt.Font("휴먼우린체",java.awt.Font.BOLD,10));

							chart2.getAllSeries().getPointLabels().setVisible(true);
							chart2.getView3D().setEnabled(true);
							chart2.renderControl();
							
							//3.상품 별 판매량 피라미드 그래프
							HashMap<Integer,Integer> map3 = graphService.getSellAmountStock();
							ChartServer chart3 = new ChartServer(pageContext,request,response);
							chart3.getData().setSeries(1);
							chart3.getData().setPoints(map3.size());
							chart3.setGallery(Gallery.PYRAMID);
							Iterator<Integer> keys3 = map3.keySet().iterator();
							while (keys3.hasNext()) {
								Integer key = keys3.next();
								//여기에 키 값 받아와서 그래프 값 설정
								chart3.getData().set(0, key, map3.get(key));
								chart3.getData().getLabels().set(key, graphService.getGoodsName(key));
								System.out.println(String.format("키: %d, 값:%d", key, map3.get(key)));
							}
							chart3.getLegendBox().setVisible(true);
							chart3.getLegendBox().setFont(new java.awt.Font("휴먼우린체",java.awt.Font.BOLD,7));
							chart3.setWidth(600);
							chart3.setHeight(300);
							chart3.getTitles().add(new TitleDockable("상품별 판매량"));
							chart3.getTitles().get(0).setFont(new java.awt.Font("휴먼우린체",java.awt.Font.BOLD,10));

							chart3.getAllSeries().getPointLabels().setVisible(true);
							chart3.getView3D().setEnabled(true);
							chart3.renderControl();
		
						%>

					</div>

				</div>

			</div>

		</div>

	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="../js/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->

</body>

</html>