<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="bg">
	<jsp:include page="head.jsp"/>
	
	<div class="viewScdul">
		<table  border="0" cellspacing="0" cellpadding="0" align="center" >
			<colgroup>
				<col/>
			</colgroup>
			<tbody>
				<tr>
					<th class="view_title">담당자</th>
					<td class="view_in_txt">${scdulVO.member}</td>
				</tr>
				<tr>
					<th class="view_title">상태</th>
					<td class="view_in_txt">
						<c:choose>
							<c:when test="${scdulVO.status eq 'TW'}">
								전화대기
							</c:when>
							<c:when test="${scdulVO.status eq 'TC'}">
								전화확인
							</c:when>
							<c:when test="${scdulVO.status eq 'TS'}">
								전화확정
							</c:when>
							<c:when test="${scdulVO.status eq 'TR'}">
								전화취소
							</c:when>
							<c:when test="${scdulVO.status eq 'TP'}">
								전화완료
							</c:when>
							<c:when test="${scdulVO.status eq 'MW'}">
								미팅대기
							</c:when>
							<c:when test="${scdulVO.status eq 'MC'}">
								미팅확인
							</c:when>
							<c:when test="${scdulVO.status eq 'MS'}">
								미팅확정
							</c:when>
							<c:when test="${scdulVO.status eq 'MR'}">
								미팅취소
							</c:when>
							<c:when test="${scdulVO.status eq 'MP'}">
								미팅완료
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th class="view_title">미팅종류</th>
<!-- 					<form:select path="adType1"> -->
<!-- 						<option value="product">제품</option> -->
<!-- 						<option value="visit">체험단</option> -->
<!-- 						<option value="report">기자단</option> -->
<!-- 						<option value="home">홈페이지</option> -->
<!-- 						<option value="etc">기타</option> -->
<!-- 					</form:select> -->
					<td class="view_in_txt">
						<c:choose>
							<c:when test="${scdulVO.adType1 eq 'product'}">
								제품
							</c:when>
							<c:when test="${scdulVO.adType1 eq 'visit'}">
								체험단
							</c:when>
							<c:when test="${scdulVO.adType1 eq 'report'}">
								기자단
							</c:when>
							<c:when test="${scdulVO.adType1 eq 'home'}">
								홈페이지
							</c:when>
							<c:when test="${scdulVO.adType1 eq 'etc'}">
								기타
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${scdulVO.adType2 eq 'product'}">
								제품
							</c:when>
							<c:when test="${scdulVO.adType2 eq 'visit'}">
								체험단
							</c:when>
							<c:when test="${scdulVO.adType2 eq 'report'}">
								기자단
							</c:when>
							<c:when test="${scdulVO.adType2 eq 'home'}">
								홈페이지
							</c:when>
							<c:when test="${scdulVO.adType2 eq 'etc'}">
								기타
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${scdulVO.adType3 eq 'product'}">
								제품
							</c:when>
							<c:when test="${scdulVO.adType3 eq 'visit'}">
								체험단
							</c:when>
							<c:when test="${scdulVO.adType3 eq 'report'}">
								기자단
							</c:when>
							<c:when test="${scdulVO.adType3 eq 'home'}">
								홈페이지
							</c:when>
							<c:when test="${scdulVO.adType3 eq 'etc'}">
								기타
							</c:when>
						</c:choose>
				</tr>
				<tr>
					<th class="view_title">미팅날짜</th>
					<td class="view_in_txt">${scdulVO.meetingDate} ${scdulVO.meetingHour}시 ${scdulVO.meetingMin}분</td>
				</tr>
				<tr>
					<th class="view_title">장소</th>
					<td class="view_in_txt">${scdulVO.address} ${scdulVO.detailAddress}</td>
				</tr>
				<tr>
					<th class="view_title">광고주</th>
					<td class="view_in_txt">${scdulVO.adManager}</td>
				</tr>
				<tr>
					<th class="view_title">업종</th>
					<td class="view_in_txt">${scdulVO.type}</td>
				</tr>
				<tr>
					<th class="view_title">연락처</th>
					<td class="view_in_txt">${scdulVO.telNo}</td>
				</tr>
				<tr>
					<th class="view_title">E-mail</th>
					<td class="view_in_txt">${scdulVO.email}</td>
				</tr>
				<tr>
					<th class="view_title">기타연락처</th>
					<td class="view_in_txt">${scdulVO.etcTelNo}</td>
				</tr>
				<tr>
					<th class="view_title">특이사항</th>
					<td class="view_in_txt">${scdulVO.etc}</td>
				</tr>
				<tr>
					<th class="view_title">추가특이사항</th>
					<td class="view_in_txt">${scdulVO.addEtc}</td>
				</tr>
				<tr>
					<th class="view_title">알림</th>
					<td class="view_in_txt">
						<input type="checkbox" disabled="disabled" <c:if test='${scdulVO.sms != null}'>checked="checked"</c:if>>
						<select disabled="disabled">
							<option value="15" <c:if test='${scdulVO.smsTime == 15}'>selected="selected"</c:if>>15분</option>
							<option value="30" <c:if test='${scdulVO.smsTime == 30}'>selected="selected"</c:if>>30분</option>
							<option value="60" <c:if test='${scdulVO.smsTime == 60}'>selected="selected"</c:if>>1시간</option>
							<option value="75" <c:if test='${scdulVO.smsTime == 75}'>selected="selected"</c:if>>1시간15분</option>
							<option value="90" <c:if test='${scdulVO.smsTime == 90}'>selected="selected"</c:if>>1시간30분</option>
							<option value="105"<c:if test='${scdulVO.smsTime == 105}'>selected="selected"</c:if>>1시간45분</option>
							<option value="120"<c:if test='${scdulVO.smsTime == 120}'>selected="selected"</c:if>>2시간</option>
						</select>
						<input type="checkbox" disabled="disabled" <c:if test='${scdulVO.message != null}'>checked="checked"</c:if>>
						<select disabled="disabled">
							<option value="15" <c:if test='${scdulVO.messageTime == 15}'>selected="selected"</c:if>>15분</option>
							<option value="30" <c:if test='${scdulVO.messageTime == 30}'>selected="selected"</c:if>>30분</option>
							<option value="60" <c:if test='${scdulVO.messageTime == 60}'>selected="selected"</c:if>>1시간</option>
							<option value="75" <c:if test='${scdulVO.messageTime == 75}'>selected="selected"</c:if>>1시간15분</option>
							<option value="90" <c:if test='${scdulVO.messageTime == 90}'>selected="selected"</c:if>>1시간30분</option>
							<option value="105"<c:if test='${scdulVO.messageTime == 105}'>selected="selected"</c:if>>1시간45분</option>
							<option value="120"<c:if test='${scdulVO.messageTime == 120}'>selected="selected"</c:if>>2시간</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
	<a href="./updateScdul.do?No=${param.No}"><span  class="save">수정</span></a>
		<a href="./scdulList.do"><span  class="cancel">확인</span></a>
	<div class="viewScdul_margin">
		
	<div>
	</div>
	
	<jsp:include page="tail.jsp"/>
</div>
</body>
</html>