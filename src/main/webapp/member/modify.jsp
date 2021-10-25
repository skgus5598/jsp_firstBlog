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
<style>
.button {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 15px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
		}
	.button:hover{background-color: rgb(255,200,255); }
</style>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="../default/header.jsp"></jsp:include>
<jsp:useBean id="dto" class="member.dto.MemberDTO"/>
<jsp:useBean id="dao" class="member.dao.MemberDAO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="mem" value="${dao.member_info(param.id) }"/>

<form action="${contextPath }/member/modify_save.jsp" method="post">
	<input type="hidden" name="id" value="${mem.id }">
	아이디 : <label>${param.id }</label>	<br>
	비밀번호 : <input type="text" name="pwd" value="${mem.pwd }"><br>
	이름 : <input type="text" name="name" value="${mem.name }"><br>
	이메일 : <input type="text" name="addr" value="${mem.addr }"><br>
	<input class="button" type="submit" value="수정하기">
</form>	
	
	
<jsp:include page="../default/footer.jsp"></jsp:include>
</body>
</html>