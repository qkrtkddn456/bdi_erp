<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<%
String tId = request.getParameter("tId");
String tPwd = request.getParameter("tPwd");
String tContent = request.getParameter("tContent");
int tBirth = Integer.parseInt(request.getParameter("tBirth"));

Connection con = DBConnection.getCon();
String sql = "update test set tId=?,";
sql += " tPwd=?,";
sql += " tContent=?,";
sql += " tBirth=?,";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,tId);
ps.setString(2,tPwd);
ps.setString(3,tContent);
ps.setInt(4,tBirth);
int cnt = ps.executeUpdate();
DBConnection.close();
if(cnt==1){
%>
<script>
	alert("테스트 유저 수정이 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/test/testList.jsp";
</script>
<%	
}
%>
</body>
</html>