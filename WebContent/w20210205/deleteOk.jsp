<%@page import="dao.BoardV2_DAO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- [deleteOk.jsp] -->

<%

	String no = request.getParameter("bno");

	if(no!=null){
		int bno = Integer.parseInt(no);
		
		BoardV2_DAO dao = new BoardV2_DAO();
		dao.DeleteData(bno);
		
		response.sendRedirect("list.jsp");
		
	}else{
		response.sendRedirect("list.jsp");
	}
	












%>
