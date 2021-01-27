<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request.jsp</title>
</head>
<body>
	<div style="font-size: 24px">
	<p>
		현재 서버에 들어있는 request.jsp 
	</p>
	<%
		out.println("1. " + request.getRequestURL() + "<br>");
		// URL : 웹 상에서 서비스를 제공하는 각 서버 안에 있는 파일들의 위치	
	
		out.println("2. " + request.getRequestURI() + "<br>");
		// URI : URL에서 HTTP 프로토콜, 호스트명, 포트번호를 제외한 나머지 정보
		
		out.println("3. 사용자로부터 입력을 받을 경우 <br>");
		// 급여 : 5000000
		out.println("급여 : " + request.getParameter("pay") + "<br>");
		
		out.println("4. 사용자로부터 입력된 값이 여러 개일 경우 <br>");
		
		/*
			급여 : 5000000
			성명 : 홍길동
			java : 90
			jsp  : 85
			spring : 80
			
			총계 : 
			평균 : 
		*/
		out.println("급여 : " + request.getParameter("pay") + "<br>");
		out.println("성명 : " + request.getParameter("name") + "<br>");
		out.println("java : " + request.getParameter("java") + "<br>");
		out.println("jsp : " + request.getParameter("jsp") + "<br>");
		out.println("spring : " + request.getParameter("spring") + "<br>");
		//url뒤에 ?pay=500&name=홍길동&java=... 처럼 다 채워놓으면 채워짐(실제로는 받아서 쓴다는 뜻)
		
		int java = Integer.parseInt(request.getParameter("java"));
   		int jsp = Integer.parseInt(request.getParameter("jsp"));
   		int spring = Integer.parseInt(request.getParameter("spring"));
   
   
   		out.println("총계:" + (java+jsp+spring)+ "<br/>");
   		out.println("평균:" + ((java+jsp+spring)/3.0)+ "<br/>");

		
	%>
	</div>
<!-- 	
	<form action="request.jsp">
		<input type="text" name="pay" id="">		이거로 pay 값을 넣을 수 있음, 다른 곳에서 받아오는 것을 전제로 헀기 때문
		<input type="submit" value="전송">
	</form> -->
</body>
</html>