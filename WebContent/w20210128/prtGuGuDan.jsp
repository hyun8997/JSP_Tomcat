<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>prtGuGuDan.jsp</title>
</head>
<body>
	<%
		String str = request.getParameter("d1");	
		int dan = 0;
		//out.println(str);
		
 		dan = Integer.parseInt(str.substring(0, 1));
		
		
		for(int i=1; i<10; i++){
			out.println(dan+" * "+i+" = "+(dan*i)+"<br>");
		} 
	%>
</body>
</html>