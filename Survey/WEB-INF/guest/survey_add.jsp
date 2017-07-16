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

	<%@ include file="/res_jsp/guest_top.jsp" %>
	
	<div id="mainDiv" class="borderDiv">
	
		[创建调查]
		
		<form action="guest/survey/save" method="post" enctype="multipart/form-data">
			
			<table class="formTable">
				<c:if test="${exception!=null }">
					<tr>
						<td colspan="2">${exception.message }</td>
					</tr>
				</c:if>
				<tr>
					<td>调查名称</td>
					<td>
						<input type="text" name="surveyName" class="longInput"/>
					</td>
				</tr>
				<tr>
					<td>选择Logo图片</td>
					<td>
						<!-- name属性值不能是survey对象的属性名称；因为上传是一个图片文件，而Survey对象中的logoPath是字符串属性，赋值为文件名称 -->
						<input type="file" name="logoFile"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="保存"/>
					</td>
				</tr>
				
			</table>
			
		</form>
	
	</div>
	
	<%@ include file="/res_jsp/guest_bottom.jsp" %>


</body>
</html>