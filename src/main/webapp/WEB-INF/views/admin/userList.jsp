<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../layout/header.jsp"%>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
.row {
	margin-top: 40px;
	padding: 0 10px;
}

.clickable {
	cursor: pointer;
}

.panel-heading div {
	margin-top: -18px;
	font-size: 15px;
}

.panel-heading div span {
	margin-left: 5px;
}

.col-md-6 {
	width:100%;
}

.panel-body {
	display: none;
}
</style>
<script>
	/**
	 *   I don't recommend using this plugin on large tables, I just wrote it to make the demo useable. It will work fine for smaller tables 
	 *   but will likely encounter performance issues on larger tables.
	 *
	 *		<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
	 *		$(input-element).filterTable()
	 *		
	 *	The important attributes are 'data-action="filter"' and 'data-filters="#table-selector"'
	 */
	(function() {
		'use strict';
		var $ = jQuery;
		$.fn
				.extend({
					filterTable : function() {
						return this
								.each(function() {
									$(this)
											.on(
													'keyup',
													function(e) {
														$(
																'.filterTable_no_results')
																.remove();
														var $this = $(this), search = $this
																.val()
																.toLowerCase(), target = $this
																.attr('data-filters'), $target = $(target), $rows = $target
																.find('tbody tr');

														if (search == '') {
															$rows.show();
														} else {
															$rows
																	.each(function() {
																		var $this = $(this);
																		$this
																				.text()
																				.toLowerCase()
																				.indexOf(
																						search) === -1 ? $this
																				.hide()
																				: $this
																						.show();
																	})
															if ($target
																	.find(
																			'tbody tr:visible')
																	.size() === 0) {
																var col_count = $target
																		.find(
																				'tr')
																		.first()
																		.find(
																				'td')
																		.size();
																var no_results = $('<tr class="filterTable_no_results"><td colspan="'+col_count+'">No results found</td></tr>')
																$target
																		.find(
																				'tbody')
																		.append(
																				no_results);
															}
														}
													});
								});
					}
				});
		$('[data-action="filter"]').filterTable();
	})(jQuery);

	$(function() {
		// attach table filter plugin to inputs
		$('[data-action="filter"]').filterTable();

		$('.container').on('click', '.panel-heading span.filter', function(e) {
			var $this = $(this), $panel = $this.parents('.panel');

			$panel.find('.panel-body').slideToggle();
			if ($this.css('display') != 'none') {
				$panel.find('.panel-body input').focus();
			}
		});
		$('[data-toggle="tooltip"]').tooltip();
	})
</script>
<div class="container">
	<h1>Fruits의 소중한 고객들입니다.</h1>
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">고객명단</h3>
					<div class="pull-right">
						<span class="clickable filter" data-toggle="tooltip"
							title="Toggle table filter" data-container="body"> <i
							class="glyphicon glyphicon-filter"></i>
						</span>
					</div>
				</div>
				<div class="panel-body">
					<input type="text" class="form-control" id="dev-table-filter"
						data-action="filter" data-filters="#dev-table"
						placeholder="Filter Developers" />
				</div>
				<table class="table table-hover" id="dev-table">
					<thead>
						<tr>
							<th>#</th>
							<th>ID</th>
							<th>이름</th>
							<th>주소</th>
							<th>등급</th>
							<th>고객정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users.content}">
							<tr>
								<td>${user.id}</td>
								<td>${user.username}</td>
								<td>${user.name}</td>
								<td>${user.address}</td>
								<td>${user.roles}</td>
								<td><a href="/admin/userUpdate/${user.id}">수정</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<br />
<%@ include file="../layout/footer.jsp"%>