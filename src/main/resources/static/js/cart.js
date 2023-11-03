let index = {
	init: function() {
		$("#btn-cart").on("click", () => {
			this.cartIn();
		});
		$("#btn-delcart").on("click", () => {
			this.deleteByIdcart();
		});
		$("#btn-delcartAll").on("click", () => {
			this.deleteByAllcart();
		});		
	},

	cartIn: function() {
		let productId = $("#productId").val();
		console.log(productId)
		let data = {
			count: $("#count").val(),
		};
		console.log(data.count)

		$.ajax({
			type: "POST",
			url: "/api/board/orderDetail/" + productId,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("장바구니에 등록 완료");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error))
		});
	},
	
	deleteByIdcart: function() {
		let pdId = $("input[name='buy']:checked");
		let pdIds = "";
		
		pdId.each(function (index){
			if(pdIds == ""){
				pdIds = $(this).val();
			}else {
				pdIds += "," + $(this).val();
			}
		});
		let data={
			pdIds : pdIds
		};
		$.ajax({
			type:"DELETE",
			url:"/api/order/deleteById",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"			
		}).done(function(resp){
			alert("삭제 완료");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		
	},
	
	deleteByAllcart: function() {
		let pdId = $("input[name='buy']");
		let pdIds = "";
		
		pdId.each(function (index){
			if(pdIds == ""){
				pdIds = $(this).val();
			}else {
				pdIds += "," + $(this).val();
			}
		});
		let data={
			pdIds : pdIds
		};
		$.ajax({
			type:"DELETE",
			url:"/api/order/deleteAll",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"			
		}).done(function(resp){
			alert("삭제 완료");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		
	},
}
index.init();

let basket = {
	totalCount: 0,
	totalPrice: 0,	
	//재계산
	reCalc: function() {
		this.totalCount = 0;
		this.totalPrice = 0;
		document.querySelectorAll(".p_num").forEach(function(item) {
			if (item.parentElement.parentElement.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.firstElementChild.checked == true) {
				var count = parseInt(item.getAttribute('value'));				
				this.totalCount += count;
				var price = item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.firstElementChild.getAttribute('value');
				this.totalPrice += count * price;
			}
		}, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
	},
	//화면 업데이트
	updateUI: function() {		
		document.querySelector('#sum_p_price').textContent = this.totalPrice.formatNumber() + '원';		
	},
	//개별 수량 변경
	changePNum: function(pos) {
		var item = document.querySelector('input[name=p_num' + pos + ']');
		var p_num = parseInt(item.getAttribute('value'));
		var newval = event.target.classList.contains('up') ? p_num + 1 : event.target.classList.contains('down') ? p_num - 1 : event.target.value;

		if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

		item.setAttribute('value', newval);
		item.value = newval;

		var price = item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.firstElementChild.getAttribute('value');		
		item.parentElement.parentElement.parentElement.nextElementSibling.firstElementChild.firstElementChild.textContent = (newval * price).formatNumber()   + "원";
//AJAX 업데이트 전송

		//전송 처리 결과가 성공이면    
		this.reCalc();
		this.updateUI();
	},
	checkItem: function() {
		this.reCalc();
		this.updateUI();
	},
	delItem: function() {
		event.target.parentElement.parentElement.parentElement.remove();
		this.reCalc();
		this.updateUI();
	}
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function() {
	if (this == 0) return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	return nstr;
};
