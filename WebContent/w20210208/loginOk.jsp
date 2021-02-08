<%@page import="bean.Goott_MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
<%-- 
	<% 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.println("id : "+ id + "<br/>");
		out.println("pw : "+ pw + "<br/>");
	%>
	
	<%
		Goott_MemberBean gmb = new Goott_MemberBean();
		gmb.setId(request.getParameter("id"));
		
		//dao 있고 로그인 했다고 치고
	%>
 --%>	
 
<!-- 	
	jsp action tag : 자바 문법을 태그로 만들어 놓은 것
				   : jsp 페이지에서 최대한 자바 코드를 사용하지 않기 위해
 -->	
 
 	<jsp:useBean id="vo" class="bean.Goott_MemberBean" ></jsp:useBean>	<!-- class에 있는 객체를 호출해서 id의 변수로 사용하겠다. -->
<%-- 	
	<jsp:setProperty property="id" name="vo" param="id"/>  <!-- property에 있는 값을 name에 param의 이름으로 넣을 것이다. -->
	<jsp:setProperty property="pw" name="vo" param="pw"/>  
 --%>	
 	
 	<!--  
 	만약 property와 param(이전 페이지 form에 있는 name 속성값)이 이름이 같다면
 	일일히 개발자가 맵필할 필요없도록 자동으로 찾아줄 수 있음
 	-->
 	
 	<jsp:setProperty property="*" name="vo"/>  <!-- *로 전부 맵핑해서 받음 -->
 	
 
	
	<%-- <h2>id : <a href="loginMain.jsp?id=<%=gmb.getId()%>"><%=gmb.getId() %></a></h2> --%>
	
	<h2>id : <jsp:getProperty property="id" name="vo"/></h2>  <!-- name에서 property를 받아올 것이다. -->
	<h2>pw : <jsp:getProperty property="pw" name="vo"/></h2>
	
	
	<a href="loginForm.jsp"><input type="button" value="돌아가기" /></a>
	
</body>
</html>