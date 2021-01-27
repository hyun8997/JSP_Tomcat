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
			alert("아이디가 필요합니다.");
			// 경고창 확인 후 아이디 작성 텍스트 창 생성.
			x.form[0].focus();


			return; // 값을 반환하고 중지해
		}else if(passwd==""){
			alert(" 이 사이트는 자동문이 아닙니다.");
			x.form[1].focus();

			return;
		}else if(passwdck==""){
			alert("성격이 급하시군요?");
			x.form[2].focus();

			return;
			
		}else if(email==""){
			alert("이메일 좀..");
			x.form[3].focus();

			return;
		}else if(passwd!=passwdck){
			alert("같은 패스워드가 아닙니다.");
			x.form[1].value="";
			x.form[2].value="";
			x.form[1].focus();

			return;
		}

			// 데이터를 다른 페이지로 이동
			x.form.action = "hw05_registerOk.jsp"; // 경로설정

			//전달방식도 선택 가능
			x.form.method ="get";

			//전송하기
			x.form.submit();
	}

	</script>
</head>
<body>
	<!-- <form action="hw05_registerOk.jsp" method="get">	 -->	<!-- 웹페이지에서 데이터 전달 -->
	<form action="#">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" id="id" required></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="userpwd" id="pw"></td>
		</tr>
		<tr>
			<th>패스워드 확인</th>
			<td><input type="text" name="userpwdck" id="repw"></td>
		</tr>
		<tr>
			<th>이메일 </th>
			<td><input type="text" name="useremail" id="email"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="전송" onclick="checkForm(this)">
				<!--this: 객체 자신을 가리키는 키워드 -->
			</td>
		</tr>

	</table>
		
		
		
	</form>
</body>
</html>