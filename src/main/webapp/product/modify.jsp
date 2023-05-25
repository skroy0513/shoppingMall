<%@page import="vo.Category"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String maker = request.getParameter("maker");
	int price = Integer.parseInt(request.getParameter("price"));
	int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
	String description = request.getParameter("description");
	int catNo = Integer.parseInt(request.getParameter("catNo"));
	
	// 업무로직 수행
	ProductDao dao = new ProductDao();
	Product product = dao.getProductByNo(no);
	
	product.setName(name);
	product.setMaker(maker);
	product.setPrice(price);
	product.setDiscountPrice(discountPrice);
	product.setDescription(description);
	product.setCategory(new Category(catNo));
	
	dao.updateProduct(product);
	
	// 재요청 URL 응답
	response.sendRedirect("detail.jsp?no=" + no);
%>