<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style type="text/css">
	#loginDiv{
		margin: 0 auto;
		width: 120px;
	}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 요소를 지정할 CSS 선택자가 없으면 속성값으로 불러올 수 있음
	/* 	$("input:button[value='로그인']").on('click', function(){
				console.log('로그인 버튼 클릭');
		}); */
		
		$(".login").on('click', function(){
			/* loginOk.jsp에 당신의 id는 ~~~ 입니다. - h2 출력 해보세요 */
			document.frm.action = "loginOk.jsp";
			document.frm.method = "get";            // 수업이므로 get방식, 실제 프로젝트에서는 post 방식으로 보내세요
			document.frm.submit();
		});
		
		$("#reg").on('click', function(){
			location.href = "register.jsp";
		});
		
	});
</script>



</head>
<body>
	<!-- div#loginDiv>form[action='#'][name='frm']>table>(tr>th+td>input:text)*2 -->
	<div id="loginDiv">
		<form action="#" name="frm">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" id="" /></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="text" name="pw" id="" /></td>
				</tr>
				<tr id="bottomTr">
					<td colspan="2">
						<input type="button" value="로그인" class="login" />
						<input type="button" value="회원가입" id="reg" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>












