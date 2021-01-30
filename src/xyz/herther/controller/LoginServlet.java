package xyz.herther.controller;

import com.alibaba.fastjson.JSON;
import xyz.herther.entity.User;
import xyz.herther.service.Impl.SubscriberServiceImpl;
import xyz.herther.service.SubscriberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebServlet("/login")
//public class LoginServlet extends HttpServlet {
//
//
//    //注入业务逻辑层
//    private SubscriberService subscriberService =new SubscriberServiceImpl();
//    /**
//     * 登录
//     * @param req
//     * @param resp
//     * @throws ServletException
//     * @throws IOException
//     */
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        //设置返回编码
//        resp.setContentType("application/json;charset=utf-8");
//        //拿到前台请求的参数
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        String vcode = req.getParameter("vercode");
//        //拿到正确的验证码
//        String code = (String)req.getServletContext().getAttribute("vcode");
//        //判断验证码是否正确
//        if (!(vcode.equals(code))){
//            resp.getWriter().println("验证码错误");
//            return;
//        }
//        //验证码正确
//        //跳转到业务逻辑层
//        User user = subscriberService.Login(username,password);
//        if (user == null){
//            resp.getWriter().println("用户名密码错误");
//            return;
//        }
//        //把json响应到前台
//
//        //把用户信息放入到Seesion中去
//        req.getSession().setAttribute("User",user);
////        req.getRequestDispatcher("/index.jsp").forward(req,resp);
////        resp.sendRedirect("/index.jsp");
//        //把对象放到请求参数中，后期可以通过jstl拿取
//        String date = JSON.toJSONString(user);
//        resp.getWriter().println(date);
//    }
//}
