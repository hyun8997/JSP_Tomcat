<%@page import="dao.FileUploadTestDAO"%>
<%@page import="vo.FileUploadTestVO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileView.jsp</title>
</head>
<body>
	
	<%
		String writer = request.getParameter("writer");
		
		// db에 접근해서 filePath를 찾아오기
		FileUploadTestDAO dao = new FileUploadTestDAO();
		FileUploadTestVO vo = dao.getData(writer);
	%>
	
	<h2>작성자 : <%=vo.getWriter() %></h2>
	<img src="<%=vo.getFilePath() %>" alt="" />
	
</body>
</html>