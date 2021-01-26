<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>scriptletEx02.jsp</title>
</head>
<body>
	<% String str = "오늘은 화요일"; %>
	
	<%!
		public String strMethod(){
			return "내일은 수요일";
		}
	%>
	<%!
		String day = "목";
	%>
	
	<% out.println(str); %> <br>
	<%= str %> <br>
	
	<% out.println(strMethod()); %> <br>
	<%= strMethod() %> <br>
	
	<% out.println(day); %> <br>
	<h2>모레는 <%= day %>요일 입니다.</h2> <br>
	
	<% 
		// out.println(strMethod());	/* java 주석 가능 */
	%>
	
	<%-- <% 스크립틀릿 주석 %> --%>
	 
	<!-- HTML 주석 -->
	
</body>
</html>