<%@page import="dao.BoardV2_DAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
      // ����¡ ó��

      // ���� ������ (currentPage) ������ 
      
      String cp = request.getParameter("cp");

      int currentPage = 0;
      
      if(cp!=null){
         currentPage = Integer.parseInt(cp);
      }else{
         currentPage =1;
      }
      
      
         BoardV2_DAO bdao = new BoardV2_DAO();

          // �� �Խñ� ��
          int totalCount = bdao.getTotalCount();
          
          // ���������� ���ڵ� �� : 10 ���� �ڸ���
          
          int recordBypage = 10;
          
          // �� ������ �� 
          int totalPage = 
             (totalCount%recordBypage==0)?totalCount/recordBypage:totalCount/recordBypage+1;
          
          /*
             ���� ������ ��ȣ
             
             1    2    3    4    5 .......
             
             �� �������� ���ڵ� ��ȣ
             1      11   21  31  41 ........
             
             
             10  20  30  40  50 .......
             
             
             */
             
             
             // ���� ������ - ���ڵ� ���� ��ȣ
             int startNo = (currentPage-1)*recordBypage+1;
          
             // ���������� - ���ڵ� �� ��ȣ
             int endNo = currentPage*recordBypage;
            
             
/*              
             out.println("<h2> �� �Խù� �� :  " + totalCount + "</h2>");
             out.println("<h2> �� �������� �Խù� �� :  " + recordBypage + "</h2>");
             out.println("<h2> �� ������ �� :  " + totalCount + "</h2>");
             out.println("<h2> ���� ������ ��ȣ :  " + currentPage + "</h2>");
             out.println("<h2> ���� ������ ���۹�ȣ :  " + startNo + "</h2>");
             out.println("<h2> ���� ������ ����ȣ :  " + endNo + "</h2>"); */
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>list.jsp</title>
<style type="text/css">
	table {
		width: 1000px;		/* �̷��� �������� �ƴ� ��������� �ؾ� ������� ���� �ȱ����� - ������ */
							/* em�̳� %�� �۾� �ϴ� �� */
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
		
		background: rgb(255,202,236); /* ��Ŷ�� �ȵǸ� ������ ���� */
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
		//ex) tr - ù��° tr�� 0��°
		//ex) :nth-child(1) - ù��°�� 1��° (������ psudo class)
		
		$("tr:first").css("background-color", "pink");
		$("tr:last").css("background-color", "pink");
		$("tr:odd").css("background-color", "lightyellow");		//0���� �����ϹǷ� 2��° ��=1 odd��
		
		// ���콺�� th�� over�Ǹ� red(Ŭ����)��� css ȿ���� ����
		$("th").on('mouseover', function(){
			//$(this).addClass('red');  //this->"th" �� �ڽ��� ȣ��, addClass�� �����Ƿ� css�� Ŭ������ �����س��� ��
			$(this).toggleClass('red');
		});
		
		// ���콺�� th���� out�Ǹ� red��� css ȿ���� ������
		$("th").on('mouseout', function(){
			$(this).removeClass('red');
		});
		
	});
	
</script>


</head>
<body>
	<table>
		<tr>
			<th class="col1">�Խù���ȣ</th>
			<th class="col2">����</th>
			<th class="col3">�ۼ���</th>
			<th class="col4">��ȸ��</th>
		</tr>
		
		
		<!-- ����ڰ� �ۼ��� �Խñ��� ���� ����غ����� -->
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
					for(int i = currentPage-3; i<currentPage+3; i++ ){	/* ���� �������� ��3�� ��3�� ������ �Ϸ��� */
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
				<a href="write.jsp"><input type="button" value="���" class="regBtn"/></a>
			</td>
		</tr>
		
	</table>
	
	
	
</body>
</html>