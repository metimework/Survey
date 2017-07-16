<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 静态包含，路径必须以斜杠开头。斜杠表示上下文路径request.getContextPath();  pageContext.request.contextPath -->
<%@ include file="/res_jsp/base.jsp" %>
</head>
<body>

	<div id="mainDiv" class="borderDiv">
	
		[出错啦!]
		<br>
		<br>
		<c:if test="${exception!=null }"> ${exception.message }</c:if>
		
		<br><br>
		<button onclick="javascript:history.back();">返回</button>
	</div>
	
</body>
</html>