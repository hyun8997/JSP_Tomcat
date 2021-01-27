<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- (단. 이전 실습에서 사용한 아마존 가입파일과 자바스크립트 유효성 검사까지 적용된 페이지로 작성하시오) -->
	
	
	<% 
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpwd");
	String email = request.getParameter("useremail");
	
	
	out.println(id + " " + pw + " " + email);
	
	%>
</body>
</html>