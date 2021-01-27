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
		String name = "유관순";
		Random rnd1 = new Random();
		Random rnd2 = new Random();
		Random rnd3 = new Random();
		int kor = rnd1.nextInt(100);
		int eng = rnd2.nextInt(100);
		int math = rnd3.nextInt(100);
		
		int total =  total(kor, eng, math);
		double avg = avg(total);
	%>
	
	<h1>성적표</h1>
	<div style="font-size: 24px">
		성명 : <%=name %><br>
		국어점수 : <%=kor %><br>
		영어점수 : <%=eng %><br>
		수학점수 : <%=math %><br>
		총점 : <%=total %><br>
		평균 : <%=avg %><br>
	</div>
	
</body>
</html>