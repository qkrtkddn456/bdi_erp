<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class="container">
	<form action="<%=rPath%>/views/test/testInsertOk.jsp" onsubmit="return checkval()">
	<fieldset>
		<legend>test 유저 등록</legend>
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="tBirth" required></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea name="tContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>테스트 유저 등록</button>
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
</div>
<script>
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
</body>
</html>