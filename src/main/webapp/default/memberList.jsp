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

<c:choose>
	<c:when test="${loginUser  == null }">
		<script type="text/javascript">
			alert('로그인 먼저 진행하세요 ')
			location.href="${contextPath}/default/loginPage.jsp"
		</script>
	</c:when>
	<c:otherwise>
		<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
		<c:set var="memberList" value="${dao.member_view() }"/>
		<div class="wrap">
		<h1>모든 회원 정보 </h1>
		<c:forEach var="d" items="${memberList }">						
				<hr><br>			
				아이디 :  ${d.id }<br>
				이름 : ${d.name } <br>
				<c:if test="${loginUser == d.id }">
					<a class="detail2"  href="${contextPath }/default/memberView.jsp?id=${d.id}">정보 보기 </a>
				</c:if>
				<c:if test="${loginUser != d.id }">
					<a class="detail1"  href="${contextPath }/default/memberView.jsp?id=${d.id}">정보 보기 </a>
				</c:if>				
		</c:forEach>
	</div>
	</c:otherwise>
</c:choose>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>