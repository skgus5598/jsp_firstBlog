<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dto" class="member.dto.MemberDTO" />
	<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
	<jsp:setProperty property="*"  name="dto"/>
	<c:set var="loginCheck" value="${dao.loginChk(dto) }"></c:set>
	<c:choose>
		<c:when test="${loginCheck.id == param.id }">
			<c:choose>
				<c:when test="${loginCheck.pwd == param.pwd }">		
					<c:set var="loginUser" value="${loginCheck.id }" scope="session"/> 		
					<script type="text/javascript">
						alert("로그인 성공!")						
						location.href="../default/home.jsp"
					</script>
				</c:when>			
			<c:otherwise>
				<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.")
					location.href="../default/loginPage.jsp"
				</script>
			</c:otherwise>	
			</c:choose>			
		</c:when>
	<c:otherwise>
			<script>
				alert("존재하지 않는 아이디 입니다.")
				location.href="../default/loginPage.jsp"
			</script>
	</c:otherwise>
	</c:choose>
	
</body>
</html>