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
<h1>아이디 찾기</h1>
<form>
<table border="1">
	<tr>
	<td>사용자 이메일</td>
	<td align="left"><input type="email" name="email" id="email"/></td>
	</tr>
   
 
  
</table>
<hr>
</form>
  <button id="btn-findId"  >아이디 찾기</button>
  
  <button onclick="history.go(-1)"   >뒤로</button>
 
</body>
   <script src="/js/user.js"></script>
</html>

<%@ include file="../layout/footer.jsp"%>