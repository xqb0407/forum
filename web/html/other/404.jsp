<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>404</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>
<%@include file="../head/header.jsp"%>


<div class="layui-container fly-marginTop">
	<div class="fly-panel">
	  <div class="fly-none">
	    <h2><i class="iconfont icon-404"></i></h2>
	    <p>页面或者数据被<a href="http://fly.layui.com/u/336" target="_blank"> 纸飞机 </a>运到火星了，啥都看不到了…</p>
	  </div>
	</div>
</div>

<%@include file="../footer/footer.jsp"%>

<script src="../../res/layui/layui.js"></script>
<%--<script>--%>
<%--layui.cache.page = '';--%>
<%--layui.cache.user = {--%>
<%--  username: '游客'--%>
<%--  ,uid: -1--%>
<%--  ,avatar: '../../res/images/avatar/00.jpg'--%>
<%--  ,experience: 123--%>
<%--  ,sex: '男'--%>
<%--};--%>
<%--layui.config({--%>
<%--  version: "3.0.0"--%>
<%--  ,base: '../../res/mods/'--%>
<%--}).extend({--%>
<%--  fly: 'index'--%>
<%--}).use('fly');--%>
<%--</script>--%>

</body>
</html>