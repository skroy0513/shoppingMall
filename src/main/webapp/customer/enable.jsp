<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	String id = request.getParameter("id");

	// 업무로직 수행
	CustomerDao dao = new CustomerDao();
	dao.enableCustomer(id);
	
	// 재요청 URL
	response.sendRedirect("list.jsp");
	
%>