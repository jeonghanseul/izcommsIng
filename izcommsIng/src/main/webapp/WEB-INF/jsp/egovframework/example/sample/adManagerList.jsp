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
    	document.listForm.action = "<c:url value='./adManagerList.do'/>";
       	document.listForm.submit();
	}
	function deleteDo(no){
		if(confirm("항목을 삭제하시겠습니까?") == true){
			location.href="deleteAdManager.do?no="+no;
		}else{
			return;
		}
	}
</script>
</head>
<body>
	<jsp:include page="./head.jsp"/>
<div class="bg">
		<div class="mail_box">
			<div  class="select_box1" >
			<c:choose>
				<c:when test="${param.adGroup == null}">
					<div class="select_box1_type1">
						<!-- 전체만 색상변경 -->
						<span class="con1_ov"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4" ><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5" ><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == ''}">
					<div class="select_box1_type2">
						<!-- 전체만 색상변경 -->
						<span class="con1_ov"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == 'AdCenter1'}">
					<div class="select_box1_type3">
						<!-- 메일만 색상변경 -->
						<span class="con1"><a href="./adManagerList.do">전체</a></span>
						<span class="con3_ov"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6" ><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == 'AdCenter2'}">
					<div class="select_box1_type4">
						<!-- 키워드광고만 색상변경 -->
						<span class="con1"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2_ov"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == 'AdCenter3'}">
					<div class="select_box1_type5">
						<!-- 기자단만 색상변경 -->
						<span class="con1"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4_ov"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == 'AdCenter4'}">
					<div class="select_box1_type6">
						<!-- 브랜드검색광고만 색상변경 -->
						<span class="con1"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5_ov"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == 'AdCenter'}">
					<div class="select_box1_type7">
						<!-- 입점 및 제휴문의만 색상변경 -->
						<span class="con1"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6_ov"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
				<c:when test="${param.adGroup == 'AdCenterTel'}">
					<div class="select_box1_type8">
						<!-- 전화문의만 색상변경 -->
						<span class="con1"><a href="./adManagerList.do">전체</a></span>
						<span class="con3"><a href="./adManagerList.do?adGroup=AdCenter1">키워드광고</a></span>
						<span class="con2"><a href="./adManagerList.do?adGroup=AdCenter2">메일</a></span>
						<span class="con4"><a href="./adManagerList.do?adGroup=AdCenter3">리타겟팅 광고</a></span>
						<span class="con5"><a href="./adManagerList.do?adGroup=AdCenter4">브랜드검색광고</a></span>
						<span class="con6"><a href="./adManagerList.do?adGroup=AdCenter">입점 및 제휴문의</a></span>
						<span class="con7_ov"><a href="./adManagerList.do?adGroup=AdCenterTel">전화문의</a></span>
					</div>
				</c:when>
			</c:choose>
			</div>
			<div>
				<c:choose>
					<c:when test="${param.adCenter == null}">
						<!-- 색상변경X -->
						<span><a href="./adManagerList.do?adCenter=Ad">쿠키1</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad1">쿠키2</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad2">쿠키3</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad3">쿠키4</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad4">쿠키5</a></span>						
					</c:when>
					<c:when test="${param.adCenter eq 'Ad'}">
						<!-- 쿠키1만 색상변경 -->
						<span><a href="./adManagerList.do?adCenter=Ad">쿠키1</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad1">쿠키2</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad2">쿠키3</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad3">쿠키4</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad4">쿠키5</a></span>					
					</c:when>
					<c:when test="${param.adCenter eq 'Ad1'}">
						<!-- 쿠키2만 색상변경 -->
						<span><a href="./adManagerList.do?adCenter=Ad">쿠키1</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad1">쿠키2</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad2">쿠키3</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad3">쿠키4</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad4">쿠키5</a></span>					
					</c:when>
					<c:when test="${param.adCenter eq 'Ad2'}">
						<!-- 쿠키3만 색상변경 -->
						<span><a href="./adManagerList.do?adCenter=Ad">쿠키1</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad1">쿠키2</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad2">쿠키3</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad3">쿠키4</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad4">쿠키5</a></span>						
					</c:when>
					<c:when test="${param.adCenter eq 'Ad3'}">
						<!-- 쿠키4만 색상변경 -->
						<span><a href="./adManagerList.do?adCenter=Ad">쿠키1</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad1">쿠키2</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad2">쿠키3</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad3">쿠키4</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad4">쿠키5</a></span>					
					</c:when>
					<c:when test="${param.adCenter eq 'Ad4'}">
						<!-- 쿠키5만 색상변경 -->
						<span><a href="./adManagerList.do?adCenter=Ad">쿠키1</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad1">쿠키2</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad2">쿠키3</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad3">쿠키4</a></span>						
						<span><a href="./adManagerList.do?adCenter=Ad4">쿠키5</a></span>						
					</c:when>
				</c:choose>
			</div>
			
			<div>
				<a href="./adManagerChartView.do">차트확인하기</a>
			</div>
			
			<form:form commandName="adManagerVO" action="./adManagerList.do" id="listForm" name="listForm" method="get">
				<div>
					<div class="select_box2">
						<form:select path="searchCondition" class="mail_select">
							<form:option value="ALL">전체내용</form:option>
							<form:option value="User">담당자</form:option>
							<form:option value="Tel">연락처</form:option>
							<form:option value="Type">업종</form:option>
							<form:option value="Ask">문의사항</form:option>
							<form:option value="Area">지역</form:option>
						</form:select>
					
						<form:input path="searchKeyword" class="searchKeyword" />
						<input type="image" src="./resources/img/search.png" class="span_type3" >
					
						<c:choose>
							<c:when test="${param.bizAllot == null}">
								<!-- 전체만 색상 변경 -->
								<span class="text_box_all_ov "><a href="./adManagerList.do" >전체</a></span>
								<span class="text_box_y" ><a href="./adManagerList.do?bizAllot=Y">배정</a></span>
								<span class="text_box_n" ><a href="./adManagerList.do?bizAllot=N">미배정</a></span>
							</c:when>
							<c:when test="${param.bizAllot == ''}">
								<!-- 전체만 색상 변경 -->
								<span class="text_box_all_ov"  style="margin-left:30px;"><a href="./adManagerList.do" >전체</a></span>
								<span class="text_box_y" ><a href="./adManagerList.do?bizAllot=Y" >배정</a></span>
								<span class="text_box_n"><a href="./adManagerList.do?bizAllot=N" >미배정</a></span>
							</c:when>
							<c:when test="${param.bizAllot == 'Y'}">
								<!-- 배정만 색상 변경 -->
								<span class="text_box_all"  style="margin-left:30px; "><a href="./adManagerList.do" >전체</a></span>
								<span class="text_box_y_ov" ><a href="./adManagerList.do?bizAllot=Y" >배정</a></span>
								<span class="text_box_n"><a href="./adManagerList.do?bizAllot=N" >미배정</a></span>
							</c:when>
							<c:when test="${param.bizAllot == 'N'}">
								<!-- 미배정만 색상 변경 -->
								<span class="text_box_all"  style="margin-left:30px; "><a href="./adManagerList.do">전체</a></span>
								<span class="text_box_y" ><a href="./adManagerList.do?bizAllot=Y" >배정</a></span>
								<span class="text_box_n_ov"><a href="./adManagerList.do?bizAllot=N">미배정</a></span>
							</c:when>
						</c:choose>
					</div>
					
				</div>
				<table width="1400"  border="0" cellspacing="0" cellpadding="0"   align="center">
					<colgroup>
						<col width="80"/>
						<col />
						<col  />
						<col width="110" />
						<col width="150" />
						<col width="100" />
						<col width="80" />
						<col width="150" />
						<col width="120" />
						<col width="120" />
						<col width="60" />
						<col width="90" />
						<col width="70" />
					</colgroup>
			
					<tbody>
						<tr class="mail_title">
							<td>구분</td>
							<td>날짜</td>
							<td>쿠키정보</td>
							<td>유입경로</td>
							<td>회사명</td>
							<td>업종</td>
							<td>담당자</td>
							<td>연락처</td>
							<td>지역</td>
<!-- 							<td>이메일</td> -->
<!-- 							<td>상담내용</td> -->
							<td>배정현황</td>
							<td>문의사항</td>
							<td style="padding-right:15px;">삭제</td>
						</tr>
						<c:forEach var="selectAdManagerList" items="${selectAdManagerList}" varStatus="status">
							<tr class="mail_content_txt" >
								<td class="mail_content_txt_type1">
									<c:out value="${paginationInfo.totalRecordCount+1 - ((adManagerVO.pageIndex-1) * adManagerVO.pageSize + status.count)}"/>
								</td>
								<td>
									<c:out value="${fn:substringBefore(selectAdManagerList.bizDate,'.')}"></c:out>
								</td>
								<td>
									<div>
										<c:choose>
											<c:when test="${selectAdManagerList.adCenter ne ''}">
												<span>
													<c:out value="${selectAdManagerList.adCenter}"></c:out>
												</span>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${selectAdManagerList.adCenter1 ne ''}">
												<span>
													<c:out value="${selectAdManagerList.adCenter1}"></c:out>
												</span>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${selectAdManagerList.adCenter2 ne ''}">
												<span>
													<c:out value="${selectAdManagerList.adCenter2}"></c:out>
												</span>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${selectAdManagerList.adCenter3 ne ''}">
												<span>
													<c:out value="${selectAdManagerList.adCenter3}"></c:out>
												</span>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${selectAdManagerList.adCenter4 ne ''}">
												<span>
													<c:out value="${selectAdManagerList.adCenter4}"></c:out>
												</span>
											</c:when>
										</c:choose>
									</div>
									
								</td>
								<td>
									<c:choose>
										<c:when test="${selectAdManagerList.adGroup eq 'AdCenter1'}">
											키워드광고
										</c:when>
										<c:when test="${selectAdManagerList.adGroup eq 'AdCenter2'}">
											메일
										</c:when>
										<c:when test="${selectAdManagerList.adGroup eq 'AdCenter3'}">
											리타겟팅 광고
										</c:when>
										<c:when test="${selectAdManagerList.adGroup eq 'AdCenter4'}">
											브랜드검색광고
										</c:when>
										<c:when test="${selectAdManagerList.adGroup eq 'AdCenter'}">
											입점 및 제휴문의
										</c:when>
										<c:when test="${selectAdManagerList.adGroup eq 'AdCenterTel'}">
											전화문의
										</c:when>
									</c:choose>	
							</td>
								<td class="mail_content_txt_type4">
									<c:out value="${selectAdManagerList.bizName}"></c:out>
								</td>
								<td>
									<c:out value="${selectAdManagerList.bizType}"></c:out>
								</td>
								<td>
									<c:out value="${selectAdManagerList.bizUser}"></c:out>
								</td>
								<td>
									<c:out value="${selectAdManagerList.bizTelNo}"></c:out>
								</td>
								<td>
									<c:out value="${selectAdManagerList.bizArea}"></c:out>
								</td>
<!-- 								<td> -->
<%-- 									<c:out value="${selectAdManagerList.bizEmail}"></c:out> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<c:out value="${selectAdManagerList.bizCounsel}"></c:out> --%>
<!-- 								</td> -->
								<td class="mail_content_txt_type11">
									<c:choose>
										<c:when test="${selectAdManagerList.bizAllot eq 'N'}">
											<a class="click_N" href="../addAllot.do?allotKey=${selectAdManagerList.no}">미배정</a>		
										</c:when>
										<c:otherwise>
											<span class="click_Y">배정</span>
										</c:otherwise>
									</c:choose>
									<!--<a href="./addAllot.do?allotKey=${selectAdManagerList.no}"><c:out value="${selectAdManagerList.bizAllot}"></c:out></a>-->
								</td>
								<td class="mail_content_txt_type12">
									<a class="more" href="./adManagerView.do?no=${selectAdManagerList.no}">상세보기</a>
								</td>
								<td class="mail_content_txt_type13">
									<a href="#" class="delete" type="button" onclick="deleteDo(${selectAdManagerList.no})" >삭제</a>
								</td>
							</tr>
								<c:set var="bizAsk" value="${selectAdManagerList.bizAsk}"></c:set>
						</c:forEach>
						<c:if test="${fn:length(selectAdManagerList) == 0}">
							<tr>
								<td colspan="13" align="center">등록된 광고 문의가 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div class="paging">
			   		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
			   		<form:hidden path="pageIndex" />
			   	</div>
			</form:form>
		<div class="register_margin">
			<c:choose>
				<c:when test="${param.adGroup == 'AdCenterTel'}">
					<a href="./insertAdManager.do" class="tel_register">등록</a>
				</c:when>
			</c:choose>
		</div>
		</div>
		
</div>
	<jsp:include page="./tail.jsp"/>
</body>
</html>