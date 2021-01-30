package xyz.herther.controller;


import com.alibaba.fastjson.JSON;
import xyz.herther.entity.User;
import xyz.herther.service.Impl.SubscriberServiceImpl;
import xyz.herther.service.SubscriberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@WebServlet("/UserAuthoServlet")
public class UserController extends UserAuthoServlet {
    //注入业务逻辑层
    private SubscriberService subscriberService =new SubscriberServiceImpl();
//    //注入注册业务层
//    private SubscriberService registerService = new SubscriberServiceImpl();

    /**
     * 登录逻辑
     * @param request
     * @param response
     * @throws IOException
     */
    public void UserLogin(HttpServletRequest request , HttpServletResponse response) throws IOException {
        //设置返回编码
        response.setContentType("application/json;charset=utf-8");
        //拿到前台请求的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String vcode = request.getParameter("vercode");
        //拿到正确的验证码
        String code = (String)request.getServletContext().getAttribute("vcode");
        //判断验证码是否正确
        if (!(vcode.equals(code))){
            response.getWriter().println("验证码错误");
            return;
        }
        //验证码正确
        //跳转到业务逻辑层
        User user = subscriberService.Login(username,password);
        if (user == null){
            response.getWriter().println("用户名密码错误");
            return;
        }
        //把json响应到前台
        //把用户信息放入到Seesion中去
        request.getSession().setAttribute("User",user);
        //把对象放到请求参数中，后期可以通过jstl拿取
        String date = JSON.toJSONString(user);
        response.getWriter().println(date);
    }

    /**
     * 注册功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public void Register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //返回的是JSON
        resp.setContentType("application/json;charset=utf-8");
        //获取请求参数
        String username= req.getParameter("username");
        String password1 = req.getParameter("password1");
        String password= req.getParameter("password");
        String sex = req.getParameter("sex");
        String birthday= req.getParameter("birthday");
        String nickname=req.getParameter("nickname");
        String phone=req.getParameter("phone");
        String city = req.getParameter("city");
        String signature = req.getParameter("signature");
        try {
            //格式化标签
            Long grade = Long.parseLong(sex);
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");  //年月日
            Date time = fmt.parse(birthday); //异常项上抛出
            //存储到map转返回到前台
            HashMap map = new HashMap<>();
            User user = new User (username,password,phone,city,grade,time,null,null,nickname,signature,null,null);
            map.put("注册信息",new User(username,password,phone,city,grade,time,null,null,nickname,signature,null,null));
            //去新增
            Object object = subscriberService.regist(username,password,password1,sex,birthday,nickname,phone,city,signature);
            if(object==null){
                resp.getWriter().println("密码不一致或用户存在");
                return;
            }
            //不等于空就是成功插入了 判断手影响的行数
            int code = (int)object;
            if (code ==0){
                resp.getWriter().println("系统出错");
                return;
            }
            //转成JSON
            String data = JSON.toJSONString(map);
            resp.getWriter().println(data);
            req.getSession().setAttribute("User",user);
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
        }
    }
}
