<%@page import="dao.BoardV2_DAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
      // 페이징 처리

      // 현재 페이지 (currentPage) 얻어오기 
      
      String cp = request.getParameter("cp");

      int currentPage = 0;
      
      if(cp!=null){
         currentPage = Integer.parseInt(cp);
      }else{
         currentPage =1;
      }
      
      
         BoardV2_DAO bdao = new BoardV2_DAO();

          // 총 게시글 수
          int totalCount = bdao.getTotalCount();
          
          // 한페이지당 레코드 수 : 10 개씩 자르기
          
          int recordBypage = 10;
          
          // 총 페이지 수 
          int totalPage = 
             (totalCount%recordBypage==0)?totalCount/recordBypage:totalCount/recordBypage+1;
          
          /*
             현재 페이지 번호
             
             1    2    3    4    5 .......
             
             각 페이지별 레코드 번호
             1      11   21  31  41 ........
             
             
             10  20  30  40  50 .......
             
             
             */
             
             
             // 현재 페이지 - 레코드 시작 번호
             int startNo = (currentPage-1)*recordBypage+1;
          
             // 현재페이지 - 레코드 끝 번호
             int endNo = currentPage*recordBypage;
            
             
/*              
             out.println("<h2> 총 게시물 수 :  " + totalCount + "</h2>");
             out.println("<h2> 한 페이지당 게시물 수 :  " + recordBypage + "</h2>");
             out.println("<h2> 총 페이지 수 :  " + totalCount + "</h2>");
             out.println("<h2> 현재 페이지 번호 :  " + currentPage + "</h2>");
             out.println("<h2> 현재 페이지 시작번호 :  " + startNo + "</h2>");
             out.println("<h2> 현재 페이지 끝번호 :  " + endNo + "</h2>"); */
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>list.jsp</title>
<style type="text/css">
	table {
		width: 1000px;		/* 이렇게 고정형이 아닌 비울형으로 해야 어느기기로 보든 안깨진다 - 반응형 */
							/* em이나 %로 작업 하는 것 */
		marigin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		padding: 2px;
		font-size: 20px;
		text-shadow: 2px 2px 4px rgba(255,255,255,0.78);
		
		background: rgb(255,202,236); /* 웹킷이 안되면 동작할 것임 */
        background: linear-gradient(0deg, rgba(255,202,236,1) 0%, rgba(233,189,255,1) 49%, rgba(179,164,224,1) 88%);
	}
	
	.col1, .col4{
		width: 15%;
		text-align: center;
	}
	
	.col2 {
		width: 50%;
	}
	
	.col3 {
		width: 20%;
	}
	
	.btn {
		text-align: center;
	}
	
	.regBtn {
		width: 200px;
		-webkit-border-radius: 10px 10px 10px 10px;
	}
	
	
	a {
		text-decoration: none;
	}
	
	#pageList {
		text-align: center;
	}
	
	#page {
		width: 20px;
		margin: 0;
		padding: 2px;
		border: 1px solid gray;
	}
	
	.red {
		color: red;
		font-size: 20px;
		height: 100px;
	}
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//ex) tr - 첫번째 tr이 0번째
		//ex) :nth-child(1) - 첫번째가 1번째 (구조적 psudo class)
		
		$("tr:first").css("background-color", "pink");
		$("tr:last").css("background-color", "pink");
		$("tr:odd").css("background-color", "lightyellow");		//0부터 시작하므로 2번째 줄=1 odd임
		
		// 마우스가 th에 over되면 red(클래스)라는 css 효과를 삽입
		$("th").on('mouseover', function(){
			//$(this).addClass('red');  //this->"th" 나 자신을 호출, addClass만 있으므로 css에 클래스로 선언해놔야 함
			$(this).toggleClass('red');
		});
		
		// 마우스가 th에서 out되면 red라는 css 효과를 끝내기
		$("th").on('mouseout', function(){
			$(this).removeClass('red');
		});
		
	});
	
</script>


</head>
<body>
	<table>
		<tr>
			<th class="col1">게시물번호</th>
			<th class="col2">제목</th>
			<th class="col3">작성자</th>
			<th class="col4">조회수</th>
		</tr>
		
		
		<!-- 사용자가 작성한 게시글을 전부 출력해보세요 -->
		<% 
			ArrayList<BoardVO> list = bdao.getAllData(startNo, endNo);
		   
	     	for(BoardVO vo : list){

		%>
		<tr>
			<td class="col1"><%=vo.getBno() %></td>
			<td class="col2">
				<a href="detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getTitle() %></a>
			</td>
			<td class="col3"><%=vo.getWriter() %></td>
			<td class="col4"><%=vo.getHits() %></td>
		</tr>
		<%
			}// for end
		%>
		<tr>
			<td colspan="4" id="pageList">
				<%
					for(int i = currentPage-3; i<currentPage+3; i++ ){	/* 현재 페이지를 앞3개 뒤3개 나오게 하려고 */
						if(i<=0){
							continue;
						}else if(i>totalPage){
							break;
						}else{
						
				%>
				
				<a href="list.jsp?cp=<%=i%>"><span id="page"><%=i %></span></a>
				<%
						}// if end
					}// for end
				%>
			</td>
			
		</tr>
		
		
		
		
		
		<tr>
			<td colspan="4" class="btn">
				<a href="write.jsp"><input type="button" value="등록" class="regBtn"/></a>
			</td>
		</tr>
		
	</table>
	
	
	
</body>
</html>