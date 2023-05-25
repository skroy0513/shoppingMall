<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String err = request.getParameter("err");
	String job = request.getParameter("job");
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("게시글수정", "utf-8"));
		return;
	}

	// 업무 로직 수행
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(no);
	if (!board.getCustomer().getId().equals(loginId)){
		response.sendRedirect("detail.jsp?no="+ no +"&err=id&job=" + URLEncoder.encode("게시글수정", "utf-8"));
		return;
	}
%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>

<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
         	<h1 class="border bg-light fs-4 p-2">게시글 등록폼</h1>
      	</div>
	</div>
	<div class="col-6">
<%
	if ("title".equals(err)) {
%>
			<div class="alert alert-danger">
				<strong>게시글 수정 실패</strong> [<%=job %>]을 입력하세요.
			</div>
<%
	} else if ("content".equals(err)) {
%>
			<div class="alert alert-danger">
				<strong>게시글 수정 실패</strong> [<%=job %>]을 입력하세요.
			</div>
<%
	}
%>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>제목과 내용을 입력하세요</p>		
			<form class="border bg-light p-3" method="post" action="modify.jsp">
				<input type="hidden" name="no" value="<%=no %>"/>
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title" value="<%=board.getTitle() %>" required/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="5" class="form-control" name="content" required><%=board.getContent() %></textarea>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>