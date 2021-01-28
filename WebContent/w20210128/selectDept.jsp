<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>selectDept.jsp</title>
<style type="text/css">
	table {
		width: 600px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapes;
		text-align: center;
	}
	
	th { background-color: #aaa;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		
		<%
	// JDBC를 통해 DBMS에 접근
	// 0. 변수 선언
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			String user = "scott";
			String password = "tiger";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			StringBuffer sb = new StringBuffer();
			
			
			try {
	// 1. 드라이버 객체 로딩
				Class.forName(driver);	//jsp에서는 바로 컴파일 지원이 되지 않아서 try catch를 인식하지 못함, 알아서 해야 함
	// 2. Connection 객체 생성
				conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	// 3. SQL문 작성	
			sb.append("select * from dept ");
	
	
			try {
	// 4. 문장 객체 생성
				pstmt = conn.prepareStatement(sb.toString());
	// 5. 실행
				rs = pstmt.executeQuery();
	// 6. 레코드 별로 로직 처리
				while(rs.next()) {					
					int deptno = rs.getInt(1);
					String dname = rs.getNString(2);
					String loc = rs.getNString(3);
					
					/* out.println("deptno : "+ deptno + "<br>");
					out.println("dname : "+ dname + "<br>");
					out.println("loc : "+ loc + "<br>");
					out.println("--------------------------- <br>"); */
		%>
		
		<tr>			<!-- DB에서 나올때마다 기본틀을 적용해서 알아서 전체 길이를 맞추도록 -->
			<td><%=deptno %></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
		</tr>
		
		<% 
						}
			} catch (SQLException e) {
				e.printStackTrace();	
			}
	// 7. 자원 반납
			finally {
				if(rs!=null) {
					try {
						rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn!=null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
		%>
		
	</table>
	
</body>
</html>