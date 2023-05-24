<%@page import="dao.BoardDao"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Board"%>
<%@page import="vo.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// 요청 파라미터 조회
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String content = request.getParameter("content");
	
	// 업무로직 수행
	String loginId = (String) session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("댓글작성", "utf-8"));
		return;
	}
	Comment comment = new Comment();
	comment.setBoard(new Board(boardNo));
	comment.setContent(content);
	comment.setCustomer(new Customer(loginId));
	// Comment객체에 저장된 댓글정보를 테이블에 저장
	CommentDao commentDao = new CommentDao();
	commentDao.insertComment(comment);
	// Board 객체에 댓글 수 업데이트
	BoardDao boardDao = new BoardDao();
	Board savedBoard = boardDao.getBoardByNo(boardNo);
	System.out.println(savedBoard.getCommentCnt());
	savedBoard.setCommentCnt(savedBoard.getCommentCnt() + 1);
	System.out.println(savedBoard.getCommentCnt());
	boardDao.updateBoard(savedBoard);
	
	// 재요청 URL
	response.sendRedirect("detail.jsp?no=" + boardNo);
	
%>