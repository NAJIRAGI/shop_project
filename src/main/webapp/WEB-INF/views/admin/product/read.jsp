<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<html xmlns:th="http://www.thymeleaf.org">
<div class="container admin_container">
	<div class="row">
		<h1>상품 리스트</h1>
		<form>
			<div>
				<label>판매 상태 : </label> 
					<span> 
						<c:choose>
							<c:when test="${product.prodStatus == 0}">판매중</c:when>
							<c:otherwise>품절</c:otherwise>
						</c:choose>
					</span>
			</div>
			<div>
				<label>상품 코드 : </label> 
					<span id="productId">${product.productId}</span>
			</div>
			<div>
				<label>상품명 : </label> 
					<span>${product.productName}</span>
			</div>
			<div>
				<label>상품 가격 : </label> 
					<span><fmt:formatNumber	value="${product.price}" type="currency"/></span>
			</div>
			<div>
				<label>재고 수량 : </label> 
					<span>${product.stock}</span>
			</div>
			<div>
				<label>상품 설명 : </label>
					<span>${product.productDetail}</span>
			</div>
			<div>
				<label>상품 이미지</label>
				<br>
				<img src="../../../${product.prodImgPath}" width="150" height="150">
			</div>
			<div>
				<a href="/admin/product/${product.productId}/update"
					class="btn btn-warning">수정</a>
				<button type="button" id="btn-delete" class="btn btn-danger">삭제</button>
			</div>
		</form>
	</div>
	<!-- class = row -->
</div>
</html>
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../../layout/footer.jsp"%>