<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dirView.jsp</title>
</head>
<body>
	
	<!-- 파일서버 관리자 입장에서 현재 내 서버에 사용자가 업로드 한 파일을 확인 할 수 있는 페이지 -->
	
	<%
		//jsp에서는 내 os에서의 위치를 볼 순 없고 실제 주소와 매칭되어 있는 프로젝트 내 upload 파일을 볼 수 있다
		// 파일 서버에 생성된 upload 디렉토리의 실제 OS 경로
		String path = request.getRealPath("upload");
		
		// 파일 객체, IO
		File f = new File(path);
		
		// 경로가 디렉토리인지 여부
		if(f.isDirectory()){
			// 현재 디렉토리에 있는 파일 출력(모두)
			String[] fList = f.list();	//목록 배열로 받게 되어있음
			for(String list : fList){
				out.println("<h2>"+list+"</h2>");	//실질적으로 가지고 있던 파일명들 잘 가져옴
				out.println("<img src='../upload/"+list+"'/> ");
			}
		}
		
		
		
	%>
	
	
</body>
</html>