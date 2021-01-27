<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- JSP (Java Server Page)  <===  HTML + 자바로직(연산)  ===> 동적 페이지 구성 가능 -->
	
	<%
		for(int i=1; i<10; i++){
			out.println(
					"3*"+i+"="+(3*i)
					+"<br>");	//웹 브라우저는 개행이라는 명령을 따로 주어야 한다!!!
		}
		
	%>
	
	<%!
		public int sumInt(int x){
			int sum = 0;
			for(int i=1; i<=x; i++){
				sum+=i;
			}
			return sum;
		}
	%>
	<h3>1부터 100까지의 합은 <%=sumInt(100) %>입니다.</h3>
</body>
</html>