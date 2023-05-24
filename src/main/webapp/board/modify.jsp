<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String loginId = (String) session.getAttribute("loginId");
	
	// 업무로직 수행
	if (title.equals("")) {
		response.sendRedirect("form.jsp?err=title&job=" + URLEncoder.encode("제목", "utf-8"));
		return;
	}
	if (content.equals("")) {
		response.sendRedirect("form.jsp?err=content&job=" + URLEncoder.encode("내용", "utf-8"));
		return;
	}
	BoardDao boardDao = new BoardDao();
	Board savedBoard = boardDao.getBoardByNo(no);
	savedBoard.setTitle(title);
	savedBoard.setContent(content);
	boardDao.updateBoard(savedBoard);
	
	// 재요청 URL
	response.sendRedirect("list.jsp");
%>