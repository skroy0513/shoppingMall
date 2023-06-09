<%@page import="vo.Customer"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 업무로직 수행
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("게시글작성", "utf-8"));
		return;
	}
	
	if (title.equals("")) {
		response.sendRedirect("form.jsp?err=title&job=" + URLEncoder.encode("제목", "utf-8"));
		return;
	}
	if (content.equals("")) {
		response.sendRedirect("form.jsp?err=content&job=" + URLEncoder.encode("내용", "utf-8"));
		return;
	}
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setCustomer(new Customer(loginId));
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	// 재요청 URL 응답
	response.sendRedirect("list.jsp");

%>