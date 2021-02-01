<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout.jsp</title>
<link rel="stylesheet" href="../css/layOut.css" />
</head>
<body>
	<%
		String var = request.getParameter("var");
	
		String pname = "";
		
		if(var==null){
			pname = "basicContents.jsp";
		}else{
			pname = var + ".jsp";
		}
	
	%>


	<div id="container">
		<!-- layout.jsp에서 navibar에서 각각 선택된 페이지가 노출되는 형태로 구성 -->
		<!-- jsp action tag : 자바 문법을 태그로 만들어 놓은 것 -->
		
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="<%=pname %>"></jsp:include>
		<jsp:include page="sidebar.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>

















