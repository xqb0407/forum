package xyz.herther.Filter;

import com.sun.deploy.util.StringUtils;
import xyz.herther.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(filterName = "RequestFilter" ,urlPatterns = "/html/user/*")
public class UserRequestFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    /**
     * User文件下的所有文件拦截   判断当前是否有session 也就是是否登录  如果登录了就可以访问，如果没登录
     * 提示您尚未登录，如果已经登录了，再去访问登录页面，就提示你已经登录
     * @param servletRequest
     * @param servletResponse
     * @param filterChain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //强转
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取session
        User user = (User) request.getSession().getAttribute("User");
        //设置编码
        response.setContentType("text/html;charset=utf-8");
        //获取uri
        String uri = request.getRequestURI();
        System.out.println(uri);
        //判断session是否存在
        if (user == null){
            //session不存在就就然他不拦截登录页面和注册页面
            if (uri.endsWith("login.jsp")||uri.endsWith("reg.jsp")||uri.contains("verifyServlet?")){
                filterChain.doFilter(servletRequest,servletResponse);
            }else{
                // 不然就往页面抛出错误
                response.getWriter().println("<h1>尚未登录！！！</h1>");
            }
            return;
        }else {
            //如果session存在返回页面已经登录
            if (uri.endsWith("login.jsp")){
                response.getWriter().println("<h1>你已经登录了！！！</h1>");
                return;
            }else{
                filterChain.doFilter(servletRequest,servletResponse);
            }
            return;
        }
    }

    @Override
    public void destroy() {

    }
}
