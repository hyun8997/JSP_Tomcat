<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(x){

		// var id = document.getElementById("id");

		// console.log(x);
		// console.dir(x);

		// console.dir(x.form[0]);
		
		var id = x.form[0].value;
		var passwd = x.form[1].value;
		var passwdck = x.form[2].value;
		var email = x.form[3].value;

		// console.log("id : "+ id);
		// console.log("pw : "+ passwd);
		// console.log("pwck :" + passwdck);
		// console.log("email : " + email);

		if(id==""){
			alert("���̵� �ʿ��մϴ�.");
			// ���â Ȯ�� �� ���̵� �ۼ� �ؽ�Ʈ â ����.
			x.form[0].focus();


			return; // ���� ��ȯ�ϰ� ������
		}else if(passwd==""){
			alert(" �� ����Ʈ�� �ڵ����� �ƴմϴ�.");
			x.form[1].focus();

			return;
		}else if(passwdck==""){
			alert("������ ���Ͻñ���?");
			x.form[2].focus();

			return;
			
		}else if(email==""){
			alert("�̸��� ��..");
			x.form[3].focus();

			return;
		}else if(passwd!=passwdck){
			alert("���� �н����尡 �ƴմϴ�.");
			x.form[1].value="";
			x.form[2].value="";
			x.form[1].focus();

			return;
		}

			// �����͸� �ٸ� �������� �̵�
			x.form.action = "hw05_registerOk.jsp"; // ��μ���

			//���޹�ĵ� ���� ����
			x.form.method ="get";

			//�����ϱ�
			x.form.submit();
	}

	</script>
</head>
<body>
	<!-- <form action="hw05_registerOk.jsp" method="get">	 -->	<!-- ������������ ������ ���� -->
	<form action="#">
	<table>
		<tr>
			<th>���̵�</th>
			<td><input type="text" name="userid" id="id" required></td>
		</tr>
		<tr>
			<th>�н�����</th>
			<td><input type="text" name="userpwd" id="pw"></td>
		</tr>
		<tr>
			<th>�н����� Ȯ��</th>
			<td><input type="text" name="userpwdck" id="repw"></td>
		</tr>
		<tr>
			<th>�̸��� </th>
			<td><input type="text" name="useremail" id="email"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="����" onclick="checkForm(this)">
				<!--this: ��ü �ڽ��� ����Ű�� Ű���� -->
			</td>
		</tr>

	</table>
		
		
		
	</form>
</body>
</html>