<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<%
String name = request.getParameter("name");
String age = request.getParameter("age");
String[] hobby = request.getParameterValues("hobby");
if(age!=null){
	int num = Integer.parseInt(age);
	out.print(name + "(이)가 전송한 나이는 " + num + "이구나.  " + "<br>");
	
	if(num < 10){
		out.print("유아");
	}else if(num < 20){
		out.print("청소년");
	}else if(num >= 20 && num < 60){
		out.print("성인");
	}else if(num >= 60){
		out.print("노인");
	}
	out.print("<br>");
	
	out.print(name+"의 취미는 ");
	for(int i=0;i<hobby.length;i++){
		out.print(hobby[i] + " ");
	}
	out.print("입니다.");
}

%>

<form>
	나이 : <input type="text" name="age"><br>
	이름 : <input type="text" name="name"><br>
	취미 : 영화<input type="checkbox" name="hobby" value="영화">,
	음악감상 <input type="checkbox" name="hobby" value="음악감상">,
	게임 <input type="checkbox" name="hobby" value="게임"><br>
	<button>나이 전송</button>
</form>
</body>
</html>