<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	
	<c:remove var="loginUser" scope="session"/>		
	<script>
			alert('로그아웃 성공! 세션 종료!')
			location.href="${contextPath}/default/home.jsp"
	</script>

<%--<c:redirect url="home.jsp"></c:redirect>  --%>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>