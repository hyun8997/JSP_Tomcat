<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptSelectOne.jsp</title>
<style type="text/css">
	table {
		width: 600px;
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
	<!-- dbms에 접근해서 사용자(client)가 원하는 데이터만 가져와서 표로 출력 -->
	<form action="#">
		<h1>부서검색</h1>
		<input type="text" name="no" id="" />
		<input type="submit" value="검색" />	
	</form>
	
	<%
		String n = request.getParameter("no");
		
		int no = -1;
	
		if(n==null || n.equals("")){
			no = 0;
		}else {
			no = Integer.parseInt(n);
		}
		
	%>
	
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		
		<%
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			String user = "scott";
			String password = "tiger";
			
			StringBuffer sb = new StringBuffer();
			
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			Connection conn = null;
			
			try{
				Class.forName(driver);
				
				conn = DriverManager.getConnection(url, user, password);
				
				//System.out.println("conn : "+ conn);												
				
			}catch(ClassNotFoundException cnfe){
				cnfe.getStackTrace();
				System.out.println("드라이버 로딩 실패");
			}catch(SQLException se){
				se.getStackTrace();
				System.out.println("DBMS 연결 실패");
			}
			
			sb.append("select * from dept ");
			sb.append("where deptno = ? ");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){			
				int deptno = rs.getInt(1);
				String dname = rs.getNString(2);
				String loc = rs.getNString(3);		
		%>
		
		
		<tr>
			<td><%=deptno %></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
		</tr>
		<%
			}
		if (rs!=null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
		
		%>
	</table>

</body>
</html>
