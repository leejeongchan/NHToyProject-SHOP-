<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	이 곳에서 초기값 등을 세팅해줍니다.
	세팅 페이지!
	현재페이지 
	한페이장 게시판 개수
	보여줄 페이지 명단의 크기 
	글번호
	조회수 증가하나요? 수정시 증가 하면 안됨
	
	조회수 추천수 최신순 
 -->

<%
	request.setCharacterEncoding("UTF-8");
	// 현재페이지 번호
	int currentPage = 1; // 초기값 
	try{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}catch(Exception e){ 
		;
	}
	// 목록개수
	int pageSize = 3;
	try{
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}catch(Exception e){ 
		;
	}
	// 블록크기
	int blockSize = 10;
	try{
		blockSize = Integer.parseInt(request.getParameter("blockSize"));
	}catch(Exception e){ 
		;
	}
	

	
	
	
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("pageSize", pageSize);
	request.setAttribute("blockSize", blockSize);
	
	
	
	
%>