<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<!-- multipart를 위한 import -->
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="shop.service.GoodsService"%>
<%@ page import="shop.model.GoodsVO"%>

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
		
		GoodsService goodsService = GoodsService.getInstance();
		goodsService.write(goods);
		
	%>
<script type="text/javascript" lang="javascript">
	alert("상품이 등록되었습니다.")
	location.href ="../view/admin.jsp";
</script>