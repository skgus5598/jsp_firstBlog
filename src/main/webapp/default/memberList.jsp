<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />        
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap {	width: 1040px;	margin: auto; }
	.button {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 15px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
		}
	.button:hover{background-color: rgb(255,200,255); }
	.detail1{text-decoration: none; background-color: highlight; color:green}
	.detail2{text-decoration: none; background-color: black; color:yellow}
	
</style>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="header.jsp"></jsp:include>
session : ${loginUser }
		<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
		<c:set var="memberList" value="${dao.member_view() }"/>
		<div class="wrap">
		<h1>모든 회원 정보 </h1>
		<c:forEach var="d" items="${memberList }">						
				<hr><br>			
				아이디 :  ${d.userId }<br>
				<c:if test="${loginUser != null }">
					이름 : ${d.name } <br>
					<c:choose>
						<c:when test="${loginUser == d.userId }">
							<a class="detail2"  href="${contextPath }/default/memberView.jsp?userId=${d.userId}">정보 보기 </a>
						</c:when>
						<c:otherwise>
							<a class="detail1"  href="${contextPath }/default/memberView.jsp?userId=${d.userId}">정보 보기 </a>
						</c:otherwise>
					</c:choose>				
				</c:if>				
		</c:forEach>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>