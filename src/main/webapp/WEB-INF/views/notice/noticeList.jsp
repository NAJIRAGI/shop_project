<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">

<c:if test="${principal.user.id eq 21}">
<a href="/notice/noticeSaveForm" class="btn btn-dark">공지사항 작성</a>
</c:if>
<c:forEach var="notice" items="${notice.content}">
	<div class="card m-2">
		<div class="card-body">
			<h4 class="card-title">${notice.title }</h4>  
			<h6>작성자 : ${notice.users.username }</h6>
			<a href="/notice/${notice.id}" class="btn btn-primary">상세보기</a>

		</div>
	</div>
</c:forEach>

<ul class="pagination justify-content-center">
	<c:choose>
		<c:when test="${notice.first}">
			<li class="page-item disabled"><a class="page-link" href="?page=${notice.number-1}">PREVIOUS</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link" href="?page=${notice.number-1}">Previous</a></li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${notice.last}">
			<li class="page-item disabled"><a class="page-link" href="?page=${notice.number+1}">NEXT</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link" href="?page=${notice.number+1}">NEXT</a></li>
		</c:otherwise>
	</c:choose>
</ul>

</div>
<br />


<%@ include file="../layout/footer.jsp"%>