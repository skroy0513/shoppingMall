<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//
	int no = Integer.parseInt(request.getParameter("no"));

	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(no);
	if ("N".equals(board.getDeleted())) {
		board.setReadCnt(board.getReadCnt() + 1);
		boardDao.updateBoard(board);
	}
	
	response.sendRedirect("detail.jsp?no=" + no);
%>