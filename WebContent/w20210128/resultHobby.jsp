<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>resultHobby.jsp</title>
</head>
<body>
	<%
		String[] str = request.getParameterValues("box");	//�Ķ�޼� �ϳ��� ���� ������ ���� �� ����
		
		for(String hobby : str){
			out.println("����� ��̴� " + hobby + "�Դϴ�.");
		}
	%>
	
</body>
</html>