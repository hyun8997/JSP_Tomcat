<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%! 
		public int total(int x, int y, int z){
			return x+y+z;
		}
	
		public double avg(int x){
			return x/3.0;
		}
	%>

	<%
		String name = "������";
		Random rnd1 = new Random();
		Random rnd2 = new Random();
		Random rnd3 = new Random();
		int kor = rnd1.nextInt(100);
		int eng = rnd2.nextInt(100);
		int math = rnd3.nextInt(100);
		
		int total =  total(kor, eng, math);
		double avg = avg(total);
	%>
	
	<h1>����ǥ</h1>
	<div style="font-size: 24px">
		���� : <%=name %><br>
		�������� : <%=kor %><br>
		�������� : <%=eng %><br>
		�������� : <%=math %><br>
		���� : <%=total %><br>
		��� : <%=avg %><br>
	</div>
	
</body>
</html>