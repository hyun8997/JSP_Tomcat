<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>scriptletEx02.jsp</title>
</head>
<body>
	<% String str = "������ ȭ����"; %>
	
	<%!
		public String strMethod(){
			return "������ ������";
		}
	%>
	<%!
		String day = "��";
	%>
	
	<% out.println(str); %> <br>
	<%= str %> <br>
	
	<% out.println(strMethod()); %> <br>
	<%= strMethod() %> <br>
	
	<% out.println(day); %> <br>
	<h2>�𷹴� <%= day %>���� �Դϴ�.</h2> <br>
	
	<% 
		// out.println(strMethod());	/* java �ּ� ���� */
	%>
	
	<%-- <% ��ũ��Ʋ�� �ּ� %> --%>
	 
	<!-- HTML �ּ� -->
	
</body>
</html>