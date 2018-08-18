<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body><div class="container">
<%
int tNo = Integer.parseInt(request.getParameter("uiNo"));
String tId = "";
int tBirth = 0;
String tContent = "";

Connection con = DBConnection.getCon();
String sql = "select tNo, tId, tBirth, tContent from test";
sql += " where tNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, tNo);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	tId = rs.getString("tId");
	tBirth = rs.getInt("tBirth");
	tContent = rs.getString("tContent");
}
%>
<form action="<%=rPath%>/views/test/testUpdateOk.jsp" onsubmit="return checkval()">
	<fieldset>
		<legend>test 유저 수정</legend>
		<table class="table table-bordered">
			<tr>
				<th>테스트 번호</th>
				<td><%=tNo%></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tId" value="<%=tId%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="tBirth" value="<%=tBirth%>" required></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea name="tContent"><%=tContent%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>테스트 유저 수정</button>
					<button type="button" onclick="deleteTest()">테스트 유저 삭제</button>
				</td>
			</tr>
		</table>
	</fieldset>
	<input type="hidden" name="tNo" value="<%=tNo%>">
	</form>
<script>
function deleteTest(){
	if(confirm("삭제하시겠습니까?")){
		location.href="<%=rPath%>/views/test/testDeleteOk.jsp?uiNo=<%=tNo%>";
	}
}
	function checkval(){
		var objs = document.querySelectorAll('input');
		for(var i=0;i<objs.length;i++){
			if(objs[i].type!="date"){
				if(objs[i].value.length<1 || objs[i].value.length>100){
					alert(objs[i].name + '의 값을 확인해 주세요');
					objs[i].focus();
					return false;
				}
			}
		}
		var obj = document.querySelector('textarea');
		if(obj.value.length>30000){
			alert('Content는 30000자 이상일 수  없습니다.');
			objs.focus();
			return false;
		}
		return true;
	}
</script>
</div>
</body>
</html>