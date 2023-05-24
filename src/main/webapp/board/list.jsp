<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	
	// 업무로직 수행
	BoardDao boardDao = new BoardDao();
	List<Board> boardList = boardDao.getBoards();
	
	// 재요청 URL
	
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
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">게시글 목록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 목록을 확인하세요.</p>
			
			<table class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="45%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>댓글갯수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
<%
	for (Board board : boardList) {
%>
					<tr>
						<td><%=board.getNo() %></td>
						<td><a href="detail.jsp?no=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
						<td><%=board.getCustomer().getName() %></td>
						<td><%=board.getCommentCnt() %></td>
						<td><%=board.getCreateDate() %></td>
					</tr>
<%
	}
%>					
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item disabled">
						<a href="list.jsp?page=1" class="page-link">이전</a>
					</li>
					<li class="page-item active">
						<a href="list.jsp?page=1" class="page-link">1</a>
					</li>
					<li class="page-item">
						<a href="list.jsp?page=2" class="page-link">2</a>
					</li>
					<li class="page-item">
						<a href="list.jsp?page=3" class="page-link">3</a>
					</li>
					<li class="page-item ">
						<a href="list.jsp?page=2" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 게시글 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>