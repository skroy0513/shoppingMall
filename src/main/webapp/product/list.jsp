<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.text.*" %>
<%
	DecimalFormat df = new DecimalFormat("###,###");
%>
<%

	// 요청파라미터 조회
	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);	

	// 전체 데이터 개수 조회하기
	ProductDao dao = new ProductDao();
	int totalRows = dao.getTotalRows();

	Pagination pagination = new Pagination(pageNo, totalRows);
	
	// 업무로직 수행 - 전체 상품 목록 조회
	List<Product> productList = dao.getProducts(pagination.getBegin(), pagination.getEnd());
%>				
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp" >
	<jsp:param value="상품" name="menu"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">전체 상품 리스트</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 상품 목록을 확인하세요.</p>
			<table class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>제조사</th>
						<th>가격</th>
						<th>할인가격</th>
					</tr>
				</thead>
				<tbody>
<%
	for (Product product : productList) {
%>
					<tr>
						<td><%=product.getNo() %></td>
						<td><a href="detail.jsp?no=<%=product.getNo() %>" class="text-black text-decoration-none"><%=product.getName() %></a></td>
						<td><%=product.getMaker() %></td>
						<td><%=df.format(product.getPrice()) %> 원</td>
						<td><%=df.format(product.getDiscountPrice()) %> 원</td>
					</tr>
<%
	}
%>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
	  			<ul class="pagination justify-content-center">
				    <li class="page-item <%=pagination.getCurrentBlock() <= 1 ? "disabled" : "" %>">
	     		 		<a class="page-link" href="list.jsp?page=<%=(pagination.getCurrentBlock() - 2)*5 + 1 %>" aria-label="Previous">
	        				<span aria-hidden="true">&laquo;</span>
	      				</a>
	    			</li>
<%
	for (int i = pagination.getBeginPage(); i <= pagination.getEndPage(); i++) {
%>
				    <li class="page-item <%=i == pageNo ? "active" : "" %>"><a class="page-link" href="list.jsp?page=<%=i %>"><%=i %></a></li>
<%
	}
%>
				    <li class="page-item <%=pagination.getCurrentBlock() >= pagination.getTotalBlocks() ? "disabled" : "" %>">
				    	<a class="page-link" href="list.jsp?page=<%=(pagination.getCurrentBlock()*5) + 1 %>" aria-label="Next">
				        	<span aria-hidden="true">&raquo;</span>
				      	</a>
				    </li>
			  	</ul>
			</nav>
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 상품 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>