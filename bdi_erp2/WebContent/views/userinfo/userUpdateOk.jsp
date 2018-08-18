<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<%
String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");
int uiAge = Integer.parseInt(request.getParameter("uiAge"));
int diNo = Integer.parseInt(request.getParameter("diNo"));
int uiNo = Integer.parseInt(request.getParameter("uiNo"));

Connection con = DBConnection.getCon();
String sql = "update user_info set uiName=?,";
sql += " uiId=?,";
sql += " uiPwd=?,";
sql += " uiDesc=?,";
sql += " uiAge=?,";
sql += " diNo=?";
sql += " where uiNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiId);
ps.setString(3,uiPwd);
ps.setString(4,uiDesc);
ps.setInt(5, uiAge);
ps.setInt(6, diNo);
ps.setInt(7, uiNo);
int cnt = ps.executeUpdate();
DBConnection.close();
if(cnt==1){
%>
<script>
	alert("수정이 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/userinfo/userList.jsp";
</script>
<%	
}
%>
</body>
</html>