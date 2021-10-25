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
.img {height:675px; margin-bottom: 50px; }
.img img{width:1040px; height:600px; padding-top: 70px;}
.table{text-align: center; width:900px;
	margin: auto} /*margin:auto 테이블을 화면 가운데로 정렬해줌  */
.table img{width:120px; padding-top:10px; }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="wrap">
	<div class="img">
				<img src="../img/back.png">
			</div><br>
			<table class="table">
				<tr>
					<td><img src="../img/5.png"></td>					
					<td><img src="../img/6.png"></td>
					<td><img src="../img/7.png"></td>
					<td><img style="height:100px;" src="../img/8.png"></td>
				</tr>				
				<tr >
					<td>
						<label><b>LOUNGE BAR</b></label><br>
						Have some rest after a long day, chill in one of our lounge zones
					</td>
					<td>
						<label><b>CINEMA</b></label><br>
						Watch the most popular movies with your family and friends
					</td>
					<td>
						<label><b>MAKE-UP</b></label><br>
						Watch the most popular movies with your family and friends
					</td>
					<td>
						<label><b>CAFE/DINING</b></label><br>
						Have some fun and ply bowling in a small group of large company
					</td>
				</tr>			
			</table>
			
			<hr style="color:grey; margin-top: 15px; width:800px; margin-left: 100px;">
				<table class="table"><br>
				<tr>
					<td><img src="../img/5.png"></td>					
					<td><img src="../img/6.png"></td>
					<td><img src="../img/7.png"></td>
					<td><img style="height:100px;" src="../img/8.png"></td>
				</tr>				
				<tr >
					<td>
						<label><b>LOUNGE BAR</b></label><br>
						Have some rest after a long day, chill in one of our lounge zones
					</td>
					<td>
						<label><b>CINEMA</b></label><br>
						Watch the most popular movies with your family and friends
					</td>
					<td>
						<label><b>MAKE-UP</b></label><br>
						Watch the most popular movies with your family and friends
					</td>
					<td>
						<label><b>CAFE/DINING</b></label><br>
						Have some fun and ply bowling in a small group of large company
					</td>
				</tr>			
			</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>