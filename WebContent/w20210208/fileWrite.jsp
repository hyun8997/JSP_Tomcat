<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileWrite.jsp</title>
<style type="text/css">
	table {margin: 0 auto;}
	table, tr, th, td { border: 1px solid black;}

</style>

</head>
<body>
	<!-- 파일 전송(업로드) 기능 구현 -->
	
	<form action="fileWriteOk.jsp" method="post" enctype="multipart/form-data">		<!-- post는 id pw 등 가릴때 쓰고 받는 방식 따로 있음 -->
		<table>																		<!-- enctype="multipart/form=data"는 파일 받게 하려고 하는 것 -->
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" id="" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents" id="" cols="40" rows="10"/></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="fileName" id="" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전송" />
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>