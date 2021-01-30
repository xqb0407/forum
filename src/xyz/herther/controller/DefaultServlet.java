package xyz.herther.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/user/*")
public class DefaultServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取url
        String uri = req.getRequestURI();
//        System.out.println(uri);
        //拼接地址
        String url =" http://localhost:8080/html"+uri;
        //实现跳转
        resp.sendRedirect(url);
    }
}
