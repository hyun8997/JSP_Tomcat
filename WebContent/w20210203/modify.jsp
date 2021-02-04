<%@page import="dao.BoardV2_DAO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
<meta charset="EUC-KR">
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
            <textarea  name="contents" id="" cols="200" rows="10"><%=vo.getContents() %>
            </textarea>
         </td>
      </tr>
      <tr>
         <td colspan="6">
         <input class="btn" type="button" value="목록" />
         <input class="btn" type="submit" value="저장" />
         <input class="btn" type="button" value="삭제" />
         </td>
      </tr>   
      </table>
   </form>

</body>
</html>