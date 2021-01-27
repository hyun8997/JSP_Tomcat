<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String name = "홍길동";
		int kor = 90;
		int eng = 80;
		int total = kor+eng;
		double avg = total/2;
	%>
	
	<h1>성적표</h1>
	<div style="font-size: 24px">
		성명 : <%=name %><br>
		국어점수 : <%=kor %><br>
		영어점수 : <%=eng %><br>
		총점 : <%=total %><br>
		평균 : <%=avg %><br>
	</div>
	
</body>
</html>