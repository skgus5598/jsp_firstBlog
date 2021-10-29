<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />        
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:useBean id="dao" class="board.dao.BoardDAO"></jsp:useBean>

<c:choose>
	<c:when test="${param.btn1 != null }">
		${dao.modify(param.id, param.title, param.content) }
		<c:redirect url="boardList.jsp"></c:redirect>
	</c:when>
	<c:otherwise>
		${dao.delete(param.id) }
		<c:redirect url="boardList.jsp"></c:redirect>
	</c:otherwise>
</c:choose>


</body>
</html>