<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br><br><br>
<div class="container">
	<form>
		<input type="hidden" id="id" value="${board.id}"/>
		<div class="form-group">
			<input value="${board.title}" type="text" class="form-control"
			placeholder="enter title" id="title">
		</div>
		<div class="form-group">
			<textarea rows="5" class="form-control summernote" id="content">${board.content}</textarea>
		</div>
	</form>
	<button id="btn-update" class="btn btn-primary">수정</button>
</div>
<br/>
<script>
	$('.summernote').summernote({
		tabsize : 2,
		height : 300
	})
</script>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>
