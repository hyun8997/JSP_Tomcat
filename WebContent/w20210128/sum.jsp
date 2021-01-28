<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>sum.jsp</title>
</head>
<body>
	<%
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		
		//System.out.println("num1 : "+num1+", num2 : "+num2);
		
		int n1=0; int n2=0; int result=0;
		
		//한 페이지 내에서 연산하면 null처리가 필요하다.
		//null이면 연산하지 못하도록(딜레이)
		if(num1 != null && num2 != null){
			n1 = Integer.parseInt(num1);	//num1이 null이라서 500 오류가 뜸
			n2 = Integer.parseInt(num2);
			
			result = n1 + n2;
			
			out.println("n1 : "+n1+", n2 : "+n2+" = "+result);
		}
		
		
		
	%>


	<form action="">
		<input type="text" name="num1" id="" value="<%=n1%>">
		+
		<input type="text" name="num2" id="" value="<%=n2%>">
		<input type="submit" value="=">
		<input type="text" name="result" id="" value="<%=result%>">
		
	</form>
</body>
</html>