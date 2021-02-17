$(function(){
	$("#btn_write").on('click', function(){
		// alert("btn_write click!!!");
		if( $("#title").val() == "" ) {
			alert("아이디를 꼭 입력해주세요!");
			$("#title").focus();
			return;
		}
		if( $("#writer").val() == "" ) {
			alert("글쓴이를 꼭 입력해주세요!");
			$("#writer").focus();
			return;
		}
		if( $("#pwd").val() == "" ) {
			alert("비밀번호를 꼭 입력해주세요!");
			$("#pwd").focus();
			return;
		}
		if( $("#content").val() == "" ) {
			alert("내용을 꼭 입력해주세요!");
			$("#content").focus();
			return;
		}
		$("#writeform").submit();
	});

	$("#btn_update").on('click', function(){
		// alert("btn_update click!!!");
		if($("#update_title").val() == "") {
			alert("제목을 꼭 입력해주세요!");
			$("#update_title").focus();
			return;
		}
		if($("#update_writer").val() == "") {
			alert("글쓴이를 꼭 입력해주세요!");
			$("#update_writer").focus();
			return;
		}
		if($("#update_content").val() == "") {
			alert("내용을 꼭 입력해주세요!");
			$("#update_content").focus();
			return;
		}
		if($("#update_pwd").val() == "") {
			alert("비밀번호를 꼭 입력해주세요!");
			$("#update_pwd").focus();
			return;
		}
		$("#updateform").submit();
	});
});
