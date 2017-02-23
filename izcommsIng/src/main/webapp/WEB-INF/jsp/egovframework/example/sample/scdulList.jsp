<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="./resources/css/default.css" rel="stylesheet" type="text/css" />
<link href="./resources/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( "#datepicker" ).datepicker({
      showButtonPanel: true,
      changeMonth: true,
      changeYear: true,
      onChangeMonthYear: function(year, month, inst){
		  var url = "./scdulList.do?curYear="+year+"&curMonth="+month;
		  $(location).attr('href',url);
   		}
    });
  } );
  function searchGo(){
	  var searchKeyword = $("#searchKeyword").val();
	  var url = "./selectScdulList.do?searchKeyword="+searchKeyword;
	  $(location).attr('href',url);
  }
</script>
</head>
<body>
<jsp:include page="head.jsp"/>

<div class="bg">

<div class="mid">
    
    
    	<div class="left_content">
        
            <table width="265" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="add"><a href="./addScdul.do"><img src="./resources/img/left_menu01.jpg" width="226" height="33" /></a></td>
              </tr>
              <tr>
                <td class="calendar"><div id="datepicker"></div>	</td>
              </tr>
              <tr>
                <td class="list_title"><img src="./resources/img/left_list.jpg" width="226" height="33" /></td>
              </tr>
              <tr>
                <td valign="top" class="list_bg">

				<c:forEach var="selectScdulDayList" items="${selectScdulDayList}" varStatus="status">
					<ul>
									<li>${selectScdulDayList.meetingDate}</li>
										<c:forEach var="selectSculToDoList" items="${selectSculToDoList}">
											<c:if test="${selectScdulDayList.meetingDate == selectSculToDoList.meetingDate}">
												<li>
													<span>
														<c:choose>
															<c:when test="${selectSculToDoList.status eq 'TW'}">
																전화대기
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'TC'}">
																전화확인
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'TS'}">
																전화확정
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'TR'}">
																전화취소
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'TP'}">
																전화완료
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'MW'}">
																미팅대기
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'MC'}">
																미팅확인
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'MS'}">
																미팅확정
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'MR'}">
																미팅취소
															</c:when>
															<c:when test="${selectSculToDoList.status eq 'MP'}">
																미팅완료
															</c:when>
														</c:choose>
													</span>
													<span>${selectSculToDoList.company}</span>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</c:forEach>
				
		</td>
              </tr>
            </table>

        	
        </div>
        
        <div class="right_content">
       	 <div class="seach_line">
        	<span>
           	<input class="main_input" size="45" id="searchKeyword" placeholder="장소,광고주명,담당자명,연락처로 조회가 가능합니다."/>
            </span>
            <span class="main_button_box">
           	<button class="main_button" onclick="searchGo()"></button>
            </span>
		<span class="main_button2">
			<c:choose>
									<c:when test="${param.key == null}">
										<!-- 업체명만 색상변경 -->
										<span class="main_button2_type1_ov"><a href="./scdulList.do?key=C" >업체명</a></span>
										<span class="main_button2_type2"><a href="./scdulList.do?key=AD">광고주</a></span>
										<span class="main_button2_type3"><a href="./scdulList.do?key=P">담당자</a></span>
									</c:when>
									<c:when test="${param.key == ''}">
										<!-- 업체명만 색상변경 -->
										<span class="main_button2_type1_ov"><a href="./scdulList.do?key=C">업체명</a></span>
										<span class="main_button2_type2"><a href="./scdulList.do?key=AD" >광고주</a></span>
										<span class="main_button2_type3"><a href="./scdulList.do?key=P" >담당자</a></span>
									</c:when>
									<c:when test="${param.key == 'C'}">
										<!-- 업체명만 색상변경 -->
										<span class="main_button2_type1_ov"><a href="./scdulList.do?key=C">업체명</a></span>
										<span class="main_button2_type2"><a href="./scdulList.do?key=AD">광고주</a></span>
										<span class="main_button2_type3"><a href="./scdulList.do?key=P" >담당자</a></span>
									</c:when>
									<c:when test="${param.key == 'AD'}">
										<span class="main_button2_type1"><a href="./scdulList.do?key=C">업체명</a></span>
										<!-- 광고주만 색상변경 -->
										<span class="main_button2_type2_ov"><a href="./scdulList.do?key=AD">광고주</a></span>
										<span class="main_button2_type3"><a href="./scdulList.do?key=P" >담당자</a></span>
									</c:when>
									<c:when test="${param.key == 'P'}">
										<span class="main_button2_type1"><a href="./scdulList.do?key=C">업체명</a></span>
										<span class="main_button2_type2"><a href="./scdulList.do?key=AD">광고주</a></span>
										<!-- 담당자만 색상변경 -->
										<span class="main_button2_type3_ov"><a href="./scdulList.do?key=P" >담당자</a></span>
									</c:when>
								</c:choose>
		</span>
		<span>


			<form:form action="./scdulList.do" commandName="scdulVO" method="GET">
									<form:hidden path="key" value="${param.key}"/>
									<form:select path="status"  class="main_form" onchange="this.form.submit();">
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
								</form:form>
		</sapn>






          </div>
          







          <div class="right_calendar">
       	  

<form name="theForm">
						<%-- base table --%>
							<table cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="1236" height="665" class="right_calendar"   >
							<!--     <tr> -->
							<!--           <td align="right" width="1236"> -->
							<%--               <a href="View.jsp?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth-1}"/>&curDay=<c:out value="${curDay}"/>">◀</a> --%>
							<%--                   <c:out value="${curYear}"/> 年 &nbsp;&nbsp;  <c:out value="${curMonth}"/> 月  --%>
							<%--               <a href="View.jsp?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth+1}"/>&curDay=<c:out value="${curDay}"/>">▶</a> --%>
							<!--           </td> -->
							<!--           <td align="left"> -->
							<!--               <img src="images/monthly.gif" border=0> -->
							<!--           </td> -->
							<!--     </tr> -->
							    <tr height="3">
							        <td colspan="2"></td>
							    </tr>
							    <tr>
						          <td align="left" colspan="3" valign="top">
							          <%-- body table --%>
								          <table border="0" cellspacing="0" cellpadding="0">
							          		<tr>
							          			<td valign="top"  align="left">
								                  <%-- month outline table --%>
								                    <table class="week" border="0" cellspacing="0" cellpadding="0">
								                    <tr height="40" width="173">
								                          <td align=left class="week01">
								                              <span class="second_bold">S</span>unday
								                          </td>
								                        <td align=left  class="week02"><span class="second_bold">M</span>onday
</td>
								                        <td align=left class="week02"><span class="second_bold">T</span>uesday
</td>
								                        <td align=left class="week02"> <span class="second_bold">W</span>ednesday
</td>
								                        <td align=left class="week02"><span class="second_bold">T</span>hursday
</td>
								                        <td align=left class="week02"><span class="second_bold">F</span>riday
</td>
								                        <td align=left class="week03"><span class="second_bold">S</span>aturday
</td>
								                    </tr>
								                    <tr>
								                    	<td colspan=7 bgcolor=#000 height=3></td>
								                    </tr>
								                 
								                    <tr>
							                          <td colspan=7>
								                          <%-- month content table --%>
								                          <table class="left_calendar" border='0' cellspacing='1' cellpadding='0' bgcolor=#ededed class="right_calendar_content">
								                              <tr>
								                                <c:if test="${firstDayOfWeek != '1'}">
								                                  <%-- 해당 월의 가장 첫째줄에 있는 공백부분을 셈해서 처리한다.--%>
								                                  <c:forEach var="i" begin="1" end="${firstDayOfWeek-1}">
								                                    	<td width="173" height="132" class="uline" valign="top" align="right">
								                                    	</td>
								                                	</c:forEach>
								                                </c:if>
								                                <%-- 이 달의 끝날까지 메모의 제목과 날짜(숫자)를 출력한다 --%>
								                                <c:set var="dbIndex" value="0"/>
								                                  <c:forEach var="currentDay" begin="01" end="${lastDayOfMonth}">                                    
								                                  	<td bgcolor="#ffffff">
								                                        <table cellpadding="0" cellsping="0" border="0" width="173">
									                                        <tr>
									                                            <td height="10" width="173" class="uline" valign="top" align="left">
									                                                <!-- 일요일 -->
									                                                <%-- <c:if test="${((currentDay-(8-firstDayOfWeek)) % 7) == 1}">
									                                                    <FONT color="red">                                                    
									                                                        <c:out value="${currentDay}"/>
									                                                    </FONT>
									                                                </c:if>
									                                                <c:if test="${((currentDay-(8-firstDayOfWeek)) % 7) != 1}">
									                                                    <c:out value="${currentDay}"/>
									                                                </c:if> --%>
									                                                <c:choose>
									                                                    <c:when test="${((currentDay-(8-firstDayOfWeek)) % 7) == 1}">
									                                                        <!-- 일요일 -->
									                                                        <font color="red">                                                    
									                                                            <c:out value="${currentDay}"/>
									                                                        </font>
									                                                    </c:when>
									                                                    <c:otherwise>
									                                                        <c:out value="${currentDay}"/>
									                                                    </c:otherwise>
									                                                </c:choose>
									                                                <c:forEach var="selectCountDayList" items="${selectCountDayList}">
										                                            	<c:choose>
																							<c:when test="${fn:substring(selectCountDayList.meetingDate,6,8) >= 10}">
																								<c:set var="meetingDay" value="${fn:substring(selectCountDayList.meetingDate,6,8)}"/>
																							</c:when>
																							<c:otherwise>
																								<c:set var="meetingDay" value="${fn:substring(selectCountDayList.meetingDate,7,8)}"/>
																							</c:otherwise>
																						</c:choose>
									                                            		<c:if test="${currentDay == meetingDay}">
										                                            		<span>
										                                            			<a href="./selectDailyScdulList.do?meetingDate=${selectCountDayList.meetingDate}">${selectCountDayList.dayCount}</a>
										                                            		</span>
									                                            		</c:if>
										                                            </c:forEach>
									                                            </td>
									                                        </tr>
									                                        <tr>
									                                            <td height="131" width="173" valign="top">
									                                            <!-- month_query : DB 조회하는 list -->
										                                            <table>
										                                                <c:forEach var="dayIndex" items="${scdulList}">
																							<c:choose>
																								<c:when test="${fn:substring(dayIndex.meetingDate,6,8) >= 10}">
																									<c:set var="meetingDay" value="${fn:substring(dayIndex.meetingDate,6,8)}"/>
																								</c:when>
																								<c:otherwise>
																									<c:set var="meetingDay" value="${fn:substring(dayIndex.meetingDate,7,8)}"/>
																								</c:otherwise>
																							</c:choose>
										                                                    <c:if test="${currentDay == meetingDay}">
										                                                        <tr>
										                                                        	<td>
											                                                        	<span>
																											<c:choose>
																												<c:when test="${dayIndex.status eq 'TW'}">
																													전화대기
																												</c:when>
																												<c:when test="${dayIndex.status eq 'TC'}">
																													전화확인
																												</c:when>
																												<c:when test="${dayIndex.status eq 'TS'}">
																													전화확정
																												</c:when>
																												<c:when test="${dayIndex.status eq 'TR'}">
																													전화취소
																												</c:when>
																												<c:when test="${dayIndex.status eq 'TP'}">
																													전화완료
																												</c:when>
																												<c:when test="${dayIndex.status eq 'MW'}">
																													미팅대기
																												</c:when>
																												<c:when test="${dayIndex.status eq 'MC'}">
																													미팅확인
																												</c:when>
																												<c:when test="${dayIndex.status eq 'MS'}">
																													미팅확정
																												</c:when>
																												<c:when test="${dayIndex.status eq 'MR'}">
																													미팅취소
																												</c:when>
																												<c:when test="${dayIndex.status eq 'MP'}">
																													미팅완료
																												</c:when>
																											</c:choose>
																										</span>
												                                                        <a href="./selectScdulView.do?No=${dayIndex.no}">
												                                                        	<c:choose>
																												<c:when test="${param.key == null}">
																													 ${dayIndex.company}
																												</c:when>
																												<c:when test="${param.key == ''}">
																													 ${dayIndex.company}
																												</c:when>
																												<c:when test="${param.key == 'C'}">
																													 ${dayIndex.company}
																												</c:when>
																												<c:when test="${param.key == 'AD'}">
																													 ${dayIndex.adManager}
																												</c:when>
																												<c:when test="${param.key == 'P'}">
																													 ${dayIndex.member}
																												</c:when>
																											</c:choose>
												                                                        </a>
										                                                        		<c:set var="dbIndex" value='${dbIndex + 1}'/>
									                                                        		</td>
										                                                       </tr>
										                                                    </c:if>
										                                                </c:forEach>
										                                            </table>
								                                            	</td>
									                                        </tr>
								                                        </table>        
								                                    </td>
								                                    <%-- 만약 한주의 마지막날(토요일)이고 이 달의 마지막 날이 아니라면 다음 줄로 넘어간다. --%>
								                                    <c:if test="${((currentDay-(8-firstDayOfWeek)) % 7) == 0}">
						                                       	 </tr>
						                                         <tr>
							                                    	</c:if>
								                                  </c:forEach>
								                                <%-- 해당 월의 가장 마지막 줄에 있는 공백부분을 셈해서 처리한다.--%>
								                                <c:if test="${lastDayOfLastWeek != '7'}">
									                                <c:forEach var="i" begin="1" end="${7-lastDayOfLastWeek}">
									                                    <td width="173" height="131" class=uline valign=top align=right>
									                                    </td>
									                                </c:forEach>
								                                </c:if>                            
								                            </tr>
								                        </table>
								                        <%-- end month content table --%>
							                        	</td>
								                    </tr>
								                  </table>
								                  <%-- end month outline table --%>
							                  </td>
							          		</tr>
								          </table>
							        <%-- end body table --%>
							        </td>
							    </tr>
						        <tr height=10>
						        	<td></td>
						      	</tr>
							    <tr>
							        <td align=right></td>
							    </tr>
							</table>
						<%-- end base table --%>
						</form>
					

	</div>
        </div>
    
    
    
    </div>










</div>
<div class="tail">
<jsp:include page="tail.jsp"/>
</div>
</body>
</html>