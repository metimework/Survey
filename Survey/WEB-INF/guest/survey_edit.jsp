<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 静态包含，路径必须以斜杠开头。斜杠表示上下文路径request.getContextPath();  pageContext.request.contextPath -->
<%@ include file="/res_jsp/base.jsp" %>
</head>
<body>

	<%@ include file="/res_jsp/guest_top.jsp" %>
	
	<div id="mainDiv" class="borderDiv">
	
		[编辑调查]
		
		
		<!-- 
			java.lang.IllegalStateException: Neither BindingResult nor plain target object for bean name 'command' available as request attribute
			表单回显，需要从request域中查询叫做command属性对象
			modelAttribute="command" 默认值；如果不是默认值，必须指定这个属性。
			
			org.springframework.web.multipart.MultipartException: The current request is not a multipart request
			涉及文件上传：内容类型必须：enctype="multipart/form-data"
		 -->
		<form:form action="guest/survey/updateSurvey" method="post" modelAttribute="survey" enctype="multipart/form-data">
			
			<!-- 注意：隐含域数据 -->
			<form:hidden path="surveyId"/>
			<form:hidden path="userId"/>
			<form:hidden path="logoPath"/>	 <!-- 修改调查对象时，如果不修改图片，保证，原来图片不变 -->		
			
			<input type="hidden" name="pageNoStr" value="${pageNo }"/>
			
			<table class="formTable">
				<c:if test="${exception!=null }">
					<tr>
						<td colspan="2">${exception.message }</td>
					</tr>
				</c:if>
				<tr>
					<td>调查名称</td>
					<td>
						<form:input path="surveyName" cssClass="longInput"/>
					</td>
				</tr>
				<tr>
					<td>调查图片</td>
					<td>
						<img src="${survey.logoPath }">
					</td>
				</tr>
				<tr>
					<td>上传新图片</td>
					<td>
						<!-- MultiPartFile -->
						<input type="file" name="logoFile"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="更新">
					</td>
				</tr>
			</table>
			
		</form:form>
	
	</div>
	
	<%@ include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>