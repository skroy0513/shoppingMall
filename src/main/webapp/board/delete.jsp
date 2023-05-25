<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청 파라미터 조회
	int no = Integer.parseInt(request.getParameter("no"));
	String loginId = (String) session.getAttribute("loginId");
	
	// 업무로직 수행
	BoardDao boardDao = new BoardDao();
	Board savedBoard = boardDao.getBoardByNo(no);
	if (!savedBoard.getCustomer().getId().equals(loginId)) {
		response.sendRedirect("detail.jsp?no=" + no + "&err=id&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
		return;
	}
	savedBoard.setDeleted("Y");
	boardDao.updateBoard(savedBoard);
	
	// 재요청 URL 응답
	response.sendRedirect("list.jsp");
%>