<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sendMsg.jsp</title>
</head>
<body>
	<form action="receiveMsg.jsp" method="get">		<!-- 웹페이지에서 데이터 전달 -->
		<input type="text" name="msg" id="">
		<input type="submit" value="전송">
	</form>
	
</body>
</html>