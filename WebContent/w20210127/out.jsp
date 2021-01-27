<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>out.jsp</title>
</head>
<body>
	<h2>2021년 1월 마지막주 개봉영화 순위</h2>
	<div style="font-size: 24px">
	<%
		out.print("귀멸의 칼날");
		out.print("소울");
		out.print("명탐정 코난");
		out.print("세자매");
		out.print("캐롤");
	%>
	</div>
	<hr>
	<div style="font-size: 24px">
	<%
		out.println("귀멸의 칼날<br>");		//소스를 개행해서 보내는 것이지 
		out.println("소울<br>");			//웹 브라우저에서 HTML 개행 따로 처리해줘야 함
		out.println("명탐정 코난<br>");
		out.println("세자매<br>");
		out.println("캐롤<br>");
	%>
	</div>
	<div style="font-size: 24px">
	<%
		System.out.println("귀멸의 칼날<br>");		//소스를 개행해서 보내는 것이지 
		System.out.println("소울<br>");			//웹 브라우저에서 HTML 개행 따로 처리해줘야 함
		System.out.println("명탐정 코난<br>");
		System.out.println("세자매<br>");
		System.out.println("캐롤<br>");
	%>
	</div>
</body>
</html>