<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<c:if test="${principal.user.id eq 21}"> <!-- bear를 admin 계정으로 설정 -->
		<button id="btn-Ndelete" class="btn btn-danger">삭제</button>
		<a href="/notice/${notice.id}/noticeUpdateForm" class="btn btn-warning">수정</a>
	</c:if>
<div>
<br /><br />
<div>
	글 번호 : <span id="id"><i>${notice.id }</i></span>
	작성자 : <span><i>${notice.users.username }</i></span>
	작성일시 : <span>${notice.createDate }</span>
</div>

	<h3>${notice.title}</h3>
</div>
	<hr />
<div>
	<div>${notice.content}</div>
</div>
<hr />


</div>

<script type="text/javascript" src="/js/notice.js"></script>
<%@ include file="../layout/footer.jsp"%>