<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
      changeYear: true,
      showOn: "button",
      buttonImage: "images/calendar.gif",
      buttonImageOnly: true
    });
  } );
$( function() {
    $( "#datepicker2" ).datepicker({
    	dateFormat : 'yymmdd',
      changeMonth: true,
      changeYear: true,
      showOn: "button",
      buttonImage: "images/calendar.gif",
      buttonImageOnly: true
    });
  } );
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("../jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
// 		document.form.roadFullAddr.value = roadFullAddr;
		document.memberForm.address.value = roadAddrPart1;
// 		document.form.roadAddrPart2.value = roadAddrPart2;
		document.memberForm.detailAddress.value = addrDetail;
// 		document.form.engAddr.value = engAddr;
// 		document.form.jibunAddr.value = jibunAddr;
// 		document.form.zipNo.value = zipNo;
// 		document.form.admCd.value = admCd;
// 		document.form.rnMgtSn.value = rnMgtSn;
// 		document.form.bdMgtSn.value = bdMgtSn;
}
	function checkId(){
		var id = document.memberForm.id.value;
		var url="/admin/checkId.do";
		var params="?id="+id;
		$.ajax({
			url : url,
			contentType: "application/json; charset=utf-8",
			dataType : "json",
			type : "GET",
			data : 
				{
					id : id	
				},
			success: function(data) {
				if(data.id == ""){
					alert("이미 존재하는 직원코드 입니다.");
					document.memberForm.id.value = "";
				}else{
					alert("사용할 수 있는 직원코드 입니다.");
					document.memberForm.id.value = data.id;
				}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"error:"+error+"\n"+"message:"+request.responseText);
			}
		}); 
	}
</script>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<validator:javascript formName="memberForm" staticJavascript="false" xhtml="true" cdata="false"/>
</head>
<body>
	<jsp:include page="./head.jsp"/>
	<div>
		<form:form commandName="memberVO" name="memberForm" action="./addMemberDo.do" method="POST" onsubmit="return validateMemberForm(this)">
			<table>
				<colgroup>
					<col />
				</colgroup>
				<tbody>
					<tr>
						<td>
							직원코드
						</td>
						<td>
							<form:input id="id" path="id"/>
							<button type="button" onclick="checkId();">중복체크</button>
						</td>
					</tr>
					<tr>
						<td>
							비밀번호
						</td>
						<td>
							<form:password path="pwd"/>
						</td>
					</tr>
					<tr>
						<td>
							성명
						</td>
						<td>
							<form:input path="name"/>
						</td>
					</tr>
					<tr>
						<td>
							주소
						</td>
						<td>
							<a href="#" onclick="goPopup()">주소찾기</a>
							<form:input path="address" size="30" readonly="true"/>
							<form:input path="detailAddress" size="30"/>
						</td>
					</tr>
					<tr>
						<td>
							연락처
						</td>
						<td>
							<form:input path="telNo" placeholder="* -없이 적어주세요. Ex)01012345678" size="30"/>
						</td>
					</tr>
					<tr>
						<td>
							이메일
						</td>
						<td>
							<form:input path="email"/>
						</td>
					</tr>
					<tr>
						<td>
							회원등급
						</td>
						<td>
							<form:select path="grade">
								<form:option value="">선택해주세요.</form:option>
								<form:option value="1">사원</form:option>
								<form:option value="2">부팀장</form:option>
								<form:option value="3">팀장</form:option>
								<form:option value="4">센터장</form:option>
								<form:option value="999">관리자</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>
							회원그룹
						</td>
						<td>
							<form:select path="memberGroup">
								<form:option value="">선택해주세요.</form:option>
								<form:option value="T0">Team0</form:option>
								<form:option value="T1">Team1</form:option>
								<form:option value="T2">Team2</form:option>
								<form:option value="T3">Team3</form:option>
								<form:option value="T4">Team4</form:option>
								<form:option value="T5">Team5</form:option>
								<form:option value="T6">Team6</form:option>
								<form:option value="T7">Team7</form:option>
								<form:option value="T8">Team8</form:option>
								<form:option value="T9">Team9</form:option>
								<form:option value="E1">Etc1</form:option>
								<form:option value="E2">Etc2</form:option>
								<form:option value="E3">Etc3</form:option>
								<form:option value="E4">Etc4</form:option>
								<form:option value="E5">Etc5</form:option>
								<form:option value="E6">Etc6</form:option>
								<form:option value="E7">Etc7</form:option>
								<form:option value="E8">Etc8</form:option>
								<form:option value="E9">Etc9</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td>입사일</td>
						<td><form:input path="joinDate" id="datepicker"/></td>
					</tr>
					<tr>
						<td>퇴사일</td>
						<td><form:input path="refireDate" id="datepicker2"/></td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="submit" value="확인">
				<a href="./selectMemberList.do">취소</a>
			</div>
		</form:form>
	</div>
	<jsp:include page="./tail.jsp"/>
</body>
</html>