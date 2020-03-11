<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>상품 재판매</title>
  
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="../css/fontawesome.min.css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css" />
    
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="../css/templatemo-style.css">
  	<script src="../js/jquery-3.3.1.min.js"></script>

  </head>

  <body>
  <%
  	int gdsNum = Integer.parseInt(request.getParameter("gdsNum"));
  	int gdsStock = Integer.parseInt(request.getParameter("gdsStock"));
  	String gdsEndDate = (String)request.getParameter("gdsEndDate");
  	pageContext.setAttribute("gdsNum", gdsNum);
  	pageContext.setAttribute("gdsStock", gdsStock);
  	pageContext.setAttribute("gdsEndDate", gdsEndDate);
  %>
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="../view/admin.jsp">
          <h1 class="tm-site-title mb-0">NHShop ADMIN</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
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
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">상품 등록</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
           <form action="../controller/goodsReSellController.jsp" class="tm-edit-product-form" method="post" autocomplete="off">
              <input type="hidden" name="gdsNum" value="${gdsNum }"/>
              <div class=" col-md-12">
                  <div class="row">
                      
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="stock">상품수량 갱신</label>
                          <input id="stock" name="gdsStock" type="text" class="form-control validate" value="${gdsStock}" required />
                        </div>
                       
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label  for="expire_date">만료일 갱신</label>
                          <input id="expire_date" name="gdsEndDate" type="text" class="form-control validate" value="${gdsEndDate}" data-large-mode="true" />
                        </div>
                  </div>
                  
              </div>
              
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">재판매</button>
              </div>
            </form>
            
            </div>
            
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

    <script src="../js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="../js/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    
  </body>

<script>

    
    $(function() {
        $("#expire_date").datepicker();
     });
  
</script>
</html>
