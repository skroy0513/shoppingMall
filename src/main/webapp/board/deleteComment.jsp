<%@page import="dao.CommentDao"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int commentNo = Integer.parseInt(request.getParameter("cno"));
	
	// 업무로직 수행
	BoardDao boardDao = new BoardDao();
	CommentDao commentDao = new CommentDao();
	Board savedBoard = boardDao.getBoardByNo(boardNo);
	commentDao.deleteComment(commentNo);
	savedBoard.setCommentCnt(savedBoard.getCommentCnt() - 1);
	boardDao.updateBoard(savedBoard);
	
	// 재요청 URL
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>