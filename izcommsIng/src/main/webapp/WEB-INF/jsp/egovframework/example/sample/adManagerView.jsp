<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="./head.jsp"/>
<div class="bg">	

	<div class="adManagerView">
	<!--	<table class="txt_box" align="center" >-->
		<table class="txt_box" cellspacing="0" cellpadding="0" border="0" align="center">
					<colgroup>
						
						<col width="200" />
						
						<col width="80" />
						<col width="150" />
						<col width="80" />
						<col width="120" />
						<col width="150" />
						<col width="120" />
						<col width="150" />
						<col width="100" />
						<col width="150" />
					</colgroup>
			
					<tbody>
						<tr>
							<td class="mail_title_in">날짜</td>
							<td class="mail_content_txt_in">${fn:substringBefore(adManagerVO.bizDate,'.')}</td>
							<td rowspan="13" colspan="3" class="mail_txt_box"><!--<textarea disabled id="bizAsk" class="input_type1" name="bizAsk" cols="50" placeholder=" *문의사항을 확인해주요"></textarea>	-->
										${adManagerVO.bizAsk}</td>
					</tr>
					<tr>
							<td class="mail_title_in">유입경로</td>
							<td class="mail_content_txt_in">
								<c:choose>
										<c:when test="${adManagerVO.adGroup eq 'AdCenter1'}">
											키워드광고
										</c:when>
										<c:when test="${adManagerVO.adGroup eq 'AdCenter2'}">
											메일
										</c:when>
										<c:when test="${adManagerVO.adGroup eq 'AdCenter3'}">
											블로그 광고
										</c:when>
										<c:when test="${adManagerVO.adGroup eq 'AdCenter4'}">
											리타겟팅 광고
										</c:when>
										<c:when test="${adManagerVO.adGroup eq 'AdCenter'}">
											입점 및 제휴문의
										</c:when>
										<c:when test="${adManagerVO.adGroup eq 'AdCenterTel'}">
											전화문의
										</c:when>
									</c:choose>							
							</td>
					</tr>
					<tr>
							<td class="mail_title_in">회사명</td>
							<td class="mail_content_txt_in">${adManagerVO.bizName}</td>
					</tr>
					<tr>
							<td class="mail_title_in">업종</td>
							<td class="mail_content_txt_in">${adManagerVO.bizType}</td>
					</tr>
					<tr>
							<td class="mail_title_in">담당자</td>
							<td class="mail_content_txt_in">${adManagerVO.bizUser}</td>
					</tr>
					<tr>
							<td class="mail_title_in">연락처</td>
							<td class="mail_content_txt_in">${adManagerVO.bizTelNo}</td>
					</tr>
					<tr>
							<td class="mail_title_in">지역</td>
							<td class="mail_content_txt_in">${adManagerVO.bizArea}</td>
					</tr>
					<tr>
							<td class="mail_title_in">이메일</td>
							<td class="mail_content_txt_in">${adManagerVO.bizEmail}</td>
					</tr>
					<tr>
							<td class="mail_title_in">상담내용</td>
							<td class="mail_content_txt_in">${adManagerVO.bizCounsel}</td>
					</tr>
					<tr>
							<td class="mail_title_in">프로모션코드</td>
							<td class="mail_content_txt_in">${adManagerVO.couoponCode}</td>
					</tr>
					<tr>
							<td class="mail_title_in">홈페이지</td>
							<td class="mail_content_txt_in">${adManagerVO.adAding}</td>
					</tr>
					<tr>
							<td class="mail_title_in">체함단광고시기</td>
							<td class="mail_content_txt_in">${adManagerVO.adExperienceDate}</td>
					</tr>
					
					<tr>
							<td class="mail_title_in">배정현황</td>
							<td class="mail_content_txt_in">${adManagerVO.bizAllot}</td>
					</tr>
					
					</tbody>
		</table>

	
	<div class="list_button">
		<a href="./adManagerList.do">목록</a>
	</div>
	
	</div>		

</div>

	<jsp:include page="./tail.jsp"/>

</body>
</html>