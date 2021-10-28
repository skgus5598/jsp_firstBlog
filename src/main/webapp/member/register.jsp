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

<%--
		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"));
		dto.setName(request.getParameter("id"));
		dto.setName(request.getParameter("pwd"));
		dto.setName(request.getParameter("addr"));
--%>
	<jsp:useBean id="dto" class="member.dto.MemberDTO"/>
	<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="result" value="${dao.insert_mem(dto) }" />
	
	<c:choose>
		<c:when test="${result ==1 }">
		<c:set var="loginUser" value="${param.userId }" scope="session"/>
			<script>
				alert("회원가입을 축하합니다!");
				location.href="../default/home.jsp"				
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("이미 존재하는 아이디 입니다. 또는 서버에 문제 발생!")
				location.href="../default/loginPage.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>