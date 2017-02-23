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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//   $( function() {
//     $( "#datepicker" ).datepicker({
//     	dateFormat : 'yymmdd',
//       changeMonth: true,
//       changeYear: true
//     });
//   } );

  function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("./jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
  function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
// 		document.form.roadFullAddr.value = roadFullAddr;
		document.scdulForm.address.value = roadAddrPart1;
// 		document.form.roadAddrPart2.value = roadAddrPart2;
		document.scdulForm.detailAddress.value = addrDetail;
// 		document.form.engAddr.value = engAddr;
// 		document.form.jibunAddr.value = jibunAddr;
// 		document.form.zipNo.value = zipNo;
// 		document.form.admCd.value = admCd;
// 		document.form.rnMgtSn.value = rnMgtSn;
// 		document.form.bdMgtSn.value = bdMgtSn;
}
</script>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<validator:javascript formName="scdulForm" staticJavascript="false" xhtml="true" cdata="false"/>
</head>
<body>
	<jsp:include page="head.jsp"/>
	
	<div>
		<form:form action="./updateScdulDo.do" commandName="scdulVO" name="scdulForm" method="POST" onsubmit="return validateScdulForm(this)">
			<form:hidden path="No" value="${No}"/>
			<table width="100%">
				<colgroup>
					<col/>
				</colgroup>
				<tbody>
					<tr>
						<td>담당자</td>
						<td>
							<form:select path="member">
								<form:option value="">선택해주세요.</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>상태</td>
						<td>
							<form:select path="status">
								<form:option value="ALL">전체</form:option>
								<form:option value="TW" >전화대기</form:option>
								<form:option value="TC" >전화확인</form:option>
								<form:option value="TS" >전화확정</form:option>
								<form:option value="TR" >전화취소</form:option>
								<form:option value="TP" >전화완료</form:option>
								<form:option value="MW" >미팅대기</form:option>
								<form:option value="MC" >미팅확인</form:option>
								<form:option value="MS" >미팅확정</form:option>
								<form:option value="MR" >미팅취소</form:option>
								<form:option value="MP" >미팅완료</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>미팅종류</td>
						<td>
							<form:select path="adType1">
								<form:option value="product" >제품</form:option>
								<form:option value="visit" >체험단</form:option>
								<form:option value="report" >기자단</form:option>
								<form:option value="home" >홈페이지</form:option>
								<form:option value="etc" >기타</form:option>
							</form:select>
							<form:select path="adType2">
								<form:option value="product" >제품</form:option>
								<form:option value="visit" >체험단</form:option>
								<form:option value="report" >기자단</form:option>
								<form:option value="home" >홈페이지</form:option>
								<form:option value="etc" >기타</form:option>
							</form:select>
							<form:select path="adType3">
								<form:option value="product" >제품</form:option>
								<form:option value="visit" >체험단</form:option>
								<form:option value="report" >기자단</form:option>
								<form:option value="home" >홈페이지</form:option>
								<form:option value="etc" >기타</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>업체명</td>
						<td>
							<form:input path="company" value="${scdulVO.company}"/>
						</td>
					</tr>
					<tr>
						<td>미팅날짜</td>
						<td>
							<form:input path="meetingDate" id="datepicker" value="${scdulVO.meetingDate}"/>
							<form:select path="meetingHour">
								<form:option value="09" >09</form:option>
								<form:option value="10" >10</form:option>
								<form:option value="11" >11</form:option>
								<form:option value="12" >12</form:option>
								<form:option value="13" >13</form:option>
								<form:option value="14" >14</form:option>
								<form:option value="15" >15</form:option>
								<form:option value="16" >16</form:option>
								<form:option value="17" >17</form:option>
								<form:option value="18" >18</form:option>
								<form:option value="19" >19</form:option>
							</form:select>
							시
							<form:select path="meetingMin">
								<form:option value="00" >00</form:option>
								<form:option value="10" >10</form:option>
								<form:option value="20" >20</form:option>
								<form:option value="30" >30</form:option>
								<form:option value="40" >40</form:option>
								<form:option value="50" >50</form:option>
							</form:select>
							분
						</td>
					</tr>
					<tr>
						<td>장소</td>
						<td>
							<form:input path="address" size="30" value="${scdulVO.address}"/>
							<form:input path="detailAddress" size="30" value="${scdulVO.detailAddress}"/>
						</td>
					</tr>
					<tr>
						<td>광고주</td>
						<td>
							<form:input path="adManager" value="${scdulVO.adManager}"/>
						</td>
					</tr>
					<tr>
						<td>업종</td>
						<td>
							<form:input path="type" value="${scdulVO.type}"/>
						</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>
							<form:input path="telNo" size="30" value="${scdulVO.telNo}"/>
						</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>
							<form:input path="email" value="${scdulVO.email}"/>
						</td>
					</tr>
					<tr>
						<td>기타연락처</td>
						<td>
							<form:input path="etcTelNo" value="${scdulVO.etcTelNo}"/>
						</td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td>
							<form:textarea path="etc" disabled="true" value="${scdulVO.etc}"/>
						</td>
					</tr>
					<tr>
						<td>추가특이사항</td>
						<td>
							<form:textarea path="addEtc" value="${scdulVO.addEtc}"/>
						</td>
					</tr>
					<tr>
						<td>알림</td>
						<td>
							<form:checkbox path="sms" value="1" />문자 
							<form:select path="smsTime" disabled="disable">
								<form:option value="15" >15분</form:option>
								<form:option value="30" >30분</form:option>
								<form:option value="60" >1시간</form:option>
								<form:option value="75" >1시간15분</form:option>
								<form:option value="90" >1시간30분</form:option>
								<form:option value="105">1시간45분</form:option>
								<form:option value="120">2시간</form:option>
							</form:select>
							<form:checkbox path="message" value="1"/>메신저
							<form:select path="messageTime">
								<form:option value="15" >15분</form:option>
								<form:option value="30" >30분</form:option>
								<form:option value="60" >1시간</form:option>
								<form:option value="75" >1시간15분</form:option>
								<form:option value="90" >1시간30분</form:option>
								<form:option value="105">1시간45분</form:option>
								<form:option value="120">2시간</form:option>
							</form:select>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="submit" value="저장">
				<a href="./scdulList.do">취소</a>
			</div>
		</form:form>
	</div>
	<jsp:include page="tail.jsp"/>
</body>
</html>