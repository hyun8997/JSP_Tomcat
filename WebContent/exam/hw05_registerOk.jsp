<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- (��. ���� �ǽ����� ����� �Ƹ��� �������ϰ� �ڹٽ�ũ��Ʈ ��ȿ�� �˻���� ����� �������� �ۼ��Ͻÿ�) -->
	
	
	<% 
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpwd");
	String email = request.getParameter("useremail");
	
	
	out.println(id + " " + pw + " " + email);
	
	%>
</body>
</html>