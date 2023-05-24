<%@page import="vo.Review"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="dao.ReviewDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// 요청 파라미터 조회
	int productNo = Integer.parseInt(request.getParameter("no"));
	int reviewNo = Integer.parseInt(request.getParameter("rno"));
	
	// 업무로직 수행
	// 세션에서 로그인한 사용자 정보 조회
	String loginId = (String) session.getAttribute("loginId");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("리뷰삭제", "utf-8"));
		return;
	}
	
	// 리뷰의 작성아이디와 로그인아이디가 일치하는지 체크
	ReviewDao reviewDao = new ReviewDao();
	Review review = reviewDao.getReviewByNo(reviewNo);
	if (!loginId.equals(review.getCustomer().getId())) {
		response.sendRedirect("detail.jsp?no=" + productNo + "&err=id");
		return;
	}
	
	//리뷰정보 삭제
	reviewDao.deleteReviewByNo(reviewNo);
	
	// 재요청 URL 응답
	response.sendRedirect("detail.jsp?no=" + productNo);
%>
