package xyz.herther.Filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 字符编码过滤器
 */
public class CharSetFilter implements Filter {
    private String encoding;
    private String charSet;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding= filterConfig.getInitParameter("encoding");
        charSet = filterConfig.getInitParameter("charSet");
        System.out.println("初始化字符集："+encoding+"::"+charSet);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //强制转成HttpServletRequest
        HttpServletRequest request= (HttpServletRequest)servletRequest;
        //强制转成HttpServletResponse
        HttpServletResponse response =(HttpServletResponse)servletResponse;
        //设置请求编码过滤器
//        request.setCharacterEncoding(encoding);
        //设置响应过滤器
//        response.setContentType(charSet);
        //跳转到下一个过滤器
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("字符集过滤器被摧毁");
    }
}
