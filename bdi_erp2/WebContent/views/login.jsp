<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<form>
<table border="1">
	<tr>
		<th>이름</th>
		<td><input type="text" name="uiName"></td>
	</tr>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="uiId"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="uiPwd"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><select name="trans">
			<option value="남">남</option>
			<option value="여">여</option>
		</select></td>
	</tr>
	<tr>
		<th>취미</th>
		<td><input type="checkbox" name="hobby" value="영화">영화
		<input type="checkbox" name="hobby" value="독서">독서
		<input type="checkbox" name="hobby" value="게임">게임</td>
	</tr>
	<tr>
		<th colspan="2"><button>로그인</button></th>
	</tr>
</table>
</form>
</body>
</html>