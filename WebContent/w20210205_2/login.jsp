<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>

	<%
	/*	
		- id 값이 없다면 로그인이 안되어있는 상태이므로
		  loginForm이 노출되고 회원가입 또는 로그인 입력을 할 수 있는 상태
		  
		- id 값이 있다면 이미 로그인 되어 있는 상태이므로 
		   쿠키 목록에서 id값 여부를 비교한 다음
		  loginForm div가 노출되지 않도록 처리
	
	
	*/
	
		Cookie[] cList = request.getCookies();
		String id = null;
	
		if(cList!=null){
			for(Cookie c : cList){
				if(c.getName().equals("memberLogin")){
					id = URLDecoder.decode(c.getValue(), "UTF-8");
				}//if end
			}//for end
		}//if end
	
	
		if(id==null){			//맨 처음 엑세스해서 id가 null일것이므로 로그인 폼을 보여주고 로그인되면 else로 가서 환영인사하고 로그아웃
	%>
	<form action="loginOk.jsp"> 
		<div id="loginForm">
			<table>
				<tr>
					<th>ID : </th>
					<td><input type="text" name="id" id="" /></td>
				</tr>
				<tr>
					<th>PW : </th>
					<td><input type="text" name="pw" id="" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인" />
						<input type="button" value="회원가입" />
					</td>
				</tr>
			</table>
		</div>
	</form>
	<%
		}else {
	%>	
			<h2><a href="logout.jsp"><%=id %>님 환영합니다.</a></h2>	<!-- 누르면 로그아웃 기능 동작하도록 함 -->
	<% 
		}
	%>
</body>
</html>