<%@page import="vo.FileUploadTestVO"%>
<%@page import="dao.FileUploadTestDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileWriteOk.jsp</title>
</head>
<body>
	<%
		/*  	
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		String fileName = request.getParameter("fileName");	//얘는 파일로 넘어와서 일반 텍스트가 아님
		
		out.println(title);
		out.println(writer);
		out.println(contents);
		out.println(fileName);  
		
		*/
		
		
		
		// upload directory
		String saveDir = request.getRealPath("upload");	//내가 만든 파일 위치 기준 upload 대신 서버의 저장 경로
														//서버의 한 곳에 두고 프로잭트 하 주소만 DB에 넣기
		
		//out.println(saveDir + "<br/>");	//서버 저장 위치
		
		// 첨부파일 최대 크기 (byte단위 ex. 1kb - 1024)
		int maxFileSize = 1024*1024*10;	//10MB
		
		// cos 사용 - 제공되는 클래스 호출
		// new MultipartRequest(요청 객체, 저장 디렉토리, 최대 파일 크기, 인코딩 타입, 동명 파일 처리 규정 객체)
		MultipartRequest mr = 
			new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy()); 
														  //같은 이름이 있으면 어떻게 할지(번호를 붙여감), 덮어쓰기는 아님
			
		// 요청 객체가 들어있는 Multipart 객체로 브라우저에 요청해서 정보를 확인
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String contents = mr.getParameter("contents");
		//String fileName = mr.getParameter("fileName");	// 보안 때문에 이렇게는 파일명 못받아옴
		
		// 실제 이름을 밝혀주지 않음. 
		String fileName = mr.getOriginalFileName("fileName");
		
		/* 
		out.println(title + "<br/>");
		out.println(writer + "<br/>");
		out.println(contents + "<br/>");
		out.println(fileName + "<br/>");  
		*/
		
		// DBMS에 접근해서 저장
		FileUploadTestVO vo = new FileUploadTestVO();
		FileUploadTestDAO dao = new FileUploadTestDAO();
		
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContents(contents);
		vo.setFilePath("../upload/"+fileName);	//보안을 위해 내가 만든 upload 파일에 ~~~
		
		dao.insertData(vo);
		
		
		
		
	%>
	
	<h2>제목 : <%=title %></h2>
	<h2>작성자 : <%=writer %></h2>
	<h2>내용 : <%=contents %></h2>
	
	<h2><a href="dirView.jsp"><span>파일 정보</span></a> - admin</h2>	<!-- 일종의 관리자 페이지 -->
	<h2><a href="fileView.jsp?writer=<%=writer%>"><span>파일 정보</span></a> - client</h2>	<!-- 사용자가 체크할 수 있는 페이지 -->
	
	
</body>
</html>