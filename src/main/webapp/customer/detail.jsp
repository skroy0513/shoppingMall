<%@page import="dao.CustomerDao"%>
<%@page import="vo.Customer"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	String id = request.getParameter("id");

	// 업무 로직 조회
	CustomerDao dao = new CustomerDao();
	Customer customer = dao.getCustomerById(id);
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
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
   <div class="container">
      <ul class="navbar-nav me-auto">
         <li class="nav-item"><a class="nav-link" href="/app3/home.jsp">홈</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/product/list.jsp">상품관리</a></li>
         <li class="nav-item"><a class="nav-link active" href="/app3/customer/list.jsp">고객 관리</a></li>
         <li class="nav-item"><a class="nav-link disabled" href="">게시판 관리</a></li>
      </ul>
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link disabled" href="">로그인</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/form.jsp">회원가입</a></li>
      </ul>
   </div>
</nav>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">고객 상세 정보</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>고객의 상세정보를 확인하세요.</p>
			
			<table class="table table-bordered">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th class="table-dark">아이디</th>
						<td><%=customer.getId() %></td>
						<th class="table-dark">이름</th>
						<td><%=customer.getName() %></td>
					</tr>
					<tr>
						<th class="table-dark">전화번호</th>
						<td><%=customer.getTel() %></td>
						<th class="table-dark">이메일</th>
						<td><%=customer.getEmail() %></td>
					</tr>
					<tr>
						<th class="table-dark">적립포인트</th>
						<td><%=customer.getPoint() %></td>
						<th class="table-dark">탈퇴여부</th>
						<td><%=customer.getDisabled() %></td>
					</tr>
					<tr>
						<th class="table-dark">가입일자</th>
						<td><%=customer.getCreateDate() %></td>
						<th class="table-dark">수정일자</th>
						<td><%=customer.getUpdateDate() %></td>
					</tr>
				</tbody>
			</table>
			<div class="text-end">
				<a href="delete.jsp?id=hong" class="btn btn-danger btn-sm">삭제</a>
				<a href="modifyform.jsp?id=hong" class="btn btn-warning btn-sm">수정</a>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>