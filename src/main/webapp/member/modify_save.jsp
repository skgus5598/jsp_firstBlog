<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dto" class="member.dto.MemberDTO"/>
<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
<jsp:setProperty property="*" name="dto"/>
	${dao.modify_mem(dto) }
	<script type="text/javascript">
		alert("수정 성공!");
		location.href="${contextPath }/default/memberList.jsp"
	</script>
	

</body>
</html>