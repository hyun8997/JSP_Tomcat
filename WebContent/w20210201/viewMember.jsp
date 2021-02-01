<%@page import="vo.Goott_MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Goott_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewMember.jsp</title>
<style type="text/css">
	table {
		width: 800px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
	
	th {background-color: #aaa;}
	
</style>
</head>
<body>
	<!-- 관리자라고 가정을 하고 회원정보를 현재 페이지에 모두 출력 -->
	<table>
		<tr>
			<th>MEMNO</th>
			<th>ID</th>			
			<th>NAME</th>
			<th>BIRTH</th>
			<th>MP</th>
			<th>REGDATE</th>
			<th>EMAIL</th>
		</tr>
		<%
		Goott_MemberDAO dao = new Goott_MemberDAO();
		
		ArrayList<Goott_MemberVO> list = dao.getAllData();
		
		for(Goott_MemberVO vo : list){				
		%>		
		<tr>
			<td><%=vo.getMemno() %></td>
			<td><%=vo.getId() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getBirth() %></td>
			<td><%=vo.getMp() %></td>
			<td><%=vo.getRegdate() %></td>
			<td><%=vo.getEmail() %></td>
		</tr>
		<%
		}
		
		%>
		
	</table>
</body>
</html>