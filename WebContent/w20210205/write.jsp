<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>write.jsp</title>
<style type="text/css">
	#container {
		margin: 0 auto;
		width: 400px;
		border: 1px solid black;
	}
	
	#top {
		text-align: center;
		border-bottom: 1px dotted darkgray;
		
		text-shadow: 2px 2px 4px rgba(255,255,255,0.78);
		
		
		background: rgb(255,202,236); /* 웹킷이 안되면 동작할 것임 */
        background: linear-gradient(0deg, rgba(255,202,236,1) 0%, rgba(233,189,255,1) 49%, rgba(179,164,224,1) 88%);
	}
	
	#writer, #title {margin-left: 20px;}
	
	#contents, #button {margin-left: 70px;}
	
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
	<form action="writeOk.jsp">
		<div id="container">
			<div id="top">
				<h3>하고 싶은 얘기가 있나요?</h3>
			</div>
			<div id="writer">
				<p>
					<span>WRITER : </span>
					<input type="text" name="wr" id="wr">
				</p>
			</div>
			<div id="title"> 
				<p>
					<span>TITLE : </span>
					<input type="text" name="ti" id="ti">
				</p>
			</div>
			<div id="contents">
				<p>
					<textarea name="ct" id="ct" rows="20" cols="35"></textarea>
				</p>
			</div>
			<div id="button">
				<p>
					<input class="btn" type="button" value="목록보기">
					<input class="btn" type="submit" value="작성하기">
					<input class="btn" type="reset" value="다시쓰기">
				</p>
			</div>
		</div>
	</form>
	
</body>
</html>