<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- JSP (Java Server Page)  <===  HTML + �ڹٷ���(����)  ===> ���� ������ ���� ���� -->
	
	<%
		for(int i=1; i<10; i++){
			out.println(
					"3*"+i+"="+(3*i)
					+"<br>");	//�� �������� �����̶�� ����� ���� �־�� �Ѵ�!!!
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
	<h3>1���� 100������ ���� <%=sumInt(100) %>�Դϴ�.</h3>
</body>
</html>