<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<br><br><br>
<div class="container">
	<form>
		<div class="form-group">
			<label for="title">TITLE</label>
			<input type="text" class="form-control" placeholder="Enter title" id="title">
		</div>
		
		<div class="form-group">
			<label for="content">CONTENT : </label>
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary">저장</button>

</div>
<br/>
<script>
	$('.summernote').summernote({
		tabsize : 2,
		height : 300,
		placeholder: '주문번호 :  <br>주문자명 : <br>환불계좌 : <br>예금주 :'
	})
</script>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>
