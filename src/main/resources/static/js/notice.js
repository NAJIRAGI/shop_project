 let index={
	init: function(){
		$("#btn-Nsave").on("click",()=>{
			//화살표 함수사용 이유: this를 바인딩하기 위해 사용
			this.save();
		});
		$("#btn-Ndelete").on("click",()=>{
			//화살표 함수사용 이유: this를 바인딩하기 위해 사용
			this.deleteById();
		});
		$("#btn-Nupdate").on("click",()=>{
			//화살표 함수사용 이유: this를 바인딩하기 위해 사용
			this.update();
		});
	},
	save: function(){
		//alert('user의 save함수 호출됨');
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};
		$.ajax({ 
			type:"POST",
			url:"/api/notice",
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("공지 작성이 완료되었습니다.");
			location.href="/notice";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	update: function(){
		let id=$("#id").val();
		
		let data={
			title: $("#title").val(),
			content: $("#content").val()
		};

		$.ajax({ 
			type:"PUT",
			url:"/api/notice/"+id,
			data:JSON.stringify(data), 
			contentType:"application/json; charset=utf-8",
			dataType:"json" 
		}).done(function(resp){
			alert("공지 수정이 완료되었습니다.");
			location.href="/notice";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function(){
		let id=$("#id").text();
		
		$.ajax({ 
			type:"DELETE",
			url:"/api/notice/"+id,
			dataType:"json" 
		}).done(function(resp){
			alert("공지 삭제가 완료되었습니다.");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
}
index.init();