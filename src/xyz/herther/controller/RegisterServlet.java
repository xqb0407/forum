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
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//    //注入业务层
//
//    private SubscriberService registerService = new SubscriberServiceImpl();
//
//    /**
//     * 注册功能
//     * @param req
//     * @param resp
//     * @throws ServletException
//     * @throws IOException
//     */
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        //返回的是JSON
//        resp.setContentType("application/json;charset=utf-8");
//        //获取请求参数
//        String username= req.getParameter("username");
//        String password1 = req.getParameter("password1");
//        String password= req.getParameter("password");
//        String sex = req.getParameter("sex");
//        String birthday= req.getParameter("birthday");
//        String nickname=req.getParameter("nickname");
//        String phone=req.getParameter("phone");
//        String city = req.getParameter("city");
//        String signature = req.getParameter("signature");
//
//        try {
//            //格式化标签
//            Long grade = Long.parseLong(sex);
//            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");  //年月日
//            Date time = fmt.parse(birthday); //异常项上抛出
//            //存储到map转返回到前台
//            HashMap map = new HashMap<>();
//            map.put("注册信息",new User(username,password,phone,city,grade,time,null,null,nickname,signature,null,null));
//            //去新增
//            Object object = registerService.regist(username,password,password1,sex,birthday,nickname,phone,city,signature);
//            if(object==null){
//                resp.getWriter().println("密码不一致或用户存在");
//                return;
//            }
//            //不等于空就是成功插入了 判断手影响的行数
//            int code = (int)object;
//            if (code ==0){
//                resp.getWriter().println("系统出错");
//                return;
//            }
//            //转成JSON
//            String data = JSON.toJSONString(map);
//            resp.getWriter().println(data);
//        } catch (ParseException | SQLException e) {
//            e.printStackTrace();
//        }
//    }
//}
