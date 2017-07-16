<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 静态包含，路径必须以斜杠开头。斜杠表示上下文路径request.getContextPath();  pageContext.request.contextPath -->
<%@ include file="/res_jsp/base.jsp" %>

<script type="text/javascript">

	$(function(){
		
		$(".deleteDeeply").click(function(){
			
			//获取要进行删除的调查名称
			var surveyName = $(this).parents("tr").children("td:eq(1)").text();
			
			//第一重：确认
			var flag = window.confirm("这是一个危险的操作，您确定要删除["+surveyName+"]这个调查吗?");
			
			if(flag){
				
				//第二重：确认
				var flag2 = window.confirm("这个调查下存在包裹，您确定要删除["+surveyName+"]这个调查，以及所有包裹吗?");
				
				if(!flag2){
					return false ;
				}
				
			}else{
				return false ;
			}		
			
		});
		
	});


</script>

</head>
<body>

	<%@ include file="/res_jsp/guest_top.jsp" %>
	
	<div id="mainDiv" class="borderDiv">
	
		[我未完成调查]
		
		<table class="dataTable">
			
			<c:if test="${empty page.dataList }">
				<tr>
					<td colspan="7">没有查询到我未完成的调查</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty page.dataList }">
				<tr>
					<td>ID</td>
					<td>调查名称</td>
					<td>Logo图片</td>
					<td colspan="4">操作</td>
				</tr>
				<c:forEach items="${page.dataList }" var="survey">
					<tr>
						<td>${survey.surveyId } </td>
						<td>${survey.surveyName }</td>
						<td> <img src="${survey.logoPath }"> </td>
						
						<td><a href="guest/survey/surveyDesign/${survey.surveyId }">设计</a></td>
						<td><a href="guest/survey/deleteSurvey/${survey.surveyId }/${page.pageNo}">删除</a></td>
						<td><a href="guest/survey/editSurveyUI/${survey.surveyId }/${page.pageNo}">更新</a></td>
						<td style="background-color: black;">
							<a class="deleteDeeply" href="guest/survey/deleteDeeplySurvey/${survey.surveyId }/${page.pageNo}" style="color: yellow;">深度删除</a>
						</td>			
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="7">
						<c:set var="targetUrl" value="guest/survey/showMyUnCompletedSurvey" scope="page"/>
						<%@ include file="/res_jsp/navigator.jsp" %>					
					</td>
				</tr>
				
			</c:if>
		</table>
	
	</div>
	
	<%@ include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>