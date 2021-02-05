<%@page import="java.net.URLEncoder"%>
<%@page import="dao.Goott_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- loginOk.jsp -->

<%
	// id, pw를 받아와서 db에 있는지 확인
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Goott_MemberDAO dao = new Goott_MemberDAO();
	
	// 회원이면 로그인 가능 --> 쿠키를 통해서 기능 수행
	boolean flag = dao.isExist(id, pw);
	
	if(flag){
		//out.println(id + "님 어서오세요");
		
		String userId = URLEncoder.encode(id, "UTF-8");
		
		Cookie c = new Cookie("memberLogin", userId);
		c.setMaxAge(60*60*24);					//하루 유지되도록 함 60초*60분*24시간

		response.addCookie(c);
		
		//out.println(id + "님 쿠키에 저장되었습니다");	 // DB에 들어가는 것을 줄이기 위해 쿠키를 사용하는 것이다.
		response.sendRedirect("login.jsp");			// 로그인으로 돌아가서 쿠키에 로그인 데이터가 있으면 loginCheck처럼 확인 메세지 보여줄 것이다. 로그인 폼은 숨기고
		//response.sendRedirect("loginCheck.jsp");	// 쿠키를 보고 로그인 확인 메세지 띄워주는 페이지
		
	}else {
		out.println("회원가입하세요");
	}
	
	
%>