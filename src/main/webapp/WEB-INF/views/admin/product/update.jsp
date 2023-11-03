<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<div class="container">
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" id="productId" value="${product.productId}"/>
		<p>상품 수정</p>
		<div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">판매 상태</span>
				</div>
				<input type="number" class="form-control" min=0 max=1
					placeholder="Enter Product-Status" id="prodStatus" value="${product.prodStatus}">
			</div>
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품코드</span>
			</div>
			<input type="text" class="form-control" placeholder="Enter Product-Code" id="productId" value="${product.productId}">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품명</span>
			</div>
			<input type="text" class="form-control" placeholder="Enter Product-Name" id="productName" value="${product.productName}">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품가격</span>
			</div>
			<input type="number" class="form-control" placeholder="Enter Price" id="price" value="${product.price}">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상품수량</span>
			</div>
			<input type="number" class="form-control" placeholder="Enter Stock" id="stock" value="${product.stock}">
		</div>
		<p/>		
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">원산지</span>
			</div>
			<input type="number" class="form-control" placeholder="Enter origin" id="origin" min="0" max="1" value="${product.origin}">
		</div>
		<p/>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">제철날짜</span>
			</div>
			<input type="number" class="form-control" placeholder="Enter Season" id="season" min="0" max="4" value="${product.season}">
		</div>
		<p/>	
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">상세내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" id="productDetail">${product.productDetail}</textarea>
		</div>
		<p/>
			<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">추천도</span>
			</div>
			<input type="number" class="form-control" placeholder="Enter Recommend" id="recommend" min="0" max="5" value="${product.recommend}">
		</div>
		<p/>	
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">이미지</span>
			</div>
			<input type="text" class="form-control" placeholder="Enter Img Path" id="imgup" value="${product.prodImgPath}">
		</div>
		<p/>
		
	</form>
	<button id="btn-modify" class="btn btn-primary">저장</button>
</div>
<br />
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../../layout/footer.jsp"%>