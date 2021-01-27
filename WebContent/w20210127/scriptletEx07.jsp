<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 	배열
	
	이미지 목록 배열에 저장 ==> 브라우저에 영화 포스트 10장 출력해보세요 -->
	
	<%
	/* 	String[] images = {
				"movie_image1.jpg", "movie_image2.jpg", "movie_image3.jpg",
				"movie_image4.jpg", "movie_image5.jpg", "movie_image6.jpg",
				"movie_image7.jpg", "movie_image8.jpg", "movie_image9.jpg",
				"movie_image10.jpg"
		}; */
	
	/* 	out.println("<h2>영화포스터</h2><br>");
		for(int i=0; i<images.length; i++){
			out.println("<img alt='"+i+"번사진' src='"+images[i]+"' width='400px'>");
		} */
		
		int[] imgNum = new int[10];
		
		for(int i=0; i<10; i++){
			imgNum[i]=(i+1);
		}
		
		out.println("<h2>영화포스터</h2><br>");
		for(int i=0; i<imgNum.length; i++){
			out.println("<img alt='"+imgNum[i]+"번사진' src='movie_image"+imgNum[i]+".jpg' width='400px'> <br>");
		}
		
	%>
	
	
	
</body>
</html>