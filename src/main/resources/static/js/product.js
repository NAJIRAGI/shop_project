let index={
	init: function() {
		$("#btn-insert").on("click",()=>{
			this.insert();
		});	
		$("#btn-modify").on("click",()=>{
			this.modify();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteById();
		});		
	},	
		
	insert: function() {
		let data={
			productStatus: $("#productStatus").val(),
			productId: $("#productId").val(),
			productName: $("#productName").val(),
			price: $("#price").val(),
			stock: $("#stock").val(),
			origin: $("#origin").val(),
			season: $("#season").val(),
			recommend: $("#recommend").val(),
			productDetail: $("#productDetail").val(),
			prodImgPath: $("#imgup").val()
						
		};
		console.log("국산 수입 여부 : " + data.origin)
		console.log("계절 : " + data.season)
		console.log("이미지 경로"+data.prodImgPath)
		$.ajax({
			type:"POST",
			url:"/api/insert",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("상품 등록 완료");
			location.href="/admin/adminForm";
		}).fail(function(error) {
			alert(JSON.stringify(error))
		});
	},
	
	
	modify: function() {
	
		let productId = $("#productId").val();
	
		
		let data={
			productStatus: $("#productStatus").val(),
			productId: $("#productId").val(),
			productName: $("#productName").val(),
			price: $("#price").val(),
			stock: $("#stock").val(),
			origin: $("#origin").val(),
			season: $("#season").val(),
			recommend: $("#recommend").val(),
			productDetail: $("#productDetail").val(),
			prodImgPath: $("#imgup").val()
			
		};		
		
		console.log("이미지 경로"+data.prodImgPath)
	
		$.ajax({
			type:"PUT",
			url:"/api/admin/product/read/" + productId,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp) {
			alert("수정 완료");
			location.href="/admin/adminForm";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function() {
		let productId = $("#productId").text();
		console.log(productId);
		$.ajax({
			type:"DELETE",
			url:"/api/admin/product/read/" + productId,
			contentType:"application/json; charset=utf-8",
			dataType:"json"			
		}).done(function(resp){
			alert("삭제 완료");
			location.href="/admin/adminForm";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	
}
index.init();

