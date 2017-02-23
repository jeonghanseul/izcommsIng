<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_egov_link_page(pageNo){

		document.listForm.pageIndex.value = pageNo;
    	document.listForm.action = "<c:url value='/selectScdulList.do'/>";
       	document.listForm.submit();
	}
</script>
</head>
<body>
	<jsp:include page="head.jsp"/>
	
 <form:form commandName="scdulVO" id="listForm" name="listForm" method="get">
	<div>
		<table width="100%">
			<colgroup>
				<col />
			</colgroup>
			<tbody>
				<tr>
					<td>상태</td>
					<td>미팅날짜</td>
					<td>장소</td>
					<td>담당자</td>
					<td>광고주</td>
					<td>연락처</td>
					<td> </td>
				</tr>
				<c:forEach var="selectScdulList" items="${selectScdulList}" varStatus="status">
					<tr>
						<td>
							<c:choose>
								<c:when test="${selectScdulList.status eq 'TW'}">
									전화대기
								</c:when>
								<c:when test="${selectScdulList.status eq 'TC'}">
									전화확인
								</c:when>
								<c:when test="${selectScdulList.status eq 'TS'}">
									전화확정
								</c:when>
								<c:when test="${selectScdulList.status eq 'TR'}">
									전화취소
								</c:when>
								<c:when test="${selectScdulList.status eq 'TP'}">
									전화완료
								</c:when>
								<c:when test="${selectScdulList.status eq 'MW'}">
									미팅대기
								</c:when>
								<c:when test="${selectScdulList.status eq 'MC'}">
									미팅확인
								</c:when>
								<c:when test="${selectScdulList.status eq 'MS'}">
									미팅확정
								</c:when>
								<c:when test="${selectScdulList.status eq 'MR'}">
									미팅취소
								</c:when>
								<c:when test="${selectScdulList.status eq 'MP'}">
									미팅완료
								</c:when>
							</c:choose>
						</td>
						<td>${selectScdulList.meetingDate}</td>
						<td>${selectScdulList.address}</td>
						<td>${selectScdulList.member}</td>
						<td>${selectScdulList.adManager}</td>
						<td>${selectScdulList.telNo}</td>
						<td>
							<a href="./selectScdulView.do?No=${selectScdulList.no}">상세보기</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(selectScdulList) == 0}">
					<tr>
						<td colspan="7" align="center">검색결과가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<div id="paging">
   		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
   		<form:hidden path="pageIndex" />
		<form:hidden id="searchKeyword" path="searchKeyword"/>
   	</div>
</form:form>
	<jsp:include page="tail.jsp"/>
</body>
</html>