<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var message = document.loginForm.message.value;
	 if (message != null) {
		 if(message == ''){
		 }else{
		    if(message=="fail.ID.not.exist"){
		    	alert("ID가 존재하지 않습니다.");
		    }
		    if(message=="fail.PWD.inexact"){
		    	alert("비밀번호가 일치 하지 않습니다.");
		    }
		 }
	}
});

</script>
</head>
<body>
	<div>
		<form:form name="loginForm" commandName="loginVO" action="./actionLoginUsr.do">
			<table>
				<colgroup>
					<col/>
				</colgroup>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><form:input path="id"/></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><form:password path="pwd"/></td>
					</tr>
				</tbody>
			</table>
			<div>
				<form:hidden path="message" id="message" name="message"/>
				<input type="submit" value="로그인">
			</div>
		</form:form>
	</div>
</body>
</html>