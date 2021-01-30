package xyz.herther.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 反射到对应的方法
 */
public class UserAuthoServlet extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        //强制类型转换
        HttpServletRequest request =(HttpServletRequest)req;
        HttpServletResponse response =(HttpServletResponse)res;
        //获取用户请求的方法
        String methodName = request.getParameter("method");
        //获取当前类
        Class<?> aClass = this.getClass();
        try {
            //调用当前类的方法
            Method method = aClass.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //方法调用
            method.invoke(this,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
