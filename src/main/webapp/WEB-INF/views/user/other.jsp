<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%@ include file="../layout/header.jsp"%>

<div class="text-center text-black">
	<h1 class="display-4 fw-bolder">과일로 만든 상품</h1>
	<p class="lead fw-normal text-black-50 mb-0">달콤한 잼부터 건강을 위한 즙까지!</p>
</div>
<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="prod" items="${products.content}">
				<c:if test="${prod.category == 1}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- 	<!-- Sale badge
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>  -->
							<!-- Product image-->
							<img class="card-img-top" src="../../${prod.prodImgPath}"
								alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${prod.productName}</h5>
									<!-- Product reviews-->
									<div
										class="d-flex justify-content-center small text-warning mb-2">
										<c:choose>
											<c:when test="${prod.recommend == 1}">
												<div class="bi-star-fill"></div>
											</c:when>
											<c:when test="${prod.recommend == 2}">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</c:when>
											<c:when test="${prod.recommend == 3}">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</c:when>
											<c:when test="${prod.recommend == 4}">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</c:when>
											<c:when test="${prod.recommend == 5}">
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
												<div class="bi-star-fill"></div>
											</c:when>
										</c:choose>
									</div>
									<!-- Product price-->
									<fmt:formatNumber value="${prod.price}" type="currency" />
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/cart/${prod.productId}/prodDetail">Add to cart</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>

			</c:forEach>
		</div>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>
