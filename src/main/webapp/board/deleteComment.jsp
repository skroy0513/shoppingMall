<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("no"));
	int commentNo = Integer.parseInt(request.getParameter("cno"));
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
		return;
	}
	
	// 업무로직 수행
	BoardDao boardDao = new BoardDao();
	CommentDao commentDao = new CommentDao();
	Board savedBoard = boardDao.getBoardByNo(boardNo);
	Comment comment = commentDao.getCommentByNo(commentNo);
	
	if (!comment.getCustomer().getId().equals(loginId)) {
		response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
		return;
	}
	commentDao.deleteComment(commentNo);
	
	savedBoard.setCommentCnt(savedBoard.getCommentCnt() - 1);
	
	boardDao.updateBoard(savedBoard);
	
	// 재요청 URL
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>