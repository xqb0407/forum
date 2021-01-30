<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>注册</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
</head>
<body>

<%@include file="../head/header.jsp"%>

<div class="layui-container fly-marginTop">
  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title">
        <li><a href="login.jsp">登入</a></li>
        <li class="layui-this">注册</li>
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
                <div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>
              </div>


                <div class="layui-form-item">
                    <label  class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" id="password" name="password" required lay-verify="password" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">密码不能含有非法字符，长度在6-12之间</div>
                </div>

                <div class="layui-form-item">
                    <label  class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" id="password1" name="password1" required lay-verify="password" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="nickname" name="nickname" required lay-verify="required"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">手机</label>
                    <div class="layui-input-inline">
                        <input type="text" id="phone" name="phone" required lay-verify="phone"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="1" title="男" checked>
                        <input type="radio" name="sex" value="2" title="女">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">出生年月</label>
                    <div class="layui-input-inline">
                        <input type="date" id="birthday" name="birthday" lay-verify="required" required  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">城市</label>
                    <div class="layui-input-inline">
                        <select name="city" lay-verify="required" >
                            <option value="">请选择城市</option>
                            <option value="厦门">厦门</option>
                            <option value="福州">福州</option>
                            <option value="龙岩">龙岩</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">描述</label>
                    <div class="layui-input-inline">
                        <input type="text" id="signature" name="signature" lay-verify="required" required  autocomplete="off" class="layui-input">
                    </div>
                </div>
              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="*" lay-submit>立即注册</button>
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
  ;!function(){
    var form = layui.form,layer = layui.layer;
    form.on('submit(*)', function(data){
        var dataStr = JSON.stringify(data.field);
       var dataJson =  JSON.parse(dataStr);
        // console.log("表单数据为:"+dataStr);
      if (dataJson.password != dataJson.password1){
          layer.msg('不要骗我了，两次密码不一致', {icon: 5,anim: 6});
      }else{
            $.ajax({
                url:"/UserAuthoServlet?method=Register",
                type:"POST",
                data:dataJson,
                dataType:"json",
                success:function (data) {
                    // console.log(data);
                    layer.msg('注册成功，开心', {icon: 1,anim: 2},data);
                    location.href="/html/index.jsp"
                    
                },
                error:function (error) {
                    console.log(error.responseText);
                    layer.msg(error.responseText, {icon: 5,anim: 2},error);
                }
            });
      }

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
</script>

</body>
</html>