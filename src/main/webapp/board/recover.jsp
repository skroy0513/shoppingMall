<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	
	// 업무로직 수행
	BoardDao boardDao = new BoardDao();
	Board savedBoard = boardDao.getBoardByNo(no);
	savedBoard.setDeleted("N");
	boardDao.updateBoard(savedBoard);
	
	// 재요청 URL 응답
	response.sendRedirect("list.jsp");
%>