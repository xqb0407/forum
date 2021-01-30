<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>发表问题 编辑问题 公用</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>

<%@include file="../head/header.jsp"%>

<div class="layui-container fly-marginTop">
  <div class="fly-panel" pad20 style="padding-top: 5px;">
    <div class="layui-form layui-form-pane">
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">发表新帖<!-- 编辑帖子 --></li>
        </ul>
        <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
          <div class="layui-tab-item layui-show">
            <form action="" method="post">
              <div class="layui-row layui-col-space15 layui-form-item">
                <div class="layui-col-md3">
                  <label class="layui-form-label">所在专栏</label>
                  <div class="layui-input-block">
                    <select lay-verify="required" name="category" lay-filter="column">
                      <option></option> 
                      <option value="1">分享</option>
                      <option value="2">讨论</option>
                      <option value="3">建议</option>
                      <option value="4">公告</option>
                      <option value="5">动态</option>
                    </select>
                  </div>
                </div>
                <div class="layui-col-md9">
                  <label for="title" class="layui-form-label">标题</label>
                  <div class="layui-input-block">
                    <input type="text" id="title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                    <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                  </div>
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                  <textarea id="content" name="content" required lay-verify="required" placeholder="详细描述" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <label for="vercode" class="layui-form-label">验证码</label>
                <div class="layui-input-inline">
                  <input type="text" id="vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">
                  <span style="color: #c00;"><img id="randImage" src="/verifyServlet?1"style="margin-top: -10px;"></span>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="fly-footer">
  <p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
  <p>
    <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
    <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
  </p>
</div>

<script src="../../res/layui/layui.all.js"></script>
<script src="../../res/layui/jquery-3.5.1.js"></script>
<script>
  function vcodeFun(){
    $("#randImage").attr('src', '/verifyServlet?'+ Math.random());
  }
  $("#randImage").click(function () {
    vcodeFun();
  });
layui.cache.page = 'jie';
// layui.cache.user = {
//   username: '游客'
//   ,uid: -1
//   ,avatar: '../../res/images/avatar/00.jpg'
//   ,experience: 83
//   ,sex: '男'
// };
  ;!function(){
    var form = layui.form,layer = layui.layer;
    form.on('submit(*)', function(data){
      var dataStr = JSON.stringify(data.field);
      console.log(dataStr);
      var dataJson =  JSON.parse(dataStr);
      console.log(dataJson);
      var json ={
        uid:${sessionScope.User.id},
        category:dataJson.category,
        content:dataJson.content,
        title:dataJson.title,
        vercode:dataJson.vercode
      };
      console.log(json);
      //ajax
      $.ajax({
        url:"/Content?method=addPublish",
        type:"POST",
        data:json,
        dataType:"json",
        success:function (data) {
          layer.msg('发布成功', {icon: 1,anim: 2});
          console.log("JSON:  "+data);
          // window.sessionStorage.setItem("User",JSON.stringify(data));
          // location.href="/html/index.jsp";
          // location.href="/index.jsp";
        },
        error:function (error) {
          layer.msg(error.responseText, {icon: 5,anim: 2},error);
          vcodeFun();
        }
      });
      return false;
    });


    //自定义表单验证
    form.verify({
      username: [
        /^[a-zA-Z0-9_-]{4,16}$/
        ,'用户名为4到16位（字母，数字，下划线，减号）'
      ],
      password:[
        /^[a-zA-Z0-9]{6,12}$/
        ,'密码不能含有非法字符，长度在6-12之间'
      ],
    });

  }();

layui.config({
  version: "3.0.0"
  ,base: '../../res/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>