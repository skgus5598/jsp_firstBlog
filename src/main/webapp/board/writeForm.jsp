<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />        
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {margin: 0;}
.wrap {	width: 1040px;	margin: auto;}
.header {	text-align: center;	padding-top: 30px;	padding-bottom: 30px;}
.button {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 15px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
			 margin-left: 500px;
		}
.button:hover{background-color: rgb(255,200,255);}
</style>
</head>
<body>
<div class="wrap">
	<div class="header">
		<h1 style="font-size: 50px; margin-bottom: 30px;">PAge</h1>	
		<form action="#" method="post">
			<textarea rows="2" cols="70" placeholder="제목을 적어주세요"></textarea><br>
			<textarea rows="20" cols="70" placeholder="내용을 입력하세요"></textarea><br>
			<input class="button" type="submit" value="done">
			<input class="button" type="button" value="back" onclick="location.href='${contextPath}/default/board.jsp'">
			
		</form>
		


	</div>
</div>

</body>
</html>