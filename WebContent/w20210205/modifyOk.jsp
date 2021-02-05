<%@page import="dao.BoardV2_DAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--  [modifyOk.jsp] -->
    
  <!--   DBMS 접근해서 사용자가 수정한 내용을 저장 -->
  
  <%
     String title = request.getParameter("title");
     String contents = request.getParameter("contents");
     String no = request.getParameter("bno");
   
     
     /*
     out.println("title : " + title + "<br/>");
     out.println("contents :"+ contents + "<br/>");
     out.println("bno :"+ no + "<br/>");
     */
  
     
     
     if(no!=null){
        int bno = Integer.parseInt(no);
        
        BoardV2_DAO dao= new BoardV2_DAO();
        BoardVO vo = new BoardVO();
        vo.setTitle(title);
        vo.setContents(contents);
        vo.setBno(bno);
        
        dao.modifyData(vo);
        
        response.sendRedirect("list.jsp");
        
     }else{
        response.sendRedirect("list.jsp");
     }
     
     
  %>