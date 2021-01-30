<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>帐号设置</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" href="../../res/css/global.css">
  <script src="../../res/layui/jquery-3.5.1.js"></script>
</head>
<body>

<%@include file="../head/head.jsp"%>

<div class="layui-container fly-marginTop fly-user-main">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="home.jsp">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="Userindex.jsp">
        <i class="layui-icon">&#xe612;</i>
        用户中心
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="set.jsp">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="message.html">
        <i class="layui-icon">&#xe611;</i>
        我的消息
      </a>
    </li>
  </ul>

  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  
<div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab">
      <ul class="layui-tab-title">
          <li class="layui-this" lay-id="info">我的资料</li>
          <li lay-id="avatar">头像</li>
          <li lay-id="pass">密码</li>
      </ul>
      <div class="layui-tab-content"  style="padding: 20px 0;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
            <form method="post" lay-filte="info">
              <div class="layui-form-item">
                  <label class="layui-form-label">昵称</label>
                  <div class="layui-input-inline">
                    <input type="text" id="nickname" name="nickname" required lay-verify="required" autocomplete="off" class="layui-input">
                  </div>
              </div>
              <div class="layui-form-item">
                <label  class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                  <input type="text" id="phone"  name="phone" required lay-verify="phone"  autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block" id="sexDiv" required>
                  <c:choose>
                    <c:when test="${sessionScope.User.sex eq 1 }">
                      <input id="sex1" type="radio" name="sex" value="1" title="男" checked>
                      <input id="sex2" type="radio" name="sex" value="2" title="女">
                    </c:when>
                    <c:when test="${sessionScope.User.sex eq 2}">
                      <input id="sex1" type="radio" name="sex" value="1" title="男">
                      <input id="sex2" type="radio" name="sex" value="2" title="女" checked>
                    </c:when>
                  </c:choose>
                     
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
                    <option value="厦门" id="xiamen">厦门</option>
                    <option value="福州" id="fuzhou">福州</option>
                    <option value="龙岩" id="longyan">龙岩</option>
                  </select>
                </div>
              </div>
              <div class="layui-form-item layui-form-text">
                <label for="L_sign" class="layui-form-label">签名</label>
                <div class="layui-input-block">
                  <textarea placeholder="随便写些什么刷下存在感"   id="L_sign"  name="sign" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" key="set-mine" lay-filter="info" lay-submit>确认修改</button>
              </div>
            </form>
        </div>
        <div class="layui-tab-item layui-form layui-form-pane">
          <div class="layui-form-item">
            <div class="avatar-add">
              <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
              <button type="button" class="layui-btn upload-img">
                <i class="layui-icon">&#xe67c;</i>上传头像
              </button>
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
              <span class="loading"></span>
            </div>
          </div>
        </div>
        <div class="layui-tab-item">
          <form action="#" method="post">
              <div class="layui-form-item">
                <label for="L_nowpass" class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_nowpass" name="nowpass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
              </div>
          </form>
        </div>
      </div>
    </div>
</div>
      </div>
    </div>
  </div>
</div>

<%@include file="../footer/footer.jsp"%>

<script src="../../res/layui/layui.all.js"></script>
<script>
;!function(){
  //加载模块
  var element = layui.element,form = layui.form,layer = layui.layer;

  //手机设备的简单适配
  var treeMobile = $('.site-tree-mobile')
          ,shadeMobile = $('.site-mobile-shade')

  treeMobile.on('click', function(){
    $('body').addClass('site-mobile');
    // $('layui-nav-tree').css("margin-top","-55px");
  });

  shadeMobile.on('click', function(){
    $('body').removeClass('site-mobile');
  });

  valuesInfo();

  <%--//给表单赋值--%>
  <%--form.val("info", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值--%>
  <%--  "nickname":"${sessionScope.User.nickname}"--%>
  <%--});--%>
//城市
<%--  var city = "${sessionScope.User.city}";--%>
<%--  if (city =="厦门"){--%>
<%--    // var op = $("[name=city] option[value='"+city+"']");--%>
<%--    $('#xiamen').attr(selected,"selected");--%>
<%--  }else if(city =="龙岩"){--%>
<%--    $('#longyan').attr(selected,"selected");--%>
<%--  }else{--%>
<%--    $('#fuzhou').attr(selected,"selected");--%>
<%--  }--%>
  // console.log(typeof city);


  //修改资料
  form.on('submit(info)', function(data){
    var dataStr = JSON.stringify(data.field);
    var dataJson =  JSON.parse(dataStr);
    console.log("表单数据为:"+dataStr);
    // if (dataJson.password != dataJson.password1){
    //   layer.msg('不要骗我了，两次密码不一致', {icon: 5,anim: 6});
    // }else{
    //   $.ajax({
    //     url:"/UserAuthoServlet?method=Register",
    //     type:"POST",
    //     data:dataJson,
    //     dataType:"json",
    //     success:function (data) {
    //       // console.log(data);
    //       layer.msg('注册成功，开心', {icon: 1,anim: 2},data);
    //       location.href="/html/index.jsp"
    //
    //     },
    //     error:function (error) {
    //       console.log(error.responseText);
    //       layer.msg(error.responseText, {icon: 5,anim: 2},error);
    //     }
    //   });
    // }

    return false;
  });





}();

// 给文本赋值
function valuesInfo() {

  //文本域
  var sig = "${sessionScope.User.signature}";
  $('[name=sign]').text(sig);
  //昵称
  var nickname ="${sessionScope.User.nickname}";
  $('#nickname').val(nickname);
  //手机
  var phone ="${sessionScope.User.phone}";
  $('#phone').val(phone);
  <%--//性别--%>
  <%--var sex = "${sessionScope.User.sex}";--%>
  <%--if (sex == 1){--%>
  <%--  $("#sex1").attr("checked","checked");--%>
  <%--}else{--%>
  <%--  $("#sex2").attr("checked","checked");--%>
  <%--}--%>
  //生日
  var birthday = "${sessionScope.User.birthday}";
  $('#birthday').val(birthday);
}




</script>

</body>
</html>