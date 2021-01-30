<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>
<%--头部--%>
<%@include file="../head/header.jsp"%>

<div class="layui-container fly-marginTop fly-user-main">
  <%--侧边--%>
  <%@include file="../left/left.jsp"%>

  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  
  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖（<span>89</span>）</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <ul class="mine-view jie-row" id="ulContent">

            <div id="divNote" style="color: #cccccc;text-align: center ;display:none;"><br><br><br><br>加载中.....</div>
<%--            <li>--%>
<%--              <a class="jie-title" href="../jie/detail.jsp" target="_blank">基于 layui 的极简社区页面模版</a>--%>
<%--              <i>2017/3/14 上午8:30:00</i>--%>
<%--&lt;%&ndash;              <a class="mine-edit" href="/jie/edit/8116">编辑</a>&ndash;%&gt;--%>
<%--              <em>661阅/10答</em>--%>
<%--            </li>--%>

          </ul>
<%--          <div class="layui-row">--%>
<%--            <div class="layui-col-xs6 layui-col-md12">--%>
<%--              <div id="page"></div>--%>
<%--            </div>--%>
<%--          </div>--%>
          <div style="text-align: center">
              <div id="page"></div>
          </div>
          <div id="LAY_page"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="../footer/footer.jsp"%>

<script src="../../res/layui/layui.all.js"></script>
<script>
layui.cache.page = 'user';
function divNode() {
  $('#divNote').css("display",'blok');
}


;!function(){
  var laypage  = layui.laypage ,layer = layui.layer;
  //  laypage.render({
  //    elem: 'page'
  //    ,count: 100
  //    ,first: false
  //    ,last: false
  //    ,theme:'#1e90ff'
  // });
    PageFun(1);
  function PageFun(Currepage){
    $.ajax({
      url:'/Content?method=ByContentUser',
      data:{"UserId":${sessionScope.User.id},"LimitPage":10,"Currepage":Currepage},
      dataType:'json',
      type:'POST',
      success:function (res) {
          apendFun(res);
          console.log(res);
           laypage.render({
              elem: 'page'
             ,count: res.count
             ,first: false
             ,last: false
             ,skip: true
             ,curr: Currepage
             ,theme:'#1e90ff'
             ,jump:function (obj,first) {
                    if (!first){
                        PageFun(obj.curr);
                    }
               }
          });
      },
      error:function (error) {
          layer.msg(error.responseText, {icon: 5,anim: 2},error);
      }
    });
  }


}();

//填充页面
function apendFun(res){

 var ctx ="";
 for (i=0; i<res.data.length;i++){
     var time = set_time(res.data[i].createTime)
     var id = res.data[i].id;
     ctx +="<li>"
     // '"/jie/detail.jsp?id="+res.data[i].id""
     ctx +="<a class='jie-title' target='_blank' href='/jie/detail.jsp?id="+id+"' >"+res.data[i].title+"</a>"
     ctx +="<i>"+time+"</i>"
     ctx +="</li>"
 }
    var Content = document.getElementById('ulContent');

    Content.innerHTML=ctx;
}
function set_time(str){
    var n = parseInt(str);
    var D = new Date(n);
    var year = D.getFullYear();//四位数年份

    var month = D.getMonth()+1;//月份(0-11),0为一月份
    month = month<10?('0'+month):month;

    var day = D.getDate();//月的某一天(1-31)
    day = day<10?('0'+day):day;

    var hours = D.getHours();//小时(0-23)
    hours = hours<10?('0'+hours):hours;

    var minutes = D.getMinutes();//分钟(0-59)
    minutes = minutes<10?('0'+minutes):minutes;

    // var seconds = D.getSeconds();//秒(0-59)
    // seconds = seconds<10?('0'+seconds):seconds;
    // var week = D.getDay();//周几(0-6),0为周日
    // var weekArr = ['周日','周一','周二','周三','周四','周五','周六'];

    var now_time = year+'-'+month+'-'+day+' '+hours+':'+minutes;
    return now_time;
}


layui.config({
  version: "3.0.0"
  ,base: '../../res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>