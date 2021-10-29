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

.right-one{padding-left: 15%; padding-top: 20px;}
.right-table td,th{padding-top: 15px; padding-bottom: 15px; 
	padding-left: 10px; padding-right: 10px;}
.right-table td{ border-bottom: 1px dotted black; }
.backBtn{
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 5px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
	}	
	.button {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 5px;
			background-color: white; color: black;
			text-align:center;	
			border-color:white;
		}

	.replyBtn{
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 5px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
	}
</style>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/default/header.jsp"></jsp:include>
<jsp:useBean id="dao" class="board.dao.BoardDAO"></jsp:useBean>
<c:set var="d" value="${dao.contentView(param.id) }"/>

	<div class="wrap">
		<div class="right-one">
		<c:choose>
			<c:when test=""></c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
		
		<form method="post" name="form">
			<table border='1' class="right-table" >
			     <tr>
					<td>No.</td>
					<td>
						<input style="border: white;" name="id" value="${d.id }" readonly>
						<input  type="hidden" name="idgroup" >
						<input  type="hidden" name="step" >
						<input  type="hidden" name="indent" >
						<input  type="hidden" name="name" >
					</td>
				</tr>
				<tr>	<td>Clicked</td><td>${d.hit }</td></tr>
				<tr>	<td>User</td><td>${d.name }</td></tr>
				<tr>
					<td>Title</td>
					<td>
						<c:choose>
							<c:when test="${loginUser == d.name }">
								<input style="width:410px; height:20px;" type="text" name="title" value="${d.title }">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="title">${d.title }
							</c:otherwise>
						</c:choose>						
					</td>
				</tr>
				<tr>
					<td>Content</td>
						<c:choose>
							<c:when test="${loginUser == d.name }">
								<td><textarea rows="20" cols="50" name="content" >${d.content }</textarea></td>
							</c:when>
							<c:otherwise>
								<td><textarea rows="20" cols="50" name="content"  readonly>${d.content }</textarea></td>
							</c:otherwise>
						</c:choose>					
				</tr>
				<tr>
					<td colspan="2">
						<label>Comment</label><br>
						<textarea rows="5" cols="60" name="content"  placeholder="댓글을 남겨보세요"></textarea>
					</td>						
				</tr>
				<tr>
					<td colspan="2">
						<input class="backBtn" type="button" value="Back" onclick="location.href='${contextPath}/board/boardList.jsp'">			
						<c:if test="${loginUser == d.name }">						
							<input class="button" type="submit" value="Modify" onclick="javascript: form.action='modify_delete.jsp'" name="btn1" >
							<input class="button" type="submit" value="Delete" onclick="javascript: form.action='modify_delete.jsp'" name="btn2"  >
						</c:if>
						<input class="replyBtn" type="submit" value="Reply" onclick="javascript: form.action='reply.jsp'">
					</td>
				</tr>				
		</table>
		</form>
		</div>
</div>
<jsp:include page="/default/footer.jsp"></jsp:include>
</body>
</html>