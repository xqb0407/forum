<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>基于 layui 的极简社区页面模版</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../res/layui/css/layui.css">
  <link rel="stylesheet" href="../res/css/global.css">
</head>
<body>
<%--头部--%>
<%@include file="head/header.jsp"%>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel">
        <div class="fly-panel-title fly-filter">
          <a>置顶</a>
          <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
        </div>
        <ul class="fly-list" id="stick">


        </ul>
      </div>

      <div class="fly-panel" style="margin-bottom: 0;">
        
        <div class="fly-panel-title fly-filter">
          <a href="" class="layui-this">综合</a>
<%--          <span class="fly-mid"></span>--%>
<%--          <a href="">精华</a>--%>
<%--          <span class="fly-filter-right layui-hide-xs">--%>
<%--            <a href="" class="layui-this">按最新</a>--%>
<%--            <span class="fly-mid"></span>--%>
<%--            <a href="">按热议</a>--%>
<%--          </span>--%>
        </div>

        <ul class="fly-list" id="Arteity">
<%--          <li>--%>
<%--            <a href="user/home.html" class="fly-avatar">--%>
<%--              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="贤心">--%>
<%--            </a>--%>
<%--            <h2>--%>
<%--              <a class="layui-badge">动态</a>--%>
<%--              <a href="jie/detail.jsp">基于 layui 的极简社区页面模版</a>--%>
<%--            </h2>--%>
<%--            <div class="fly-list-info">--%>
<%--              <a href="user/home.html" link>--%>
<%--                <cite>贤心</cite>--%>
<%--              </a>--%>
<%--              <span>刚刚</span>--%>
<%--              <span class="fly-list-nums">--%>
<%--                <i class="iconfont icon-pinglun1" title="回答"></i> 66--%>
<%--              </span>--%>
<%--            </div>--%>
<%--          </li>--%>
        </ul>
        <div style="text-align: center">
          <div class="laypage-main">
            <a href="/html/jie/index.html" class="laypage-next">更多求解</a>
          </div>
        </div>

      </div>
    </div>
    <div class="layui-col-md4">

      <div class="fly-panel">
        <h3 class="fly-panel-title">温馨通道</h3>
        <ul class="fly-panel-main fly-list-static" id="aisle">
<%--          <li>--%>
<%--            <a href="http://fly.layui.com/jie/5366/" target="_blank">--%>
<%--              layui 常见问题的处理和实用干货集锦--%>
<%--            </a>--%>
<%--          </li>--%>
        </ul>
      </div>


      <div class="fly-panel fly-signin">
        <div class="fly-panel-title">
          签到
          <i class="fly-mid"></i> 
          <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
          <i class="fly-mid"></i> 
          <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
          <span class="fly-signin-days">已连续签到<cite>16</cite>天</span>
        </div>
        <div class="fly-panel-main fly-signin-main">
          <button class="layui-btn layui-btn-danger" id="LAY_signin">今日签到</button>
          <span>可获得<cite>5</cite>飞吻</span>
          
          <!-- 已签到状态 -->
          <!--
          <button class="layui-btn layui-btn-disabled">今日已签到</button>
          <span>获得了<cite>20</cite>飞吻</span>
          -->
        </div>
      </div>

      <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
        <h3 class="fly-panel-title">回贴周榜</h3>
        <dl>
          <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
          <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd>
        </dl>
      </div>

      <dl class="fly-panel fly-list-one">
        <dt class="fly-panel-title">本周热议</dt>
        <dd>
          <a href="jie/detail.jsp">基于 layui 的极简社区页面模版</a>
          <span><i class="iconfont icon-pinglun1"></i> 16</span>
        </dd>
        <!-- 无数据时 -->
        <!--
        <div class="fly-none">没有相关数据</div>
        -->
      </dl>

      <div class="fly-panel">
        <div class="fly-panel-title">
          这里可作为广告区域
        </div>
        <div class="fly-panel-main">
          <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">LayIM 3.0 - layui 旗舰之作</a>
        </div>
      </div>
      

    </div>
  </div>
</div>

<%@include file="footer/footer.jsp"%>
 
<script src="../res/layui/layui.all.js"></script>
<script src="../../res/layui/jquery-3.5.1.js"></script>
<script>
;!function(){
  var form = layui.form,layer = layui.layer;
  function  aisleFun(res) {
    var ctx = "";
    for (var i =0 ; i<8; i++){
      ctx +="<li>"
      ctx +="<a href='/jie/detail.jsp?id="+res[i].article.id+"' target=\"_blank\">"+res[i].article.title+"</a>"
      ctx +="</li>"
    }
    $('#aisle').append(ctx);
  }

  //渲染置顶
  function stickFun(res) {
    var ctx ="";
    for (var i =1; i<3; i++){
        var category;
        if (res[i].article.category ==1){
            category ="分享";
        }else if(res[i].article.category ==2){
            category ="讨论";
        }else if(res[i].article.category ==3){
            category = "建议"
        }else if (res[i].article.category ==4){
            category="公告"
        }else {
            category = "动态"
        }
          ctx += "<li>"
          ctx += "<a href='user/home.html\" class=\"fly-avatar\">"
          ctx += "<img src="+res[i].user.face+" atl="+res[i].user.nickname+">" // alt='"+res[i].user.nickname+"'
          ctx += "</a>"
          ctx += "<h2>"
          ctx += "<a class=\"layui-badge\">"+category+"</a>"
          ctx += "<a href=\"jie/detail.jsp\">"+res[i].article.title+"</a>"
          ctx += "</h2>"
          ctx += "<div class=\"fly-list-info\">"
          ctx += "<a href=\"user/home.html\" link>"
          ctx += "<cite>"+res[i].user.nickname+"</cite>"
          ctx += "</a>"
          ctx += "<span>刚刚</span>"
          ctx += "<span class=\"fly-list-nums\">"
          ctx += "<i class=\"iconfont icon-pinglun1\" title=\"回答\"></i> 66"
          ctx += "</span>"
          ctx += "</div>"
          ctx += "</li>"
    }
    $('#stick').append(ctx);
  }
  
  //渲染综合
  function apply(res) {
    var ctx ="";
    for (var i = 0; i<10; i++){
      var category;
      if (res[i].article.category ==1){
          category ="分享";
      }else if(res[i].article.category ==2){
          category ="讨论";
      }else if(res[i].article.category ==3){
        category = "建议"
      }else if (res[i].article.category ==4){
        category="公告"
      }else {
        category = "动态"
      }
        ctx += "<li>"
        ctx += "<a href='user/home.html\" class=\"fly-avatar\">"
        ctx += "<img src="+res[i].user.face+" atl="+res[i].user.nickname+">" // alt='"+res[i].user.nickname+"'
        ctx += "</a>"
        ctx += "<h2>"
        ctx += "<a class=\"layui-badge\">"+category+"</a>"
        ctx += "<a href=\"jie/detail.jsp\">"+res[i].article.title+"</a>"
        ctx += "</h2>"
        ctx += "<div class=\"fly-list-info\">"
        ctx += "<a href=\"user/home.html\" link>"
        ctx += "<cite>"+res[i].user.nickname+"</cite>"
        // ctx += "<div class=\"fly-list-info\">"
        ctx += "</a>"
        ctx += "<span>刚刚</span>"
        ctx += "<span class=\"fly-list-nums\">"
        ctx += "<i class=\"iconfont icon-pinglun1\" title=\"回答\"></i> 66"
        ctx += "</span>"
        ctx += "</div>"
        ctx += "</li>"
    }
    $('#Arteity').append(ctx);
  }
  function RequestDate() {
      $.ajax({
        url: "/Content?method=findArticle",
        type:"POST",
        dataType:"json",
        success:function (data) {
          console.log(data);
          apply(data);
          aisleFun(data);
          stickFun(data);
        },
        error:function (error) {
          console.log(error.responseText);
          layer.msg(error.responseText, {icon: 5,anim: 2},error);
        }
      });
  }
  RequestDate();
}();
</script>
</body>
</html>