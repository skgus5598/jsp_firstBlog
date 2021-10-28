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
<jsp:include page="header.jsp"></jsp:include>
session : ${loginUser }
	
	<jsp:useBean id="dao" class="member.dao.MemberDAO"></jsp:useBean>
	<jsp:useBean id="dto" class="member.dto.MemberDTO"></jsp:useBean>
	<c:set var="d" value="${dao.member_info(param.userId) }"/>	
		<div class="wrap">
			<hr><br>			
			아이디 :  ${d.userId }<br>
			비밀번호 : ${d.pwd }<br>
			이름 : ${d.name } <br>
			이메일 : ${d.addr }<br>
			<input type="button" value="뒤로가기 " onclick="location.href='memberList.jsp'">
			<hr>
			<c:if test="${loginUser == param.userId }">
				<button class="button" onclick="location.href='${contextPath }/member/modify.jsp?userId=${d.userId}'">수정</button>
				<button class="button" onclick="location.href='${contextPath }/member/delete.jsp?userId=${d.userId}'">삭제</button>
			</c:if>
		</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>