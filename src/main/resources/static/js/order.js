let index1 = {
	init1: function() {
		$("#btn-order").on("click", () => {
			this.order();
		});
		$("#btn-update1").on("click",()=>{
			this.update1();
		});
		$("#btn-update2").on("click",()=>{
			this.update2();
		});
		$("#btn-update3").on("click",()=>{
			this.update3();
		});
		$("#btn-update4").on("click",()=>{
			this.update4();
		});
	},
	
	order: function() {
		var pdId = $("input[name='buy']:checked");
		var pdIds = "";
		var qty = "";
		
		
		pdId.each(function (index){
			if(pdIds == ""){
				pdIds = $(this).val();
				let id = $(this).val();
				qty = $("#p_num" + id).val();
			} else {
				pdIds += "," + $(this).val();
				let id = $(this).val();
				qty += "," + $("#p_num" + id).val();
			}
			
		});
		
		let data = {
			pdIds : pdIds,
			qty : qty,
			totalprice : $("#sum_p_price").text(),
		};	
		
		$.ajax({
			type:"POST",
			url:"/api/order",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("구매 완료");
			location.href="/";
		}).fail(function(error) {
			alert(JSON.stringify(error))
		});
	},
	
	update1: function(){
		var id=$("#id").val();
		let data={
			status: $("#btn-update1").val()       
		};
		$.ajax({
			type:"PUT",
			url:"/api/order/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("주문상태를 "+$("#btn-update1").val()+"로 변경했습니다.");
			location.href="/admin/adorderlist";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update2: function(){
		var id=$("#id").val();
		let data={
			status: $("#btn-update2").val()       
		};
		$.ajax({
			type:"PUT",
			url:"/api/order/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("주문상태를 "+$("#btn-update2").val()+"로 변경했습니다.");
			location.href="/admin/adorderlist";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update3: function(){
		var id=$("#id").val();
		let data={
			status: $("#btn-update3").val()       
		};
		$.ajax({
			type:"PUT",
			url:"/api/order/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("주문상태를 "+$("#btn-update3").val()+"로 변경했습니다.");
			location.href="/admin/adorderlist";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update4: function(){
		var id=$("#id").val();
		let data={
			status: $("#btn-update4").val()       
		};
		$.ajax({
			type:"PUT",
			url:"/api/order/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("주문상태를 "+$("#btn-update4").val()+"로 변경했습니다.");
			location.href="/admin/adorderlist";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
}
index1.init1();