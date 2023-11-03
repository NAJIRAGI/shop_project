<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<!DOCTYPE html>
<html >
<div class="container">
	<form method="post" enctype="multipart/form-data">
		<h3>상품 등록</h3>
		<div class="form-group">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">판매 상태</span>
				</div>
				<input type="number" class="form-control" min=0 max=1
					placeholder="0은 판매중 1은 품절상태" id="prodStatus">
			</div>
		</div>

		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품코드</span>
			</div>
			<input type="text" class="form-control" placeholder="상품 코드를 입력해주세요" id="productId">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품명</span>
			</div>
			<input type="text" class="form-control" placeholder="상품 이름을 입력해주세요" id="productName">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품가격</span>
			</div>
			<input type="number" class="form-control" placeholder="상품 가격을 입력해주세요" id="price">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품수량</span>
			</div>
			<input type="number" class="form-control" placeholder="상품 재고수량을 입력해주세요" id="stock">
		</div>
		<p/>	
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">원산지</span>
			</div>
			<input type="number" class="form-control" placeholder="원산지 0은 국산 1은 수입산" id="origin" min="0" max="1">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">제철날짜</span>
			</div>
			<input type="number" class="form-control" placeholder="제철날짜 0은 봄 1은 여름 2는 가을 3은 겨울" id="season" min="0" max="4">
		</div>
		<p/>	
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">제품설명</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" id="productDetail"></textarea>
		</div>
		<p/>
			<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">추천도</span>
			</div>
			<input type="number" class="form-control" placeholder="추천하는 정도를 입력해주세요 1~5까지!" id="recommend" min="0" max="5">
		</div>
		<p/>	
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">이미지</span>
			</div>
			<input type="text" class="form-control" placeholder="상품 이미지 경로를 입력하세요" id="imgup">
		</div>
		<p/>
		
	</form>
	<button id="btn-insert" class="btn btn-primary">저장</button>
</div>
<br />
<script type="text/javascript" src="/js/product.js"></script>
</html>
<%@ include file="../../layout/footer.jsp"%>
