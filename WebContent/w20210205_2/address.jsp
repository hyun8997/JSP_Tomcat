<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address.jsp</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function openDaumPost(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            
	        	document.getElementById('post').value = data.zonecode;	//우편번호
                document.getElementById("addr1").value = data.roadAddress;	//도로명 주소
                document.getElementById("addr2").value = data.jibunAddress; //지번 주소
	        }
	    }).open();
	}
	
</script>

</head>		<!-- http://postcode.map.daum.net/guide#usage 예제 확인 -->
<body>
	<input type="text" name="" id="post" placeholder="우편번호" />
	<input type="button" value="우편번호 찾기" onclick="openDaumPost()"/>	<br />
	<input type="text" name="" id="addr1" placeholder="도로명주소" size="50"/>	<br />
	<input type="text" name="" id="addr2" placeholder="지번주소"  size="50"/>
	
</body>
</html>