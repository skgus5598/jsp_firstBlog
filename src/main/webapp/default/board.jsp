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
.wrap {	width: 1040px;	margin: auto;}
.table { border: 1px solid purple; width: auto; background-color: yellow; }
button {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 15px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
		}
button:hover{background-color: rgb(255,200,255); }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="wrap">
	<h1 style="text-align: center; margin-top: 20px;">전체 게시글 보기</h1><br>
	<table border='1' class="table" >
		<tr>
			<th>번호</th><th>제 목 </th><th>글쓴이</th><th>날짜</th><th>조회수</th>
		</tr>
		<tr>
			<th>번호</th><th>제 목 </th><th>글쓴이</th><th>날짜</th><th>조회수</th>
		</tr>	
	</table>
	<hr><br>
	<button onclick="location.href='${contextPath}/board/writeForm.jsp'">글쓰기</button>
	
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>