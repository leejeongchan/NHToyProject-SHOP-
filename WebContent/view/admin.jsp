<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.service.GoodsService" %>
<%@ page import="shop.model.GoodsVO" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="shop.model.PageList" %>
<%@ include file="bbsInclude.jspf" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>관리자페이지</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="../css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="../css/templatemo-style.css">
   	<script src="../js/jquery-3.3.1.min.js"></script>
   	
</head>
<%
	GoodsService goodsService = GoodsService.getInstance();
	PageList listAll = goodsService.listAll(currentPage,pageSize,blockSize);
	pageContext.setAttribute("page", listAll);
	
%>
<body id="reportsPage">
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="../view/admin.jsp">
                    <h1 class="tm-site-title mb-0">NHShop Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="../view/admin.jsp">
                               	상품관리
                            </a>
                        </li>
                       
                        
                        <li class="nav-item">
                            <a class="nav-link" href="../admin/bootgoodsWrite.jsp">
                              	 상품작성
                                
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="../controller/memberListController.jsp">
                              	  사용자 관리
                            </a>
                        </li>
                        
                         <li class="nav-item">
                            <a class="nav-link" href="../controller/orderListController.jsp">
                              	  주문 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../admin/bootGraph.jsp">
                              	  그래프
                            </a>
                        </li>
                      
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="../view/logout.jsp">
                               	 관리자, <b>로그아웃</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">환영합니다. <b>관리자님</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                
                
                <%
                	
                %>
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Shop List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    
                                    <th scope="col">상품명</th>
                                    <th scope="col">카테고리</th>
                                    <th scope="col">상품가격</th>
                                    <th scope="col">상품설명</th>
                                    
                                    <th scope="col">출시일</th>
                                    <th scope="col">마감일</th>
                                    <th scope="col">출시상태</th>
                                    <th scope="col">삭제</th>
                                    <th scope="col">재판매</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="listAll" items="${page.list}">
                            	<tr>
                                    <th scope="row"><b>${listAll.gdsName }</b></th>
                                    <td><b>
                                    <c:if test="${listAll.cateCode eq 1 }">상의</c:if>
                                    <c:if test="${listAll.cateCode eq 2 }">하의</c:if>
                                    <c:if test="${listAll.cateCode eq 3 }">자켓</c:if>
                                    <c:if test="${listAll.cateCode eq 4 }">악세서리</c:if>
                                    <c:if test="${listAll.cateCode eq 5 }">신발</c:if>
                                    </b></td>
                                    <td><b>${listAll.gdsPrice }</b></td>
                                    <td>${listAll.gdsDes }</td>
                                    <td>${listAll.gdsStartDate }</td>
                                    <td>${listAll.gdsEndDate }</td>
                                    <td>
                                    	<c:if test="${listAll.gdsEndFlag eq 0 }"><p style="color:blue;">출시중</p></c:if>
                                    	<c:if test="${listAll.gdsEndFlag eq 1 }"><p style="color:red;">출시종료</p></c:if>
                                    	<c:if test="${listAll.gdsEndFlag eq 2 }"><p style="color:#000000;">출시전</p></c:if>
                                    </td>
                                    <td><button type="button" class="delete_${listAll.gdsNum}_btn"
											data-gdsNum="${listAll.gdsNum}">삭제</button></td>
									<c:url var="url" value="../admin/bootReSell.jsp">
										<c:param name="gdsNum" value="${listAll.gdsNum}" />
										<c:param name="gdsEndDate" value="${listAll.gdsEndDate }"/>
										<c:param name="gdsStock" value="${listAll.gdsStock }"/>
		
									</c:url>
									<c:if test="${listAll.gdsEndFlag eq 1 }">
										<td><a href="${url }" class="btn btn-info btn-sm">재판매</a></td>
									
									</c:if>
                                </tr>
                                <script>
											$(".delete_${listAll.gdsNum}_btn").click(function() {
																var confirm_val = confirm("정말 삭제하시겠습니까?");
																if (confirm_val) {
												
																	var gdsNum = $(this).attr("data-gdsNum");
																	console.log(gdsNum);

																	$.ajax({
																				url : "../DeleteGoodsAjax",
																				type : "post",
																				dataType : "json",
																				async : false,
																				data : {
																					gdsNum : gdsNum
																				},
																				success : function(result) {
																					if (result == 1) {
																						location.href = "../view/admin.jsp";
																					} else {
																						alert("삭제 실패");
																					}
																				},
																				error : function() {
																					alert("삭제를 할 수 없습니다.");
																				}
																			});
																}
															});
										</script>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div id="paginationBox" class="mb-3">
				<ul class="pagination">
					<c:if test="${! page.isEmpty() }">
						<!-- 게시판개수가 0이 아니라면 -->



						<c:if test="${page.startPage > 1}">
							<!-- 시작페이지가 1이상 즉 11 21 31 .... -->
							<c:url var="url" value="../view/admin.jsp">
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

									<c:url var="url" value="../view/admin.jsp">
										<c:param name="currentPage" value="${i}" />
										<c:param name="pageSize" value="${page.pageSize }" />
										<c:param name="blockSize" value="${page.blockSize }" />
									</c:url>
									<a class="page-link" href="${url }">${i }</a>

								</c:if></li>
						</c:forEach>
						<%-- 마지막 페이지 번호가 전체페이지 수보다 적다면 다음 페이지가 존재한다. --%>

						<c:if test="${page.endPage < page.totalPage }">
							<li class="page-item"><c:url var="url" value="../view/admin.jsp">
									<c:param name="currentPage" value="${page.endPage+1}" />
									<c:param name="pageSize" value="${page.pageSize }" />
									<c:param name="blockSize" value="${page.blockSize }" />
								</c:url> <a class="page-link" href="${url }">다음</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 
                    
                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                </p>
            </div>
        </footer>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    
</body>

</html>