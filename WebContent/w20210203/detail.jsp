<%@page import="dao.BoardV2_DAO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
		String no = request.getParameter("bno");
		BoardVO vo = new BoardVO();
		BoardV2_DAO dao = new BoardV2_DAO();
		
		if(no!=null){		/* nulló�� */
			int bno = Integer.parseInt(no);
		
			// ��ȸ�� ���� �޼ҵ� ����
			dao.raiseHits(bno);
			
			vo = dao.getData(bno);
		}else {
			response.sendRedirect("list.jsp");
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		
		background: rgb(255,202,236); /* ��Ŷ�� �ȵǸ� ������ ���� */
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
			
			var flag = confirm("���� �����Ͻðڽ��ϱ�?");
			
			if(flag){
				//console.log("���� ����");
				
				//â �̵���Ű�� -> deleteOk.jsp -> ���� ����� ����ǵ��� �غ�����
				location.href = "deleteOk.jsp?bno="+<%=vo.getBno()%>;
				
			}
			
		});
	});
	
	
	
</script>

</head>
<body>

	<table>
		<tr>
			<th id="t1">�ۼ���</th>
			<td><%=vo.getWriter() %></td>
			<th id="t2">��ȸ��</th>
			<td><%=vo.getHits() %></td>
			<th id="t3">�ۼ��Ͻ�</th>
			<td><%=vo.getRegdate() %></td>
		</tr>
		<tr id="title">
			<th>����</th>
			<td colspan="5"><%=vo.getTitle() %></td>
		</tr>
		<tr id="contents">
			<th>����</th>
			<td colspan="5">
				<textarea name="" id="" cols="200" rows="10"><%=vo.getContents() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="list.jsp"><input class="btn" type="button" value="���" /></a>
				<input class="btn" type="button" value="����" onclick="moveToModify()"/>
				<input class="btn" type="button" value="����" id="delConfirm"/>
			</td>
		</tr>
		
		
	</table>
	
	
</body>
</html>