<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%!
	int one;
	int two = 1;
	
	public int sumMethod(){		//method가 있기 때문에 선언문이어야 함
		return one + two;
	}
	
	// 하나의 선언문에 여러개의 변수와 여러 개 메소드를 선언할 수 있음
	// 메소드가 하나라도 있으면 무조건 선언문이어야 함!
	String msg;
	int three;
	
	// 필드(맴버변수)는 초기화 하지 않으면
	// int는 0, String은 null 값을 return
%>

<%-- <% out.println("head"); %> --%> <!-- body에서 스크립틀릿하는게 권장 -->
<meta charset="EUC-KR">
<title>scriptletEx03.jsp</title>
</head>
<body>
	<!-- <h3>body 부분</h3> -->
	<h2>one과 two 합 : <%= sumMethod() %></h2>
	<h2>msg : <%= msg %></h2>
	<h2>three : <%= three %></h2>
	
	<hr>
	
	<%
		String str = f_name + "길동";
	%>
	
	<%!
		// str 보다 f_name 이 더 늦게 선언되었지만
		// 선언문을 스크립틀릿 보다 먼저 인식하므로
		// f_name 값을 참조할 수 있게 됨
		
		String f_name = "홍";
	%>
	
	<h2>name : <%= str %></h2>
	
</body>
</html>