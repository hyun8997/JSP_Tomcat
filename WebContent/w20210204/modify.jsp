<%@page import="dao.BoardV2_DAO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
		String no = request.getParameter("bno");
		BoardVO vo = new BoardVO();
		BoardV2_DAO dao = new BoardV2_DAO();
		
		if(no!=null){		/* null처리 */
			int bno = Integer.parseInt(no);
			
			vo = dao.getData(bno);
		}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>modify.jsp</title>
<style type="text/css">
	table {width: 900px; margin: 0 auto;}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th {
		padding: 2px;
		font-size: 20px;
		text-align: center;
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

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="../summernote/summernote.min.css" rel="stylesheet">
<script src="../summernote/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="../summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
	function moveToModify(){
		location.href="modify.jsp?bno="+<%=vo.getBno()%>;
	}
	
	$(document).ready(function(){
		$('#summernote').summernote({
	        placeholder: 'Hello Summernote World',
	        tabsize: 2,
	        height: 100,
	        lang: 'ko-KR'	// default: 'en-US'
	    });
	});
	
</script>

</head>
<body>
	<form action="modifyOk.jsp">
      <input type="hidden" name="bno" value="<%=vo.getBno() %>"/>
      <table>
         <tr id="top">
            <th id="t1">작성자</th>
            <td><%=vo.getWriter() %></td>
            <th id="t2">조회수</th>
            <td><%=vo.getHits()  %></td>
            <th id="t3">작성일시</th>
            <td><%=vo.getRegdate() %></td>
         </tr>
      <tr id="title">
         <th>제목</th>
         <td colspan="5">
            <input type="text" name="title" id="" value="<%=vo.getTitle() %>" size="30"/>
         </td>
      </tr>
      <tr id="contents">
         <th>내용</th>
         <td colspan="5">
            <textarea  name="contents" id="summernote" cols="200" rows="10">
            	<%=vo.getContents() %>
            </textarea>
         </td>
      </tr>
      <tr>
         <td colspan="6">
         <a href="list.jsp"><input class="btn" type="button" value="목록" /></a>
         <input class="btn" type="submit" value="저장" />
         <input class="btn" type="button" value="삭제" id="delConfirm"/>
         </td>
      </tr>   
      </table>
   </form>

</body>
</html>