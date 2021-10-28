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
.wrap {	width: 1040px;	margin: auto;}
.button {
			margin-top:20px;
			padding: 7px 25px; /*좌우 / 위아래 */
			border-radius: 5px;
			background-color: black; color: white;
			text-align:center;	
			border-color:white;
		}
.button:hover{background-color: rgb(255,200,255); }

.right-one{padding-left: 15%; padding-top: 20px;}
.right-table td,th{padding-top: 15px; padding-bottom: 15px; 
	padding-left: 10px; padding-right: 10px;}
.right-table tr:hover{transition:all 0.15s; background-color: rgba(255,255,212,0.5);}
.right-table td{ border-bottom: 1px dotted black; }
.firstTr{background-color: rgb(255,255,212);}
a{text-decoration: none; color:green;}

</style>
</head>
<body>
<jsp:include page="../default/header.jsp"></jsp:include>
<jsp:useBean id="dao" class="board.dao.BoardDAO"></jsp:useBean>
<div class="wrap">
	<div class="right-one">			
			<table border='1' class="right-table" >
			      <tr class="firstTr">
			        <th>No.</th>
			        <th>User</th>			        
			        <th>Title</th>		
			        <th>Clicked</th>		
			        <th>Date</th>		
			        <th>IdGroup</th>		
			        <th>Step</th>		
			        <th>Indent</th>		
			      </tr>
			      
			      <c:forEach var="dto" items="${dao.list() }">			      
				      <tr>
				        <td>${dto.id }</td>
				        <td>${dto.name }</td>
				        <td><a  href="contentView.jsp?id=${dto.id }">${dto.title }</a></td>	
				        <td>${dto.hit }</td>	        
				        <td>${dto.savedate }</td>	 			      
				        <td>${dto.idgroup }</td>	   
				        <td>${dto.step }</td>	   
				        <td>${dto.indent }</td>	  			          			          
				      </tr>
			     </c:forEach>
			     
			     <tr>
			     	<c:choose>
			     		<c:when test="${loginUser != null }">
			     		<td colspan="8"><a class="button" href="writeForm.jsp" >Write From</a></td>
			     		</c:when>
			     		<c:otherwise>
			     		<td colspan="8"><a class="button" href="${contextPath }/default/loginPage.jsp">Login First</a></td>
			     		</c:otherwise>
			     	</c:choose>
			     </tr>
			     
			  </table>
			</div>	
</div>
<jsp:include page="../default/footer.jsp"></jsp:include>
</body>
</html>