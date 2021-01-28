<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>selectOption.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	// jQuery : 자바 스크립트 잘 되어있는 것 모은 라이브러리
	
	$(document).ready(function(){		//준비
		$("#dan").on('change', movePage);		//id로 css처럼 가져옴, onchange에 동작하도록 해놓음
		
	}); 		
	
	
	

	function movePage(){
		//console.log("옵션 선택됐음");
		
		//옵션 선택 후 prtGuGuDan.jsp로 이동 - path 방식(name으로 찾기)으로 이동시켜 보세요
		
		document.frm.action = "prtGuGuDan.jsp";
		document.frm.method = "get";
		document.frm.submit();
	}

</script>
</head>
<body>
<!-- 
	자바 스크립트로 옵션을 선택하면 movePage() 호출
	브라우저 콘솔창에 '옵션 선택됐음' 출력
 -->
 	<h2>구구단을 선택하세요</h2>
 	<form action="#" name="frm">
		<!-- <select name="d1" id="dan" onchange="movePage()"> -->	<!-- onclick onchange 가능 -->
		<select name="d1" id="dan"> 
			<option value="----------">----------</option>
			<option value="1단">1단</option>
			<option value="2단">2단</option>
			<option value="3단">3단</option>
			<option value="4단">4단</option>
			<option value="5단">5단</option>
			<option value="6단">6단</option>
			<option value="7단">7단</option>
			<option value="8단">8단</option>
			<option value="9단">9단</option>
		</select>
		<input type="button" value="전송" onclick="movePage()">
	</form>
	
	
</body>
</html>