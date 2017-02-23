<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%> 
	<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.


	Class.forName("com.mysql.jdbc.Driver"); 
	String url = "jdbc:mysql://222.239.254.244:3306/listdb"; 
	String id = "root";
	String pass = "dkdlwm1@#";


	String adGroup = request.getParameter("adGroup"); //write.jsp에서 name에 입력한 데이터값
	String bizName = request.getParameter("bizName"); //write.jsp에서 name에 입력한 데이터값
	String bizType = request.getParameter("bizType"); //write.jsp에서 title에 입력한 데이터값
	String bizUser = request.getParameter("bizUser"); //write.jsp에서 memo에 입력한 데이터값
	String bizTelNo = request.getParameter("bizTelNo"); //write.jsp에서 memo에 입력한 데이터값
	String bizArea = request.getParameter("bizArea"); //write.jsp에서 memo에 입력한 데이터값
	String bizEmail = request.getParameter("bizEmail"); //write.jsp에서 memo에 입력한 데이터값
	String bizCounsel = request.getParameter("bizCounsel"); //write.jsp에서 memo에 입력한 데이터값
	String bizAsk = request.getParameter("bizAsk"); //write.jsp에서 memo에 입력한 데이터값
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "INSERT INTO BIZMANAGER(AD_GROUP, BIZ_NAME, BIZ_TYPE, BIZ_USER, BIZ_TEL_NO, BIZ_AREA, BIZ_EMAIL, BIZ_COUNSEL, BIZ_ASK, BIZ_DATE) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, adGroup);
		pstmt.setString(2, bizName);
		pstmt.setString(3, bizType);
		pstmt.setString(4, bizUser);
		pstmt.setString(5, bizTelNo);
		pstmt.setString(6, bizArea);
		pstmt.setString(7, bizEmail);
		pstmt.setString(8, bizCounsel);
		pstmt.setString(9, bizAsk);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>
</body>
</html>