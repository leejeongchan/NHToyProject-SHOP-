<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shop.service.GraphService" %>
<%@ page import="java.util.*" %>
<%@page import="com.softwarefx.chartfx.server.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그래프</title>
</head>
<body>
<%



	GraphService graphService = GraphService.getInstance();
	HashMap<Integer,Integer> map = graphService.getFixStock();
	
	//그래프
	ChartServer chart1 = new ChartServer(pageContext, request, response);
	chart1.getData().setSeries(1);
	chart1.getData().setPoints(map.size());
	chart1.setGallery(Gallery.PIE);
	
	
	Iterator<Integer> keys = map.keySet().iterator();
	while(keys.hasNext()){
		Integer key = keys.next();
		//여기에 키 값 받아와서 그래프 값 설정
		chart1.getData().set(0,key-1,map.get(key));
		System.out.println(String.format("키: %d, 값:%d",key,map.get(key)));
	}
	chart1.getLegendBox().setVisible(false); 
	
	chart1.setWidth(500);
	chart1.setHeight(500);
	chart1.renderControl(); 
/* 	ChartServer chart1 = new ChartServer(pageContext, request, response);
	chart1.getData().setSeries(1);
	chart1.getData().setPoints(2);
	
	chart1.setGallery(Gallery.PIE);
	
	chart1.getData().set(0,0,30);
	chart1.getData().set(0,1,70);
	chart1.getData().set(1,2,40);
	chart1.getLegendBox().setVisible(false);
	
	chart1.setWidth(500);
	chart1.setHeight(500);
	chart1.renderControl(); */
	
%>
</body>
</html>