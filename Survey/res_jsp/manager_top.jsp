<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="atguigu" uri="http://www.atguigu.com/MyTag" %>
    
<div id="logoDiv" class="borderDiv">尚硅谷在线调查系统后台</div>
<div id="topDiv" class="borderDiv">
	<c:if test="${sessionScope.loginAdmin == null }">
		[<a href="manager/admin/toLoginUI">登录</a>] 
	</c:if>
	<c:if test="${sessionScope.loginAdmin != null }">
		[欢迎管理员,${sessionScope.loginAdmin.adminName}] 
		[<a href="manager/admin/logout">退出</a>] 
		
		<!-- <c:if test=""></c:if> -->
		<% 
			//out.print("[<a href="manager/statistics/showStatisticsList">统计调查</a>] ");
		%>
		
		<atguigu:auth servletPath="manager/statistics/showStatisticsList">
			[<a href="manager/statistics/showStatisticsList">统计调查</a>]
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/res/showList">
			[<a href="manager/res/showList">资源列表</a>] 
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/auth/toAddUI">
			[<a href="manager/auth/toAddUI">创建权限</a>]	
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/auth/showList">
			[<a href="manager/auth/showList">权限列表</a>]	
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/role/toAddUI">
			[<a href="manager/role/toAddUI">创建角色</a>]	
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/role/showList">
			[<a href="manager/role/showList">角色列表</a>]	
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/admin/toAddUI">
			[<a href="manager/admin/toAddUI">创建账号</a>]
		</atguigu:auth>
		
		<atguigu:auth servletPath="manager/admin/showList">
			[<a href="manager/admin/showList">账号列表</a>]
		</atguigu:auth>

		<atguigu:auth servletPath="manager/log/showLogList">
			[<a href="manager/log/showLogList">查看日志</a>] 
		</atguigu:auth>
		
			
	</c:if>
	
	 [<a href="manager/admin/toMainUI">首页</a>]	
</div>

