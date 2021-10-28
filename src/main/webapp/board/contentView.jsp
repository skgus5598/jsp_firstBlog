<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
	.button1 {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 5px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
			margin-left: 200px;
		}
	.button2 {
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
<jsp:include page="/default/header.jsp"></jsp:include>
<jsp:useBean id="dao" class="board.dao.BoardDAO"></jsp:useBean>
<c:set var="d" value="${dao.contentView(param.id) }"/>

	<div class="wrap">
		<div class="right-one">
		<form action="modify.jsp">
			<table border='1' class="right-table" >
			     <tr>
					<td>No.</td><td><input style="border: white;" name="id" value="${d.id }" readonly></td>
				</tr>
				<tr>
					<td>Clicked</td><td>${d.hit }</td>
				</tr>
				<tr>
					<td>User</td><td>${d.name }</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>
						<c:if test="${loginUser == d.name }">
							<input style="width:410px; height:20px;" type="text" name="title" value="${d.title }">
						</c:if>
						<c:if  test="${loginUser != d.name }">
							${d.title }
						</c:if>
					</td>
				</tr>
				<tr>
					<td>Content</td>
						<c:if test="${loginUser == d.name }">
							<td><textarea rows="20" cols="50" name="content" >${d.content }</textarea></td>
						</c:if>
						<c:if  test="${loginUser != d.name }">
							<td><textarea rows="20" cols="50"  readonly>${d.content }</textarea></td>
						</c:if>
				</tr>
				<tr>
					<td colspan="2">
						<input class="backBtn" type="button" value="Back" onclick="location.href='${contextPath}/board/boardList.jsp'">
						<c:if test="${loginUser == d.name }">						
							<input class="button1" type="submit" value="Modify" >
							<input class="button2" type="button" value="Delete" onclick="location.href='${contextPath}/board/boardList.jsp'">
						</c:if>
					</td>
				</tr>				
		</table>
		</form>
		</div>
</div>
<jsp:include page="/default/footer.jsp"></jsp:include>
</body>
</html>