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
.navMain {padding-top: 20px;}
.navMain ul {	display: flex;	justify-content: flex-end}
.navMain li {
	list-style: none;
	padding-left: 20px;
	padding-right: 30px;
	text-shadow: 13px 10px 20px grey;
}
.navMain ul li a {	text-decoration: none;	color: rgba(239,175,255,0.9);}
.navMain ul li a:hover {
	color: purple;
	border-bottom: 1px double purple;
	transition: all 0.25s;
}	
</style>
</head>
<body>

<div class="wrap">
	<div class="header">
			<h1 style="font-size: 50px;">PAge</h1>
			<nav class="navMain">
				<ul>
					<li><a href="${contextPath }/default/home.jsp">HOME</a></li>
					<li><a href="${contextPath }/default/introduce.jsp">INTRODUCE</a></li>
					<li><a href="${contextPath }/board/boardList.jsp">BOARD</a></li>
					<li><a href="${contextPath }/default/memberList.jsp">MEMBER LIST</a></li>					
					<c:choose>
						<c:when test="${loginUser == null }">
							<li><a href="${contextPath }/default/loginPage.jsp">LOGIN</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${contextPath }/default/logoutPage.jsp">LOGOUT</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
</div>
</body>
</html>