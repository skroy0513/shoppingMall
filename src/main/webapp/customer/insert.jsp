<%@page import="dao.CustomerDao"%>
<%@page import="vo.Customer"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	
	// 업무로직 수행
	Customer customer = new Customer();
	customer.setId(id);
	customer.setPassword(password);
	customer.setName(name);
	customer.setTel(tel);
	customer.setEmail(email);
	
	CustomerDao dao = new CustomerDao();
	dao.insertCustomer(customer);
	
	// 재요청 URL불러오기
	response.sendRedirect("list.jsp");
%>