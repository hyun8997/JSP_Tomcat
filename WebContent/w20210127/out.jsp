<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>out.jsp</title>
</head>
<body>
	<h2>2021�� 1�� �������� ������ȭ ����</h2>
	<div style="font-size: 24px">
	<%
		out.print("�͸��� Į��");
		out.print("�ҿ�");
		out.print("��Ž�� �ڳ�");
		out.print("���ڸ�");
		out.print("ĳ��");
	%>
	</div>
	<hr>
	<div style="font-size: 24px">
	<%
		out.println("�͸��� Į��<br>");		//�ҽ��� �����ؼ� ������ ������ 
		out.println("�ҿ�<br>");			//�� ���������� HTML ���� ���� ó������� ��
		out.println("��Ž�� �ڳ�<br>");
		out.println("���ڸ�<br>");
		out.println("ĳ��<br>");
	%>
	</div>
	<div style="font-size: 24px">
	<%
		System.out.println("�͸��� Į��<br>");		//�ҽ��� �����ؼ� ������ ������ 
		System.out.println("�ҿ�<br>");			//�� ���������� HTML ���� ���� ó������� ��
		System.out.println("��Ž�� �ڳ�<br>");
		System.out.println("���ڸ�<br>");
		System.out.println("ĳ��<br>");
	%>
	</div>
</body>
</html>