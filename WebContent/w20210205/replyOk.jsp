<%@page import="vo.ReBoardVO"%>
<%@page import="dao.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- [replyOk.jsp] -->
<%
	String id = "replyer04";
	String contents = request.getParameter("retxt");
	String no = request.getParameter("bno");
	
	if(no != null){
	
	 	int ref = Integer.parseInt(no);
		
		ReBoardDAO rdao = new ReBoardDAO();
		ReBoardVO rvo = new ReBoardVO();
		
		rvo.setId(id);
		rvo.setContents(contents);
		rvo.setRef(ref);
		
		rdao.insertReply(rvo);
	
		response.sendRedirect("detail.jsp?bno="+no); 
	}else{
		response.sendRedirect("detail.jsp?bno="+no); 
	}



%>









