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
${dao.modify(param.id, param.title, param.content) }
<%response.sendRedirect("boardList.jsp") ;%>
</body>
</html>