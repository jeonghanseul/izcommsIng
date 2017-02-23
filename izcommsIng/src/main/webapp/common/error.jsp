<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/sample.css'/>" />
<title>Basic Sample</title>
</head>

<body>
<script type="text/javascript">
	var message='${msg}';
	if(message == ''){
		message='오류사항입니다.\n담당자에게 문의해주시기 바랍니다.';
	}
	var returnUrl='${url}';
	alert(message);
	if(returnUrl == ''){
		returnUrl = '/scdulList.do';
	}
	document.location.href = returnUrl;
</script> 
<!--     <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"> -->
<!--         <tr> -->
<!--             <td width="100%" height="100%" align="center" valign="middle" style="padding-top: 150px;"><table border="0" cellspacing="0" cellpadding="0"> -->
<!--                     <tr> -->
<%--                         <td class="<spring:message code='image.errorBg' />"> --%>
<!--                             <span style="font-family: Tahoma; font-weight: bold; color: #000000; line-height: 150%; width: 440px; height: 70px;"></span> -->
<!--                         </td> -->
<!--                     </tr> -->
<!--                 </table> -->
<!--             </td> -->
<!--         </tr> -->
<!--     </table> -->
</body>
</html>