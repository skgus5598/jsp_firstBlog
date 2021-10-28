<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />        
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_save</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="board.dao.BoardDAO"/>
${dao.writeSave(param.name, param.title, param.content) }
<c:redirect url="boardList.jsp"></c:redirect>

</body>
</html>