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
    	document.listForm.action = "<c:url value='/admin/selectMemberList.do'/>";
       	document.listForm.submit();
	}
</script>
</head>
<body>
	<jsp:include page="./head.jsp"/>
	
	<div>
		<span>회원관리</span>
		<span>매출관리</span>
		<span>통계관리</span>
	</div>
	<form:form commandName="memberVO" action="./admin/selectMemberList.do" id="listForm" name="listForm" method="get">
		<div>
			<table width="100%">
				<colgroup>
					<col/>
				</colgroup>
				<tbody>
					<tr>
						<td>구분</td>
						<td>아이디</td>
						<td>이름</td>
						<td>연락처</td>
						<td>이메일</td>
						<td>회원그룹</td>
						<td>회원등급</td>
						<td>상태</td>
						<td></td>
					</tr>
					<c:forEach var="selectMemberList" items="${selectMemberList}" varStatus="status">
						<tr>
							<td><c:out value="${paginationInfo.totalRecordCount+1 - ((memberVO.pageIndex-1) * memberVO.pageSize + status.count)}"/></td>
							<td>
								<a href="./viewMember.do?id=${selectMemberList.id}">${selectMemberList.id}</a>
							</td>
							<td>${selectMemberList.name}</td>
							<td>${selectMemberList.telNo}</td>
							<td>${selectMemberList.email}</td>
							<td>${selectMemberList.memberGroup}</td>
							<td>
								<c:choose>
									<c:when test="${selectMemberList.grade == 1}">
										사원
									</c:when>
									<c:when test="${selectMemberList.grade == 2}">
										부팀장
									</c:when>
									<c:when test="${selectMemberList.grade == 3}">
										팀장
									</c:when>
									<c:when test="${selectMemberList.grade == 4}">
										센터장
									</c:when>
									<c:when test="${selectMemberList.grade == 999}">
										관리자
									</c:when>
								</c:choose>
								
							</td>
							<td>
								<c:choose>
									<c:when test="${selectMemberList.refireDate == null}">
										재직
									</c:when>
									<c:when test="${selectMemberList.refireDate == ''}">
										재직
									</c:when>
									<c:when test="${selectMemberList.refireDate != null}">
										퇴직
									</c:when>
									<c:when test="${selectMemberList.refireDate != ''}">
										퇴직
									</c:when>
								</c:choose>
							</td>
							<td><a href="./modifyMember.do?id=${selectMemberList.id}">수정</a></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(selectMemberList) == 0}">
						<tr>
							<td colspan="7" align="center">등록된 회원이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>		
		</div>
		<div>
			<a href="./addMember.do">회원추가</a>
		</div>
		<div id="paging">
	   		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
	   		<form:hidden path="pageIndex" />
	   	</div>
	</form:form>
	<jsp:include page="./tail.jsp"/>
</body>
</html>