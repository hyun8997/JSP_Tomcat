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
			<th>�μ���ȣ</th>
			<th>�μ��̸�</th>
			<th>�μ���ġ</th>
		</tr>
		
		<%
	// JDBC�� ���� DBMS�� ����
	// 0. ���� ����
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			String user = "scott";
			String password = "tiger";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			StringBuffer sb = new StringBuffer();
			
			
			try {
	// 1. ����̹� ��ü �ε�
				Class.forName(driver);	//jsp������ �ٷ� ������ ������ ���� �ʾƼ� try catch�� �ν����� ����, �˾Ƽ� �ؾ� ��
	// 2. Connection ��ü ����
				conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	// 3. SQL�� �ۼ�	
			sb.append("select * from dept ");
	
	
			try {
	// 4. ���� ��ü ����
				pstmt = conn.prepareStatement(sb.toString());
	// 5. ����
				rs = pstmt.executeQuery();
	// 6. ���ڵ� ���� ���� ó��
				while(rs.next()) {					
					int deptno = rs.getInt(1);
					String dname = rs.getNString(2);
					String loc = rs.getNString(3);
					
					/* out.println("deptno : "+ deptno + "<br>");
					out.println("dname : "+ dname + "<br>");
					out.println("loc : "+ loc + "<br>");
					out.println("--------------------------- <br>"); */
		%>
		
		<tr>			<!-- DB���� ���ö����� �⺻Ʋ�� �����ؼ� �˾Ƽ� ��ü ���̸� ���ߵ��� -->
			<td><%=deptno %></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
		</tr>
		
		<% 
						}
			} catch (SQLException e) {
				e.printStackTrace();	
			}
	// 7. �ڿ� �ݳ�
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