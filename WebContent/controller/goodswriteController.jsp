<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<!-- multipart를 위한 import -->
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="shop.service.GoodsService"%>
<%@ page import="shop.model.GoodsVO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String realPath = request.getRealPath("images");
		System.out.println("realPath: " + realPath); //C:\Users\dlwjd\WebWS\BBSPro\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ShoppingMall\images
		String realForder = "C:\\upload";
		String enctype = "UTF-8";
		int maxSize = 5 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, enctype,
				new DefaultFileRenamePolicy());
		
		String gdsName = multi.getParameter("gdsName");
		int cateCode = Integer.parseInt(multi.getParameter("cateCode"));
		int gdsPrice =Integer.parseInt(multi.getParameter("gdsPrice"));
		int gdsStock = Integer.parseInt(multi.getParameter("gdsStock"));
		String gdsDes = multi.getParameter("gdsDes");
		//추가
		String gdsStartDate = multi.getParameter("gdsStartDate");
		String gdsEndDate = multi.getParameter("gdsEndDate");
		
		//현재 날짜 가져오기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("MM/dd/yyyy");
		String nowDate = date.format(today);
		
		
		
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		GoodsVO goods = new GoodsVO();
		goods.setGdsName(gdsName);
		goods.setCateCode(cateCode);
		goods.setGdsPrice(gdsPrice);
		goods.setGdsStock(gdsStock);
		goods.setGdsDes(gdsDes);
		goods.setGdsImg(fileName);
		goods.setGdsStartDate(gdsStartDate);
		goods.setGdsEndDate(gdsEndDate);
		int compareNowToStart = nowDate.compareTo(gdsStartDate);
		int compareNowToEnd = nowDate.compareTo(gdsEndDate);

		if(compareNowToStart < 0){ // 출시 전
			goods.setGdsEndFlag(2);
		}
		if(compareNowToStart>=0 && compareNowToEnd < 0) { //출시 중
			goods.setGdsEndFlag(0);

		}
		if(compareNowToEnd >=0) { //마감
			goods.setGdsEndFlag(1);

		}
		
		GoodsService goodsService = GoodsService.getInstance();
		goodsService.write(goods);
		
	%>
<script type="text/javascript" lang="javascript">
	alert("상품이 등록되었습니다.")
	location.href ="../view/admin.jsp";
</script>