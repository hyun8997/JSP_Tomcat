<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%!
	int one;
	int two = 1;
	
	public int sumMethod(){		//method�� �ֱ� ������ �����̾�� ��
		return one + two;
	}
	
	// �ϳ��� ���𹮿� �������� ������ ���� �� �޼ҵ带 ������ �� ����
	// �޼ҵ尡 �ϳ��� ������ ������ �����̾�� ��!
	String msg;
	int three;
	
	// �ʵ�(�ɹ�����)�� �ʱ�ȭ ���� ������
	// int�� 0, String�� null ���� return
%>

<%-- <% out.println("head"); %> --%> <!-- body���� ��ũ��Ʋ���ϴ°� ���� -->
<meta charset="EUC-KR">
<title>scriptletEx03.jsp</title>
</head>
<body>
	<!-- <h3>body �κ�</h3> -->
	<h2>one�� two �� : <%= sumMethod() %></h2>
	<h2>msg : <%= msg %></h2>
	<h2>three : <%= three %></h2>
	
	<hr>
	
	<%
		String str = f_name + "�浿";
	%>
	
	<%!
		// str ���� f_name �� �� �ʰ� ����Ǿ�����
		// ������ ��ũ��Ʋ�� ���� ���� �ν��ϹǷ�
		// f_name ���� ������ �� �ְ� ��
		
		String f_name = "ȫ";
	%>
	
	<h2>name : <%= str %></h2>
	
</body>
</html>