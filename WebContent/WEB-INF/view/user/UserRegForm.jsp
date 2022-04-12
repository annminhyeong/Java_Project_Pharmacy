<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script type="text/javascript">
	
	function doRegUserCheck(f) {
		
		if(f.user_id.value==""){
			alert("아이디를 입력하세요.");
			f.user_id.focus();
			return false;
		}
		if(f.user_name.value==""){
			alert("이름를 입력하세요.");
			f.user_name.focus();
			return false;
		}
		if(f.password.value==""){
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return false;
		}
		if(f.password2.value==""){
			alert("비밀번호확인를 입력하세요.");
			f.password2.focus();
			return false;
		}		
		if(f.email.value==""){
			alert("이메일를 입력하세요.");
			f.email.focus();
			return false;
		}
		if(f.addr1.value==""){
			alert("주소를 입력하세요.");
			f.addr1.focus();
			return false;
		}		
		if(f.addr2.value==""){
			alert("상세주소를 입력하세요.");
			f.addr2.focus();
			return false;
		}
</script>

<style>
	.back{
	background-color: yellow;
	position:fixed;
	left:0px;
 	top:0px;
	width:100%;
 	height:100%;
 	z-index:100;
 
	}
	
	.a_center{
	padding: 50px 20px;
	text-align: center;
	
	}

</style>
</head>
<body>
<div class="back">
	<div style="text-align: center">
		<h1 style="font-family:cursive;">회원가입 화면</h1>
	</div>
	<br>
	<br>
	
	<form action="/user/insertUserInfo.do" onsubmit="return doRegUserCheck(this);" name="f">
		
			<div class="a_center">
				<div style="font-family:fantasy;">
				<p>아이디</p>
				<input type="text" name="user_id">
				<p>이름</p>
				<input type="text" name="user_name" style="width: 150px">
			
			
				<p>비밀번호</p>
				<input type="password" name="password" style="width: 150px">
				<p>비밀번호확인</p>
				<input type="password" name="password2" style="width: 150px">
			
			
				<p>이메일</p>
				<input type="text" name="email" style="width: 450">
			
			
				<p>주소</p>
				<input type="text" name="addr1" style="width: 450">
			
			
				<p>상세</p>
				<input type="text" name="addr2" style="width: 450">
			
				<br>
				<br>
				<br>
				<input type="submit" value="회원가입">
		
			</div>
		</div>
	</form>
</div>	
</body>
</html>