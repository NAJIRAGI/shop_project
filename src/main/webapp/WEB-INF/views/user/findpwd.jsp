<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 재설정하기</h1>
<form>
<table border="1">
	<tr>
	<td>사용자 아이디</td>
	<td align="left"><input type="text" name="username" id="username"/></td>
	</tr>
	<tr>
	<td>사용자 성함</td>
	<td align="left"><input type="text" name="name" id="name"/></td>
	</tr>
	<tr>
	<td>사용자 전화번호</td>
	<td align="left"><input type="text" name="tel" id="tel"/></td>
	</tr>
	<tr>
	<td>사용자 이메일</td>
	<td align="left"><input type="email" name="email" id="email"/></td>
	</tr>
	<tr>
	<td>재설정할 비밀번호</td>
	<td align="left"><input type="password" name="pwd" id="pwd"/></td>
	</tr>
	<tr>
	<td>재설정할 비밀번호 확인</td>
	<td align="left"><input type="password" name="pwd_check" id="pwd_check"/></td>
	</tr>

 
  
</table>
<hr>
</form>
 <button type="button" id="btn-findpwd"  >비밀번호 재설정하기</button>
 <button onclick="history.go(-1)"   >뒤로</button>
</body>
<script src="/js/user.js"></script>
</html>
<%@ include file="../layout/footer.jsp"%>