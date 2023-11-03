<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 리스트</h1>
			<table class="table table-hover">
				<thead>
					<tr>						
						<th>상품명</th>
						<th>주문금액</th>
						<th>주문수량</th>					
						<th>총 금액</th>							
					</tr>
				</thead>
				<tbody>						
					<c:forEach var="order" items="${orders}">
						<tr>						
							<td>${order.pdNms}</td>
							<td>${order.price}</td>
							<td>${order.qty}</td>					
							<td>${order.price * order.qty}</td>				
						</tr>				
					</c:forEach>
				</tbody>
			</table>			
		</div>
		<p style="text-align:right; font-weight:bold">합계금액 : ${orders.get(0).totalprice} 원</p>
		<p style="text-align:right; font-weight:bold">상품상태 : ${orders.get(0).status}</p>
		
		<input type="hidden" id="id" value="${orders.get(0).id}">
		<button id="btn-update1" class="btn btn-warning" type="button" value="주문확인">주문확인</button>
		<button id="btn-update2" class="btn btn-danger" type="button" value="주문취소">주문취소</button>
		<button id="btn-update3" class="btn btn-primary" type="button" value="배송중">배송중</button>
		<button id="btn-update4" class="btn btn-primary" type="button" value="배송완료">배송완료</button>
		<button class="btn btn-secondary" type="button" onclick="history.back()">뒤로가기</button>		
		<hr>
	</div>
	<script type="text/javascript" src="/js/order.js"></script>
<%@ include file="../layout/footer.jsp"%>