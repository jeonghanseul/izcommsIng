<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script language = "javascript">  // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.bizUser.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.bizUser.focus();   // form 에 있는 name 위치로 이동
    return;
   }
      
  if( !form.bizTelNo.value )
   {
    alert( "연락처를 적어주세요" );
    form.bizTelNo.focus();
    return;
   }
  if( !form.bizEmail.value )
   {
    alert( "이메일을 적어주세요" );
    form.bizEmail.focus();
    return;
   }
  if( !form.bizCounsel.value )
   {
    alert( "상담내용을 선택해 주세요" );
    form.bizCounsel.focus();
    return;
   }
 
  if( !form.bizAsk.value )
   {
    alert( "문의사항을 적어주세요" );
    form.bizAsk.focus();
    return;
   }
 
  form.submit();
  }
  function onlyNumber(e){
	var keyValue = event.keyCode;
	if((keyValue >= 48) && (keyValue <= 57)){
		return true;
	}
	return false;
  }
  window.onload = function(){
	  alert("dddd");
  }
 </script>
	<form action="write_ok.jsp" name="writeform" method="post">
		<table>
				<tr>
					<td>
						회사명	
					</td>
					<td>
						<input type="text" name="bizName">	
					</td>
				</tr>
				<tr>
					<td>
						업종	
					</td>
					<td>
						<select name="bizType">
							<option value="">선택해주세요.</option>
							<option value="food">요식업</option>
							<option value="build">건설업</option>
						</select>	
					</td>
				</tr>
				<tr>
					<td>
						담당자	
					</td>
					<td>
						<input type="text" name="bizUser" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<td>
						연락처	
					</td>
					<td>
						<input type="text" name="bizTelNo" maxlength="11" onkeypress="return onlyNumber(event);"/> * - 없이 작성해주세요 EX)01012345678
					</td>
				</tr>
				<tr>
					<td>
						지역
					</td>
					<td>
						<select name="bizArea">
							<option value="">선택해주세요.</option>
							<option value="SE">서울</option>
							<option value="BS">부산</option>
							<option value="IN">인천</option>
							<option value="DG">대구</option>
							<option value="DJ">대전</option>
							<option value="GJ">광주</option>
							<option value="US">울산</option>
							<option value="SW">수원</option>
							<option value="CW">창원</option>
							<option value="GY">고양</option>
							<option value="YI">용인</option>
							<option value="SN">성남</option>
							<option value="BC">부천</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="bizEmail">
					</td>
				</tr>
				<tr>
					<td>상담내용</td>
					<td>
						<select name="bizCounsel">
							<option value="">선택해주세요.</option>
							<option value="01">제품체험단</option>
							<option value="02">기자단</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="adGroup"></td>
				</tr>
				<tr>
					<td>문의사항</td>
					<td>
						<textarea  name="bizAsk" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td><input type=button value="등록" OnClick="javascript:writeCheck();"></td>
				</tr>
		</table>
	</form>
</body>
</html>