<%@page import="dao.BoardV2_DAO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--  
사용자에게 보여줄 페이지가 아니므로 HTML 필요 X, DB 접속 요소만
[writeOk.jsp]
-->

<%
	// 유의 : 바로 DBMS에 접근하지 말고 확인하는 습관을 가지세요
	// 브라우저 혹은 콘솔에 먼저 출력
	
	String writer = request.getParameter("wr");
	String title = request.getParameter("ti");
	String contents = request.getParameter("ct");
	
/* 	out.println("writer : "+writer+"<br>");
	out.println("title : "+title+"<br>");
	out.println("contents : "+contents+"<br>"); */
	
	// DBMS에 연결한 후 write.jsp에서 전달해온 값을 저장
	
	BoardV2_DAO dao = new BoardV2_DAO();
	
	BoardVO vo = new BoardVO();
	vo.setWriter(writer);
	vo.setTitle(title);
	vo.setContents(contents);
	
	// 사용자의 IP를 업어오기
	String ip = request.getRemoteAddr();
	vo.setIp(ip);
	
	dao.addData(vo);
	
	// DB에 저장이 잘 되었으면 게시판 메인으로 페이지 이동
	response.sendRedirect("list.jsp");
	
	
	
	
	
%>



