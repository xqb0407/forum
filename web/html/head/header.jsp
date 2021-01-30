<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="fly-header layui-bg-cyan">
    <div class="layui-container">
        <a class="fly-logo" href="JavaScript:;">
            <img src="/res/images/logo.png" alt="Herther" height="50" width="250">
        </a>
        <ul class="layui-nav fly-nav layui-hide-xs">
            <!-- <li class="layui-nav-item layui-this">
              <a href="/"><i class="iconfont icon-jiaoliu"></i>交流</a>
            </li>
            <li class="layui-nav-item">
              <a href="case/case.html"><i class="iconfont icon-iconmingxinganli"></i>案例</a>
            </li>
            <li class="layui-nav-item">
              <a href="http://www.layui.com/" target="_blank"><i class="iconfont icon-ui"></i>框架</a>
            </li> -->
<%--            ${User}--%>
        </ul>

        <ul class="layui-nav fly-nav-user" id="navItem">
            <c:choose>
                <c:when test="${empty User}">
                    <!-- 未登入的状态 -->
                    <li class="layui-nav-item">
                        <a class="iconfont icon-touxiang layui-hide-xs" href="/user/login.jsp"></a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/user/login.jsp">登入</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="/user/reg.jsp">注册</a>
                    </li>
                </c:when>
                <c:otherwise>
                <!-- 登入后的状态 -->
                <li class="layui-nav-item">
                    <a class="fly-nav-avatar" href="javascript:;">
                        <cite class="layui-hide-xs">${User.nickname}</cite>
<%--                        <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>--%>
<%--                        <i class="layui-badge fly-badge-vip layui-hide-xs">VIP3</i>--%>
                        <img src="${sessionScope.User.face}">
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="http://localhost:8080/html/user/set.jsp"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
                        <dd><a href="http://localhost:8080/html/user/Userindex.jsp"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
                        <dd><a href="http://localhost:8080/html/user/home.jsp"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
                        <hr style="margin: 5px 0;">
                        <dd><a href="/user/logout/" style="text-align: center;">退出</a></dd>
                    </dl>
                </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
</div>
<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <li class="layui-hide-xs layui-this"><a href="/">首页</a></li>
            <li><a href="jie/index.html">提问</a></li>
            <li><a href="jie/index.html">分享<span class="layui-badge-dot"></span></a></li>
            <li><a href="jie/index.html">讨论</a></li>
            <li><a href="jie/index.html">建议</a></li>
            <li><a href="jie/index.html">公告</a></li>
            <li><a href="jie/index.html">动态</a></li>
            <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
            <c:choose>
                <c:when test="${!empty User}">
                    <!-- 用户登入后显示 -->
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user/index.html">我发表的贴</a></li>
                    <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a href="user/index.html#collection">我收藏的贴</a></li>
                </c:when>
            </c:choose>
        </ul>

        <div class="fly-column-right layui-hide-xs">
            <span class="fly-search"><i class="layui-icon"></i></span>
            <a href="jie/add.jsp" class="layui-btn">发表新帖</a>
        </div>
        <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
            <a href="http://localhost:8080/html/jie/add.jsp" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>
<script src="../../res/layui/jquery-3.5.1.js"></script>
<%--<script>--%>
<%--    var item = JSON.parse(window.sessionStorage.getItem("User"));--%>
<%--    var Unav = $('#navItem');--%>
<%--    var ctx ="";--%>
<%--    if (item == null){--%>
<%--        ctx += "<li class='layui-nav-item'>"--%>
<%--        ctx += "<a class='iconfont icon-touxiang layui-hide-xs' href='login.do'></a>"--%>
<%--        ctx += "</li>"--%>
<%--        ctx += "<li class='layui-nav-item'>"--%>
<%--        ctx += " <a href='/user/login.jsp'>登入</a></li>"--%>
<%--        ctx += "<li class='layui-nav-item'>"--%>
<%--        ctx += "<a href='/user/reg.jsp\'>注册</a></li>"--%>
<%--        Unav.append(ctx);--%>
<%--    }else{--%>
<%--        ctx +="<li class='layui-nav-item'>";--%>
<%--        ctx +="<a class='fly-nav-avatar' href='javascript:;'>"--%>
<%--        ctx +="<cite class='layui-hide-xs'>"+item.username+"</cite>"--%>
<%--        ctx +="<img src='https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg'></a>"--%>
<%--        ctx +="<dl class='layui-nav-child'>"--%>
<%--        ctx +="<dd><a href='/user/set.jsp'><i class='layui-icon'>&#xe620;</i>基本设置</a></dd>"--%>
<%--        ctx +="<dd><a href='user/message.html'><i class='iconfont icon-tongzhi' style='top: 4px;'></i>我的消息</a></dd>"--%>
<%--        ctx +=" <dd><a href='user/home.jsp'><i class='layui-icon' style='margin-left: 2px; font-size: 22px;'>&#xe68e;</i>我的主页</a></dd>"--%>
<%--        ctx +="<hr style='margin: 5px 0;'>"--%>
<%--        ctx +="<dd><a href='/user/logout/' style='text-align: center;'>退出</a></dd></dl></li>"--%>
<%--        Unav.append(ctx);--%>
<%--    }--%>
<%--</script>--%>

