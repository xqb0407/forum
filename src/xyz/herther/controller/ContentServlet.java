package xyz.herther.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 文章反射
 */
public class ContentServlet extends HttpServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)res;
        String method = request.getParameter("method");
        Class<?> aClass = this.getClass();
        try {
            Method method1 = aClass.getMethod(method, HttpServletRequest.class, HttpServletResponse.class);
            method1.invoke(this,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
