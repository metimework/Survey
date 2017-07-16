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


		<!-- 
			由于设置了<base>标签，那么，页面上资源路径可以使用绝对路径（basePath+资源路径）来获取资源。
			前台页面路径不能以斜杠开头，否则表示从服务器的根下来访问资源。
			而服务器的根路径：
				D:\Java\workspace\workspace160808EE\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ROOT
				D:\Server\apache-tomcat-6.0.16\webapps\ROOT
		 -->
		<form action="guest/user/login" method="post">
			
			<table class="formTable">
			
				<c:if test="${exception!=null }">
					<tr>
						<td colspan="2">${exception.message }</td>
					</tr>
				</c:if>
				
				
				<tr>
					<td>用户名称</td>
					<td>
						<input type="text" name="userName" value="Tom2012" class="longInput" />
					</td>
				</tr>
				<tr>
					<td>用户密码</td>
					<td>
						<input type="password" name="userPwd" value="123123" class="longInput"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="登录"/>
					</td>
				</tr>			
			</table>
		
			
		</form>

	</div>
	
	<%@ include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>