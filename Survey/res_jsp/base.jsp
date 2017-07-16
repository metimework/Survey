<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 端口和上下文路径中间不能再增加斜线；因为上下文路径自带斜线；
	请求路径中如果有多余斜线，对有些资源访问是没问题，也可以访问；
	但是，对于session可能会有影响，路径中有多余斜线，导致session失效了。
 -->
<base href="${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/">
<link rel="stylesheet" type="text/css" href="res_static/style.css"/>
<script type="text/javascript" src="res_static/jquery-1.7.2.js"></script>
