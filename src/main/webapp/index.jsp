<%--
디렉티브
	페이지 지시어
	<%@ page 속성="" %>
	페이지 지시어는 jsp페이지에 대한 설정정보를 정의한다.
		
--------------------------------------------------------------------------------------------------------------------------------------------------------------|
속성						속성값							설명															기본값							  |
--------------------------------------------------------------------------------------------------------------------------------------------------------------|
language					"java"							스크립틀릿에서 사용할 프로그램언어를 정의						"java"							  |
contentType					"text/html; charset=UTF-8"		이 jsp의 응답컨텐츠 타입과 문자인코딩 방식을 정의				"text/html; charset=ISO-8859-1"	  |
pageEncoding				"UTF-8"							이 jsp를 파일로 저장할 때 문자인코딩 방식을 정의				"ISO-8859-1"					  |
trimDirectiveWhitespaces	"true"							지시어 등으로 추가된 불필요한 공백의 제거여부를 지정			"false"							  |
isErrorPage					"false"							이 jsp페이지가 에러페이지로 사용될지 여부를 지정				"false"							  |
															에러를 표시하는 에러페이지가 아닌 경우 기본값을 그대로 사용										  |
errorPage					"에러페이지경로"				이 jsp페이지에서 예외가 발생했을 때 이동할 에러페이지를 지정	""								  |
--------------------------------------------------------------------------------------------------------------------------------------------------------------|

스크립틀릿
	이 jsp에서 자바코딩 영역을 설정한다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jsp</title>
</head>
<body>
<%
	String[] depts = {"영업부", "기술부", "관리부", "총무부"};
%>
  <h1>홈</h1>
  <ul>
<%
	for (String name : depts) {
%> 
	<li><%=name %></li>
<%		
	}
%>
  
  </ul>
</body>
</html>