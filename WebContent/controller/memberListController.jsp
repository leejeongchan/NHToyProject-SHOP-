<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.service.*" %>
<%@ page import = "user.model.*" %>
<%@ page import = "java.util.*" %>
<%
	LoginServiceImpl loginService = LoginServiceImpl.getInstance();
	List<UserVO> list = loginService.userList();
	
	request.setAttribute("memberlist", list);
	pageContext.forward("../admin/bootmemberList.jsp");
%>