<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户主页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body style="margin-top: 65px;">
<%--头部--%>
<%@include file="../head/header.jsp"%>

<div class="fly-home fly-panel" style="background-image: url();">
  <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">
  <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
  <h1 id="hTop">
    ${sessionScope.User.nickname}
    <c:choose>
      <c:when test="${sessionScope.User.sex eq 1}">
        <i class="iconfont icon-nan"></i>
      </c:when>
      <c:otherwise>
        <i class="iconfont icon-nv"></i>
      </c:otherwise>
    </c:choose>

  </h1>

  <p style="padding: 10px 0; color: #5FB878;">认证信息：${sessionScope.User.username}</p>

  <p class="fly-home-info">
    <i class="iconfont icon-shijian"></i>
    <span><fmt:formatDate value="${sessionScope.User.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate> 加入</span>


    <i class="iconfont icon-chengshi"></i><span>来自${sessionScope.User.city}</span>
  </p>

  <p class="fly-home-sign">${sessionScope.User.signature}</p>



</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6 fly-home-jie">
      <div class="fly-panel">
        <h3 class="fly-panel-title">贤心 最近的提问</h3>
        <ul class="jie-row">
          <li>
            <span class="fly-jing">精</span>
            <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
            <i>刚刚</i>
            <em class="layui-hide-xs">1136阅/27答</em>
          </li>
        </ul>
      </div>
    </div>
    
    <div class="layui-col-md6 fly-home-da">
      <div class="fly-panel">
        <h3 class="fly-panel-title">贤心 最近的回答</h3>

      </div>
    </div>
  </div>
</div>

<%@include file="../footer/footer.jsp"%>

<script src="../../res/layui/layui.js"></script>
<script>
layui.cache.page = 'user';
// layui.cache.user = {
//   username: '游客'
//   ,uid: -1
//   ,avatar: '../../res/images/avatar/00.jpg'
//   ,experience: 83
//   ,sex: '男'
// };
layui.config({
  version: "3.0.0"
  ,base: '../../res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>