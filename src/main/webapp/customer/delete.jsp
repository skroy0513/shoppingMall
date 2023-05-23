<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	String id = request.getParameter("id");
	
	// 업무로직 수행
	CustomerDao dao = new CustomerDao();
	
	Customer customer = dao.getCustomerById(id);
	if ("No".equals(customer.getDisabled())) {
		response.sendRedirect("detail.jsp?id=" + id + "&err=fail");
		return;
	}
	
	dao.deleteCustomerById(id);
	
	// 재요청 URL
	response.sendRedirect("list.jsp");
	
%>