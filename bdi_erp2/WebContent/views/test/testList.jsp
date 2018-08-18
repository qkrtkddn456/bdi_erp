<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class="container">
	<h4>테스트 유저리스트</h4>
	<table class="table table-bordred table-hover">
		<thead>
			<tr>
				<th>테스트 번호</th>
				<th>아이디</th>
				<th>생일</th>
				<th>Content</th>
			</tr>
		</thead>
		<tbody>
<%
Connection con = DBConnection.getCon();
String sql = "select tNo, tId, tBirth, tContent";
sql += " from test";

PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
	<tr>
		<td>
			<a href="<%=rPath%>/views/test/testView.jsp?uiNo=<%=rs.getInt("tNo")%>">
			<%=rs.getInt("tNo")%>
			</a>
		</td>
		<td><%=rs.getString("tId")%></td>
		<td><%=rs.getInt("tBirth")%></td>
		<td><%=rs.getString("tContent")%></td>
	</tr>
<%
}
rs.close();
ps.close();
DBConnection.close();
%>
		</tbody>
	</table>
</div>
</body>
</html>