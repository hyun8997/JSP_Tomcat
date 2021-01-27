<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reponse.jsp</title>
<script type="text/javascript">
function moveNaver(){
   location.href="https://www.naver.com";
}
}</script>
</head>
<body>
<h2> 네이버로 페이지 이동하기</h2>


      <!-- a tag를 통한 이동 -->
   <a href="http://www.naver.com" target="_blank">네이버1</a>
   <!--  javascript 통한 이동 -->   
   <span onclick="moveNaver">네이버2</span>
   
   <!-- response 내부 객체를 통한 이동 -->
   <%
   
   response.sendRedirect("https://www.naver.com");
   
   
   %>
   
</body>
</html>