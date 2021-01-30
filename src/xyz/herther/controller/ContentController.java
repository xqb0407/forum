package xyz.herther.controller;

import com.alibaba.fastjson.JSON;
import xyz.herther.entity.Uartile;
import xyz.herther.service.ContentService;
import xyz.herther.service.Impl.ContentServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章通用Servlet类
 */

@WebServlet("/Content")
public class ContentController  extends ContentServlet{

    //注入文章业务层
    private ContentService contentService =new ContentServiceImpl();
    /**
     * 发布文章
     * @param request
     * @param response
     */
    public void addPublish(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        //获取请求参数
        String category = request.getParameter("category");
        String content = request.getParameter("content");
        String title = request.getParameter("title");
        String uid = request.getParameter("uid");
        String vercode = request.getParameter("vercode");
        //拿到正确的验证码
        String code = (String)request.getServletContext().getAttribute("vcode");
        if (!(vercode.equals(code))){
            response.getWriter().println("验证码错误");
            return;
        }
        //跳到业务层 返回一个状态是否添加成功
        int state  =  contentService.addPublish(category,content,title,uid);
        if (state == 0){
            response.getWriter().println("系统出错，稍后重试");
            return;
        }
        Map map = new HashMap();
        map.put("code",200);
        map.put("msg","添加成功");
        String json = JSON.toJSONString(map);
        response.getWriter().println(json);

    }

    //查询文章并且分页
    public void ByContentUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        String userId = request.getParameter("UserId");
        String limitPage = request.getParameter("LimitPage");
        String currepage = request.getParameter("Currepage");
        Map map= contentService.SelectContentAll(userId,limitPage,currepage);
        if (map ==null){
            response.getWriter().println("没数据了");
            return;
        }
        String json = JSON.toJSONString(map);
        response.getWriter().println(json);
    }
    //渲染首页文章
    public void findArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        List list= contentService.findArticle();
        String json = JSON.toJSONString(list);
//        System.out.println(json);
        response.getWriter().println(json);

    }


}
