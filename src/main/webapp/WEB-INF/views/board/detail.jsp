<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
<br><br><br>
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<c:if test="${board.users.id==principal.user.id}">
		<button id="btn-delete" class="btn btn-danger">삭제</button>
		<a href="/board/${board.id}/updateForm" class="btn btn-warning">수정</a>
	</c:if>
<div>
<br /><br />
<div>
	글 번호 : <span id="id"><i>${board.id }</i></span>
	작성자 : <span><i>${board.users.username }</i></span>
	작성일시 : <span>${board.createDate }</span>
</div>
	<h3>${board.title}</h3>
</div>
	<hr />
<div>
	<div>${board.content}</div>
</div>
<hr />


<c:if test="${board.users.id==principal.user.id || principal.user.id eq 21}">

<div class="card">
	<form>
	<input type="hidden" id="boardId" value="${board.id}"/>
	<div class="card-body">
		<textarea id="reply-content" class="form-control" rows="1"></textarea>
	</div>
	<div class="card-footer">
		<button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
	</div>
	</form>
</div>


<div class="card">
	<div class="card-header">A:</div>
	<ul id="reply--box" class="list-group">
		<c:forEach var="reply" items="${board.replys}">	
		<li id="reply--1" class="list-group-item d-flex">

		<div class="font-italic" >		
		<div>${reply.content}</div>
		<br>
		작성자 : ${reply.users.username } 작성일시 : ${reply.createDate} </div>
		</li>
		</c:forEach>
	</ul>
</div>
</c:if>

</div>
<br />
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>