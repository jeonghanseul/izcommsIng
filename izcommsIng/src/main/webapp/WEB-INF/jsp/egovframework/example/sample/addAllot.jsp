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
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat : 'yymmdd',
      changeMonth: true,
      changeYear: true
    });
  } );

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
window.onload=function(){
	 var today = new Date();
	 var dd = today.getDate();
	 var mm = today.getMonth()+1;
	 var yyyy = today.getFullYear();
	 
	 if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy+ mm+dd;
	$('#datepicker').val(today);
 }
</script>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<validator:javascript formName="scdulForm" staticJavascript="false" xhtml="true" cdata="false"/>
</head>
<body>

<div class="bg">
	<jsp:include page="head.jsp"/>


	<div class="addAllot">
		<form:form action="./addAllotDo.do" commandName="scdulVO" name="scdulForm" method="POST" onsubmit="return validateScdulForm(this)">
			<form:hidden path="allotKey"/>
			<table border="0" cellspacing="0" cellpadding="0" align="center" >
	
				<colgroup>
					<col />
				</colgroup>
				<tbody>
					<tr>
						<td class="add_title">담당자</td>
						<td class="add_in_txt">
							<form:select path="member" class="type1">
								<form:option value="">선택해주세요.</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td class="add_title">상태</td>
						<td class="add_in_txt">
							<form:select path="status" class="type2">
								<form:option value="ALL">전체</form:option>
								<form:option value="TW">전화대기</form:option>
								<form:option value="TC">전화확인</form:option>
								<form:option value="TS">전화확정</form:option>
								<form:option value="TR">전화취소</form:option>
								<form:option value="TP">전화완료</form:option>
								<form:option value="MW">미팅대기</form:option>
								<form:option value="MC">미팅확인</form:option>
								<form:option value="MS">미팅확정</form:option>
								<form:option value="MR">미팅취소</form:option>
								<form:option value="MP">미팅완료</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td class="add_title">미팅종류</td>
						<td class="add_in_txt">
							<form:select path="adType1" class="type3">
								<form:option value="product">제품</form:option>
								<form:option value="visit">체험단</form:option>
								<form:option value="report">기자단</form:option>
								<form:option value="home">홈페이지</form:option>
								<form:option value="etc">기타</form:option>
							</form:select>
							<form:select path="adType2" class="type3">
								<form:option value="product">제품</form:option>
								<form:option value="visit">체험단</form:option>
								<form:option value="report">기자단</form:option>
								<form:option value="home">홈페이지</form:option>
								<form:option value="etc">기타</form:option>
							</form:select>
							<form:select path="adType3" class="type3">
								<form:option value="product">제품</form:option>
								<form:option value="visit">체험단</form:option>
								<form:option value="report">기자단</form:option>
								<form:option value="home">홈페이지</form:option>
								<form:option value="etc">기타</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td class="add_title">업체명</td>
						<td class="add_in_txt">
							<form:input path="company" class="type4"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">일시</td>
						<td class="add_in_txt">
							<form:input path="meetingDate" id="datepicker" class="type5"/>
							<form:select path="meetingHour"  class="type6">
								<form:option value="09">09</form:option>
								<form:option value="10">10</form:option>
								<form:option value="11">11</form:option>
								<form:option value="12">12</form:option>
								<form:option value="13">13</form:option>
								<form:option value="14">14</form:option>
								<form:option value="15">15</form:option>
								<form:option value="16">16</form:option>
								<form:option value="17">17</form:option>
								<form:option value="18">18</form:option>
								<form:option value="19">19</form:option>
							</form:select>
							시
							<form:select path="meetingMin" class="type6">
								<form:option value="00">00</form:option>
								<form:option value="10">10</form:option>
								<form:option value="20">20</form:option>
								<form:option value="30">30</form:option>
								<form:option value="40">40</form:option>
								<form:option value="50">50</form:option>
							</form:select>
							<span class="minute">분</span>
						</td>
					</tr>
					<tr>
						<td class="add_title">장소  </td>
						<td class="add_in_txt">
							<a href="#" onclick="goPopup()"><form:input path="address" placeholder=" 주소찾기 click" size="30" readonly="true" class="type7"/></a>
							
							<form:input path="detailAddress" size="30" placeholder="나머지 주소" class="type7"/>
							
						</td>
					</tr>
					<tr>
						<td class="add_title">광고주</td>
						<td class="add_in_txt">
							<form:input path="adManager"  class="type8"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">업종</td>
						<td class="add_in_txt">
							<form:input path="type"  class="type9"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">연락처</td>
						<td class="add_in_txt">
							<form:input path="telNo" placeholder="* -없이 적어주세요. Ex)01012345678" size="30" class="type10"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">Email</td>
						<td class="add_in_txt">
							<form:input path="email" class="type11"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">기타연락처</td>
						<td class="add_in_txt">
							<form:input path="etcTelNo"  class="type12"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">특이사항</td>
						<td class="add_in_txt">
							<form:textarea path="etc"  class="type13"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">추가특이사항</td>
						<td class="add_in_txt">
							<form:textarea path="addEtc" class="type14"/>
						</td>
					</tr>
					<tr>
						<td class="add_title">알림</td>
						<td class="add_in_txt">
							<form:checkbox path="sms" value="1" class="type16"/><span class="type16_txt">문자</span> 
							<form:select path="smsTime"  class="type15">
								<form:option value="15">15분</form:option>
								<form:option value="30">30분</form:option>
								<form:option value="60">1시간</form:option>
								<form:option value="75">1시간15분</form:option>
								<form:option value="90">1시간30분</form:option>
								<form:option value="105">1시간45분</form:option>
								<form:option value="120">2시간</form:option>
							</form:select>
							<form:checkbox path="message" value="1" class="type16"/><span class="type16_txt">메신저</span> 
							<form:select path="messageTime"  class="type15">
								<form:option value="15">15분</form:option>
								<form:option value="30">30분</form:option>
								<form:option value="60">1시간</form:option>
								<form:option value="75">1시간15분</form:option>
								<form:option value="90">1시간30분</form:option>
								<form:option value="105">1시간45분</form:option>
								<form:option value="120">2시간</form:option>
							</form:select>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<input  class="save" type="submit" value="저장">
				<a href="./scdulList.do"><span  class="cancel">취소</span></a>
			</div>
		</form:form>
	</div>
	</div>
	<jsp:include page="tail.jsp"/>
</body>
</html>