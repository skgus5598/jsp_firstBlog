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
<jsp:include page="../default/header.jsp"></jsp:include>
<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
	${dao.delete_mem(param.id) }
	<script>
		alert("${param.id} 삭제가 완료되었습니다.");
		location.href="${contextPath}/default/memberList.jsp";
	</script>


	
	
<jsp:include page="../default/footer.jsp"></jsp:include>
</body>
</html>