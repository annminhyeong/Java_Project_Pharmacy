<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.back{
	background-color: yellow;
	}

</style>

</head>

<body>

<form action="sendMail.do" method="POST">

<div style="text-align: center" class="back">
<div style="color: coral">
<h1 style="font-family: serif">메일 보내기</h1>

받는사람:<br>
<input type="text" name="toMail">
<br>
메일제목:
<br>
<input type="text" name="title">
<br>
메일내용:
<br>
<textarea name="contents">메일 내용을 입력하세요.</textarea>
<br>
<input type="submit" value="제출하기">
<input type="reset" value="초기화">
</div>
</div>


</form>

</body>

</html>