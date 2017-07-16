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
		
		$(".deleteDeeplyBag").click(function(){
			
			//获取要进行删除的包裹名称
			var bagName = $(this).parents("tr").children("td:eq(0)").text();
			
			//第一重：确认
			var flag = window.confirm("这是一个危险的操作，您确定要删除["+bagName+"]这个包裹吗?");
			
			if(flag){
				
				//第二重：确认
				var flag2 = window.confirm("这个包裹下存在问题，您确定要删除["+bagName+"]这个包裹，以及所有问题吗?");
				
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
	
		[设计调查]
		
		<table class="dataTable">
			<tr>
				<td colspan="4">调查基本信息</td>
			</tr>
			<tr>
				<td><img src="${survey.logoPath }"></td>
				<td>${survey.surveyName }</td>
				<!-- 跳转表单UI要使用@RequestMapping而不是mvc-controller -->
				<td><a href="guest/bag/toBagUI/${survey.surveyId }">创建包裹</a></td>
				<td><a href="guest/bag/toAdjustUI/${survey.surveyId }">调整包裹顺序</a></td>
			</tr>
		</table>
		<table class="dataTable">
			<tr>
				<td colspan="2">基本信息</td>
			</tr>

			<c:if test="${empty survey.bagSet }">
				<tr>
					<td colspan="2">该调查没有包裹存在，请创建包裹</td>
				</tr>
			</c:if>
			<c:if test="${!empty survey.bagSet }">
				<tr>
					<td>包裹名称</td>
					<td>基本操作</td>
				</tr>
				<c:forEach items="${survey.bagSet }" var="bag">
					<tr>
						<td>${bag.bagName }</td>
						<td>
							<a href="guest/bag/deleteBag/${bag.bagId }/${survey.surveyId}">删除包裹</a>
							<a href="guest/bag/toEditBag/${bag.bagId }">更新包裹</a>
							<a href="guest/question/toAddQuestion/${bag.bagId }/${survey.surveyId}">创建问题</a>
							<a class="deleteDeeplyBag" href="guest/bag/deleteDeeplyBag/${bag.bagId }/${survey.surveyId}">深度删除包裹</a>
							
							<%-- 
								${bag.bagId } : 用于修改包裹外键时，作为where条件
								${survey.surveyId} ： 在列表显示时，用于判断是否为当前调查（当前调查不能作为目标调查使用）
								省略默认页码：默认第一页
								当前用户：userId  从session中获取用户对象，用户主键值；
								我未完成调查：completed值默认false ;
							 --%>
							<a href="guest/bag/showMoveAndCopySurveyList/${bag.bagId }/${survey.surveyId}">移动/复制包裹</a>
						</td>
					</tr>
					<tr>
						<td><!-- 迭代问题信息；问题类表缩进一个单元格 --></td>
						<td>
							
							<table class="dataTable">
								
								<c:if test="${empty bag.questionSet }">									
									<tr>
										<td colspan="2">该包裹没有问题存在，请创建问题</td>
									</tr>
								</c:if>
								<c:if test="${!empty bag.questionSet }">
									<tr>
										<td>问题详情</td>
										<td>问题操作</td>
									</tr>
									<c:forEach items="${bag.questionSet }" var="question">
										<tr>
											<td>
												${question.questionName } 
												<c:if test="${question.questionType==0 }">
													<c:forEach items="${question.questionOptionsToArr }" var="option">
														<input type="radio"> ${option }
													</c:forEach>
												</c:if>
												
												<c:if test="${question.questionType==1 }">
													<c:forEach items="${question.questionOptionsToArr }" var="option">
														<input type="checkbox"> ${option }
													</c:forEach>
												</c:if>
												
												<c:if test="${question.questionType==2 }">
													<input type="text" class="longInput">
												</c:if>
											</td>
											<td>
												<a href="guest/question/deleteQuestion/${question.questionId }/${survey.surveyId}">删除问题</a>
												<a href="guest/question/toUpdateUI/${question.questionId }/${survey.surveyId}">更新问题</a>												
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="3">
						<a href="guest/survey/completeSurvey/${survey.surveyId}">完成调查</a>
					</td>
				</tr>
			</c:if>
			
		</table>
	
	</div>
	
	<%@ include file="/res_jsp/guest_bottom.jsp" %>

</body>
</html>