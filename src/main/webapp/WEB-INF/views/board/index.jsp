<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
<br><br><br>
<a href="/board/saveForm" class="btn btn-dark">문의글작성</a>


<c:forEach var="board" items="${boards.content}">
<c:if test="${board.users.id==principal.user.id || principal.user.id eq 21}">
	<div class="card m-2">
		<div class="card-body">
			<h4 class="card-title"><a href="/board/${board.id}"> ${board.title}</a></h4>
			<h6>작성자 : ${board.users.username }</h6>
			<c:if test="${!empty board.replys }">
			<br>
			<div class="alert alert-success" role="alert">
				답변 완료
			</div>
			</c:if>
			<c:if test="${empty board.replys }">			
			<br>
			<div class="alert alert-danger" role="alert">
				답변 준비중입니다.
			</div></c:if>

		</div>
	</div>
</c:if>
</c:forEach>




</div>
<br />


<%@ include file="../layout/footer.jsp"%>
