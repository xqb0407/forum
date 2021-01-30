<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>登录</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>

<%@include file="../head/header.jsp"%>

<div class="layui-container fly-marginTop">
  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title">
        <li class="layui-this">登入</li>
        <li><a href="reg.jsp">注册</a></li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-form layui-form-pane">
            <form method="post">
              <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required lay-verify="username" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">注册时的用户名</div>
              </div>

              <div class="layui-form-item">
                <label  class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="password" name="password" required lay-verify="password" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">密码不能含有非法字符，长度在6-12之间</div>
              </div>

              <div class="layui-form-item">
                <label for="vercode" class="layui-form-label">人类验证</label>
                <div class="layui-input-inline">
                  <input type="text" id="vercode" name="vercode" required lay-verify="required" placeholder="请输入后面的验证码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">
                  <span style="color: #c00;"><img id="randImage" src="/verifyServlet?1"style="margin-top: -10px;"></span>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="*" lay-submit>立即登录</button>
                <span style="padding-left:20px;">
                  <a href="forget.html">忘记密码？</a>
                </span>
              </div>
              <div class="layui-form-item fly-form-app">
                <span>或者使用社交账号登入</span>
                <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
                <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../footer/footer.jsp"%>

<script src="../../res/layui/jquery-3.5.1.js"></script>
<script src="../../res/layui/layui.all.js"></script>
<script>
  function vcodeFun(){
    $("#randImage").attr('src', '/verifyServlet?'+ Math.random());
  }


  $("#randImage").click(function () {
    vcodeFun();
  });


  ;!function(){
    var form = layui.form,layer = layui.layer;
    form.on('submit(*)', function(data){
      var dataStr = JSON.stringify(data.field);
      var dataJson =  JSON.parse(dataStr);
      //ajax
      $.ajax({
        url:"/UserAuthoServlet?method=UserLogin",
        type:"POST",
        data:dataJson,
        dataType:"json",
        success:function (data) {
          layer.msg('登录成功', {icon: 1,anim: 2});
          console.log("JSON:  "+data);
          window.sessionStorage.setItem("User",JSON.stringify(data));
          location.href="/html/index.jsp";
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
  console.log([
    "                   _ooOoo_",
    "                  o8888888o",
    "                  88\" . \"88",
    "                  (| -_- |)",
    "                  O\\  =  /O",
    "               ____/`---'\\____",
    "             .'  \\\\|     |//  `.",
    "            /  \\\\|||  :  |||//  \\",
    "           /  _||||| -:- |||||-  \\",
    "           |   | \\\\\\  -  /// |   |",
    "           | \\_|  ''\\---/''  |   |",
    "           \\  .-\\__  `-`  ___/-. /",
    "         ___`. .'  /--.--\\  `. . __",
    "      .\"\" '<  `.___\\_<|>_/___.'  >'\"\".",
    "     | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |",
    "     \\  \\ `-.   \\_ __\\ /__ _/   .-` /  /",
    "======`-.____`-.___\\_____/___.-`____.-'======",
    "                   `=---='",
    "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
    "        佛祖保佑       永不宕机      永无BUG"
  ].join('\n'));
</script>

</body>
</html>