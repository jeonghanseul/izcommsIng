<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./head.jsp"/>
	<div>
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
						${memberVO.id}
					</td>
				</tr>
				<tr>
					<td>
						성명
					</td>
					<td>
						${memberVO.name}
					</td>
				</tr>
				<tr>
					<td>
						주소
					</td>
					<td>
						${memberVO.address}
						${memberVO.detailAddress}
					</td>
				</tr>
				<tr>
					<td>
						연락처
					</td>
					<td>
						${memberVO.telNo}
					</td>
				</tr>
				<tr>
					<td>
						이메일
					</td>
					<td>
						${memberVO.email}
					</td>
				</tr>
				<tr>
					<td>
						회원등급
					</td>
					<td>
						<c:choose>
							<c:when test="${memberVO.grade eq 1}">사원</c:when>
							<c:when test="${memberVO.grade eq 2}">부팀장</c:when>
							<c:when test="${memberVO.grade eq 3}">팀장</c:when>
							<c:when test="${memberVO.grade eq 4}">센터장</c:when>
							<c:when test="${memberVO.grade eq 999}">관리자</c:when>
							<c:otherwise>회원등급이 없습니다.</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						회원그룹
					</td>
					<td>
						<c:choose>
							<c:when test="${memberVO.memberGroup eq 'T0'}">Team0</c:when>
							<c:when test="${memberVO.memberGroup eq 'T1'}">Team1</c:when>
							<c:when test="${memberVO.memberGroup eq 'T2'}">Team2</c:when>
							<c:when test="${memberVO.memberGroup eq 'T3'}">Team3</c:when>
							<c:when test="${memberVO.memberGroup eq 'T4'}">Team4</c:when>
							<c:when test="${memberVO.memberGroup eq 'T5'}">Team5</c:when>
							<c:when test="${memberVO.memberGroup eq 'T6'}">Team6</c:when>
							<c:when test="${memberVO.memberGroup eq 'T7'}">Team7</c:when>
							<c:when test="${memberVO.memberGroup eq 'T8'}">Team8</c:when>
							<c:when test="${memberVO.memberGroup eq 'T9'}">Team9</c:when>
							<c:when test="${memberVO.memberGroup eq 'E1'}">Etc1</c:when>
							<c:when test="${memberVO.memberGroup eq 'E2'}">Etc2</c:when>
							<c:when test="${memberVO.memberGroup eq 'E3'}">Etc3</c:when>
							<c:when test="${memberVO.memberGroup eq 'E4'}">Etc4</c:when>
							<c:when test="${memberVO.memberGroup eq 'E5'}">Etc5</c:when>
							<c:when test="${memberVO.memberGroup eq 'E6'}">Etc6</c:when>
							<c:when test="${memberVO.memberGroup eq 'E7'}">Etc7</c:when>
							<c:when test="${memberVO.memberGroup eq 'E8'}">Etc8</c:when>
							<c:when test="${memberVO.memberGroup eq 'E9'}">Etc9</c:when>
							<c:otherwise>
								회원 그룹이 없습니다.
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td>
						${memberVO.joinDate}
					</td>
				</tr>
				<tr>
					<td>퇴사일</td>
					<td>
						${memberVO.refireDate}
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<a href="./modifyMember.do?id=${memberVO.id}">수정</a>
			<a href="./selectMemberList.do">취소</a>
		</div>
	</div>
	<jsp:include page="./tail.jsp"/>
</body>
</html>