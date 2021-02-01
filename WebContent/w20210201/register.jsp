<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reg").on('click', function(){
			//console.log('click');
			
			// 사용자가 입력한 내용을 읽어서 브라우저 콘솔에 출력해보세요
			/* var id = document.getElementById("id");
			console.log(id); */
			
			/* var id = document.frm.id.value;
			//console.log(id);
			var pw = document.frm.pw.value;
			var recheck = document.frm.recheck.value;
			var name = document.frm.name.value;
			var birth = document.frm.birth.value;
			var mp1 = document.frm.mp1.value;
			var mp2 = document.frm.mp2.value;
			var email = document.frm.email.value;
			
			console.log(id + "," + pw + "," + recheck + ", " + name + "," + birth + ", " +
					mp1 + ", " + mp2 + ", " + email); */
			
			/* var id = $("#id");
					
			console.log(id.val()); */
			
			// 데이터 입력 여부 & pw 일치 여부
			if($("#id").val()==""){
				alert("아이디를 입력하세요");
				//document.frm.id.focus();
				$("#id").focus();
				return;				
			}else if($("#pw").val()==""){
				alert("패스워드 입력하세요");
				$("#pw").focus();
				return;				
			}else if($("#recheck").val()==""){
				alert("다시 한 번 입력하세요")	;
				$("#recheck").focus();
				return;				
			}else if($("#name").val()==""){
				alert("이름을 입력하세요");
				$("#name").focus();
				return;
			}else if($("#birth").val()==""){
				alert("생년월일 입력하세요");
				$("#birth").focus();
				return;
			}else if($("#mp1").val()==""){
				alert("중간 번호 입력하세요");
				$("#mp1").focus();
				return;
			}else if($("#mp2").val()==""){
				alert("마지막 번호 입력하세요");
				$("#mp2").focus();
				return;
			}else if($("#email").val()==""){
				alert("이메일 입력하세요");
				$("#email").focus();
				return;
			}else if($("#pw").val() != $("#recheck").val()){
				alert("같은 비밀번호가 아닙니다");				
				$("#recheck").focus();
				return;
			}
				
			document.frm.action = "registerOk.jsp";
			document.frm.method = "get";
			document.frm.submit();
			
			
		});
		
	});

</script>
<style type="text/css">
	#regDiv{
		width: 500px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#botTr{
		background-color : yellow;
	}
	
	#mp0 {
		background-color: white;
		text-align: center;
	}

</style>
</head>
<body>
	<div id="regDiv">
		<form action="#" name="frm">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" id="id" /></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="text" name="pw" id="pw" /></td>
				</tr>
				<tr>
					<th>PwCheck</th>
					<td><input type="text" name="recheck" id="recheck" /></td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type="text" name="name" id="name" /></td>
				</tr>
				<tr>
					<th>BIRTH</th>
					<td><input type="text" name="birth" id="birth" placeholder="생년월일 6자리 입력" /></td>
				</tr>
				<tr>
					<th>MP</th>
					<td>
						<input type="text" name="mp0" id="mp0" value="010" size="2" disabled="disabled" />
						<input type="text" name="mp1" id="mp1" size="3" />-
						<input type="text" name="mp2" id="mp2" size="3" />
					</td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td><input type="text" name="email" id="email" /></td>
				</tr>
				<tr id="botTr">
					<td colspan="2">
						<input type="button" value="가입" id="reg" />
						<input type="reset" value="reset" id="reset" />
					</td>
				</tr>				
			</table>		
		</form>
	</div>

</body>
</html>











