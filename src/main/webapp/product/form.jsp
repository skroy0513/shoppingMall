<%@page import="vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	CategoryDao catDao = new CategoryDao();
	List<Category> categoryList = catDao.getCategories();
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
			<h1 class="border bg-light fs-4 p-2">신규 상품 등록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>신규 상품 정보를 입력하세요.</p>
			<form class="border bg-light p-3" method="post" action="insert.jsp">
				<div class="form-group mb-2">
					<label class="form-label">카테고리</label>
					<select name="catNo" class="form-select">
						<option selected disabled>카테고리를 선택하세요</option>
<%
	for (Category category : categoryList) {
%>
						<option value="<%=category.getNo() %>"><%=category.getName() %></option>
<%
	}
%>
					</select>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품이름</label>
					<input type="text" class="form-control" name="name" />
				</div>
				<div class="form-group mb-2">
					<label class="form-label">제조회사</label>
					<input type="text" class="form-control" name="maker"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">입고수량</label>
					<input type="number" min="0" class="form-control" name="amount"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품가격</label>
					<input type="number" min="0" class="form-control" name="price"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">상품 설명</label>
					<textarea id="myTextarea" class="form-control" rows="5" name="description"></textarea>
				</div>
				<div class="text-end">
					<button type="reset" class="btn btn-secondary btn-sm">취소</button>
					<button type="submit" class="btn btn-primary btn-sm">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>