<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// 요청 URL - localhost/app3/product/delete.jsp?no=xxx
	// 요청 파라미터값 조회
	int no = Integer.parseInt(request.getParameter("no"));
	
	// 업무로직 수행
	ProductDao dao = new ProductDao();
	dao.deleteProductByNo(no);
	
	// 재요청 URL 응답
	response.sendRedirect("list.jsp");
%>