<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
String m_id = request.getParameter("m_id");
String m_age = request.getParameter("m_age");

ResultSet rs = null;  // 조회결과의 더미
Statement stmt = conn.createStatement(); // SQL을 실을 트럭준비

String sql = "SELECT m_id,m_age FROM member_tbl WHERE m_id='";
sql += m_id + "'";
rs = stmt.executeQuery(sql); // 트럭에 짐을 실어서 다리건너 부어 넣기.

String m_id2 ="";
while (rs.next()) {
	m_id2 = rs.getString("m_id");
}
if (!m_id.equals(m_id2)) {
	out.println("없는 아이디입니다..");
	stmt.close();
	conn.close();
} else {
	String sql1 = "DELETE FROM member_tbl WHERE m_id='";
	sql1 += m_id + "' ";
	stmt.executeUpdate(sql1);
	
	stmt.close();
	conn.close();
	out.println("<h2>탈퇴가 완료되었습니다.</h2>");
}
%>
<form method="post" action="Project_Login.jsp">
	<p> <input type="submit" value="로그인페이지">
</form>
</body>
</html>