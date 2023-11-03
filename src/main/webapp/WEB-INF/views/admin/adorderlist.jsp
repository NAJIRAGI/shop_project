<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 리스트</h1>
			<table class="table table-hover">
				<thead>
					<tr>						
						<th>주문번호</th>
						<th>주문고객</th>
						<th>상품명</th>
						<th>주문금액</th>
						<th>주문수량</th>					
						<th>주문일자</th>
						<th>배송상태</th>						
					</tr>
				</thead>
				<tbody>						
					<c:forEach var="order" items="${orders.content}">
						<tr>							
							
							<td>${order.id}</td>
							<td>${order.user.username}</td>
							<td>${order.orderTitle}</td>
							<td>${order.totalprice}</td>
							<td>${order.qty}</td>
							<td><fmt:parseDate value="${order.regTime}" pattern="yyyy-MM-dd" var="parsedDateTime" type="both"/>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/></td>
							<td><b>${order.status}</b></td>	
							<td><div class="col-sm-offset-2 col-sm-10" style="width: 120px;">
						<a href="adorderDetail/${order.id}"><button class="btn btn-secondary" type="button">상세보기</button></a>
					</div></td>			
						</tr>															
					</c:forEach>
				</tbody>
			</table>		
		</div>
		<!-- class = row -->
	</div>
<%@ include file="../layout/footer.jsp"%>