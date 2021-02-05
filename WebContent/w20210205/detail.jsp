<%@page import="java.util.ArrayList"%>
<%@page import="vo.ReBoardVO"%>
<%@page import="dao.ReBoardDAO"%>
<%@page import="dao.BoardV2_DAO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
		String no = request.getParameter("bno");

		//게시글 table
		BoardVO vo = new BoardVO();
		BoardV2_DAO dao = new BoardV2_DAO();
		
		//댓글 table
		ReBoardDAO rdao = new ReBoardDAO();
		ReBoardVO rvo = new ReBoardVO();
		
		int bno = 0;
		
		if(no!=null){		/* null처리 */
			bno = Integer.parseInt(no);
		
			// 조회수 증가 메소드 실행
			dao.raiseHits(bno);
			
			vo = dao.getData(bno);
		}else {
			response.sendRedirect("list.jsp");
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>detail.jsp</title>
<style type="text/css">
	table {width: 900px; margin: 0 auto;}
	
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
	
	#contents {
		background: #aaa;
	}
	
	.btn {
		background-color: white;
		margin-left:5px;
		
		
		border: none;
		padding: 10px 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		cursor: pointer;
		
		border-radius:10px;
	}
	
	.btn:hover {
    	background-color: rgba(233,189,255,1);
	}
	
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function moveToModify(){
		location.href="modify.jsp?bno="+<%=vo.getBno()%>;
	}
	
	$(document).ready(function(){
		$("#delConfirm").on('click', function(){
			
			var flag = confirm("정말 삭제하시겠습니까?");
			
			if(flag){
				//console.log("삭제 수행");
				
				//창 이동시키기 -> deleteOk.jsp -> 삭제 기능이 수행되도록 해보세요
				location.href = "deleteOk.jsp?bno="+<%=vo.getBno()%>;
				
			}
			
		});
	});
	
	
	
</script>

</head>
<body>

	<table>
		<tr>
			<th id="t1">작성자</th>
			<td><%=vo.getWriter() %></td>
			<th id="t2">조회수</th>
			<td><%=vo.getHits() %></td>
			<th id="t3">작성일시</th>
			<td><%=vo.getRegdate() %></td>
		</tr>
		<tr id="title">
			<th>제목</th>
			<td colspan="5"><%=vo.getTitle() %></td>
		</tr>
		<tr id="contents">
			<th>내용</th>
			<td colspan="5">
				<textarea disabled="disabled" name="" id="" cols="200" rows="10"><%=vo.getContents() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="list.jsp"><input class="btn" type="button" value="목록" /></a>
				<input class="btn" type="button" value="수정" onclick="moveToModify()"/>
				<input class="btn" type="button" value="삭제" id="delConfirm"/>
			</td>
		</tr>
		
		
	</table>
	
	<br />
	<form action="replyOk.jsp">
		<input type="hidden" name="bno" value="<%=vo.getBno() %>"/>
		<table>
			<tr>
				<th>댓글 작성</th>
				<td>
					<input type="text" name="retxt" id="" size="30"/>
					<input type="submit" value="작성" />
				</td>
			</tr>
			<%
				ArrayList<ReBoardVO> list = rdao.getAllReply();
				
				//댓글이 원글에서만 출력되도록
				//ArrayList<ReBoardVO> list = rdao.getAllReply(bno);
				//아니면 for 안에 if(bno==revo.getRef())로 감싸서 처리할 수도 있다.
				
				for(ReBoardVO revo : list){
					if(bno==revo.getRef()){
			%>
			<tr>
				<td colspan="2">
					<textarea name="" id="" cols="100" rows="5" disabled="disabled"><%= revo.getContents() %></textarea>
				</td>
			</tr>
			<%
					}// if end
				}// for end
				
			%>
		</table>
	
		
	
	</form>
	
	
</body>
</html>