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
		String name = "ȫ�浿";
		int kor = 90;
		int eng = 80;
		int total = kor+eng;
		double avg = total/2;
	%>
	
	<h1>����ǥ</h1>
	<div style="font-size: 24px">
		���� : <%=name %><br>
		�������� : <%=kor %><br>
		�������� : <%=eng %><br>
		���� : <%=total %><br>
		��� : <%=avg %><br>
	</div>
	
</body>
</html>