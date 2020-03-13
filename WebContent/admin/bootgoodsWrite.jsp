<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  </head>

  <body>
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
           <form action="../controller/goodswriteController.jsp" class="tm-edit-product-form" method="post" autocomplete="off" enctype="multipart/form-data">
            
              <div class=" col-md-12">
                 
                  <div class="form-group mb-3">
                    <label for="name">상품명</label>
                    <input id="name" name="gdsName" type="text" class="form-control validate"  required/>
                  </div>
                  <div class="form-group mb-3">
                    <label for="description">상품설명</label>
                    <textarea class="form-control validate" rows="3" required name="gdsDes"></textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label for="category">카테고리</label >
                    <select class="custom-select tm-select-accounts" id="category"  name="cateCode">
							<option value="1">상의</option>
							<option value="2">하의</option>
							<option value="3">자켓</option>
							<option value="4">악세서리</option>
							<option value="5">신발</option>
					</select>
                  </div>
                  <div class="row">
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="expire_date">상품가격</label>
                          <input id="gdsPrice" name="gdsPrice" type="text" class="form-control validate" data-large-mode="true"/>
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="stock">상품수량</label>
                          <input id="stock"  name="gdsStock" type="text" class="form-control validate" required />
                        </div>
                         <div class="form-group mb-3 col-xs-12 col-sm-6">
                           <label  for="expire_date">출시일</label>
                          <input id="expire_date" name="gdsStartDate" type="text" class="form-control validate" data-large-mode="true" />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label  for="expire_date">만료일</label>
                          <input id="expire_date2" name="gdsEndDate" type="text" class="form-control validate" data-large-mode="true" />
                        </div>
                  </div>
                  
              </div>
              <div class=" col-md-12 mb-4">
                <div class="tm-product-img-dummy" id="preview" style="width:200px; height:100px;" >
                  
                </div> 
                <div class="custom-file mt-3 mb-3">
					<input type="file" name="gdsImg" id="upload">  
					
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">상품등록</button>
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
 <!-- 미리보기 -->
<script>
    var upload = document.querySelector('#upload');
    var preview = document.querySelector('#preview');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
        image.setAttribute("width","200");
        image.setAttribute("height","100");
 
        /* FileReader 객체 생성 */
        var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                /* base64 인코딩 된 스트링 데이터 */
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            /* 
                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                onload 에 설정했던 return 으로 넘어간다.
                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
            */
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }
 
        preview.appendChild(image);
    })
    
    $(function() {
        $("#expire_date").datepicker();
        $("#expire_date2").datepicker();

     });
  
</script>
</html>
