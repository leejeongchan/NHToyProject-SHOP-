<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.service.LoginServiceImpl" %>
<%@ page import="user.model.UserVO" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>주문 관리</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="../css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="../css/templatemo-style.css">
   	<script src="../js/jquery-3.3.1.min.js"></script>
   	
</head>

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
                        <h2 class="tm-block-title">Order List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    
                                    <th scope="col">주문번호</th>
                                    <th scope="col">주문자</th>
                                    <th scope="col">수령인</th>
                                    <th scope="col">핸드폰번호</th>
                                    <th scope="col">주소</th>
                                    <th scope="col">총계</th>
                                    <th scope="col">상태</th>
                                    <th scope="col">배송 확정</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="listAll" items="${listAll}">
                            	<tr>
                                    <th scope="row"><b>${listAll.orderId }</b></th>
                                    <td><b>
                                    ${listAll.userId }
                                    </b></td>
                                    <td><b>${listAll.orderRec }</b></td>
                                    <td>${listAll.orderPhon }</td>
                                    <td>${listAll.userAddress }</td>
                                    <td>${listAll.amount }원</td>
                                    <td>
                                    <c:if test="${listAll.orderState eq 1 }"><div class="tm-status-circle moving"></div></c:if>
                                    <c:if test="${listAll.orderState eq 0 }"><div class="tm-status-circle cancelled"></div></c:if></td>
                                    <td><button type="button" class="delete_${listAll.orderId}_btn"
											data-orderId="${listAll.orderId}">배송확정</button></td>
                                </tr>
                                <script>
                                $(".delete_${listAll.orderId}_btn").click(function() {
									var confirm_val = confirm("배송을 확정시키겠습니까?");
									if (confirm_val) {
					
										var orderId = $(this).attr("data-orderId");
										console.log(orderId);

										$.ajax({
													url : "../orderConfirmAjax",
													type : "post",
													dataType : "json",
													async : false,
													data : {
														orderId : orderId
													},
													success : function(result) {
														if (result == 1) {
															location.href = "../controller/orderListController.jsp";
														} else {
															alert("확정 실패");
														}
													},
													error : function() {
														alert("확정 할 수 없습니다.");
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