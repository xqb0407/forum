package xyz.herther.controller;

import com.alibaba.fastjson.JSON;
import xyz.herther.entity.User;
import xyz.herther.service.Impl.SubscriberServiceImpl;
import xyz.herther.service.SubscriberService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet("/index")
//public class IndexServlet extends HttpServlet {
//    //注入页面
//    private SubscriberService subscriberService =new SubscriberServiceImpl();
//
//    /**
//     * 查询用户信息
//     * @param req
//     * @param resp
//     * @throws ServletException
//     * @throws IOException
//     */
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("application/json;charset=utf-8");
//        //拿到Get请求参数
//        System.out.println(req.getParameter("username"));
//        String username = req.getParameter("username");
//        User user = subscriberService.ByUserAll(username);
//        //没查到就是出错了
//        if (user == null){
//            //返回错误
//            String error = JSON.toJSONString("服务器出错了");
//            resp.getWriter().println(error);
//            return;
//        }
//        //给他放到请求对象中去
////        req.setAttribute("User",user);
////        req.getSession().setAttribute("User",user);
////        ServletContext context = req.getServletContext();
////        context.setAttribute("User", user);
//
//        //返回JSON
//        String json = JSON.toJSONString(user);
//        resp.getWriter().println(json);
//    }
//}
