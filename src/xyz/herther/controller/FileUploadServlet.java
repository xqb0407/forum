package xyz.herther.controller;

import cn.hutool.core.util.IdUtil;
import com.alibaba.fastjson.JSON;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import xyz.herther.tools.ReslutUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet("/FileUpload")
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        if(!ServletFileUpload.isMultipartContent(req)){
            resp.getWriter().println("当前情请求不支持上传请求");
        }else{
            //创建一个FileItem工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //创建文件上传核心组件
            ServletFileUpload upload = new ServletFileUpload(factory);
            //解析请求，获取到所有的item
            try {
                List<FileItem> items = upload.parseRequest(req);
                //遍历items
                for(FileItem item:items){
                    if(item.isFormField()){
                        //获取表单项名称
                        String fileName = item.getFieldName();
                        //获取表单项的值
                        String fileValue = item.getString();
                        System.out.println(fileName+":"+fileValue);
                    }else{
                        //获取上传文件原始名称
                        String fileName = item.getName();
                        //创建文件输入流
                        InputStream inputStream = item.getInputStream();
                        //获取文件保存在服务器的路径
                        String uuid = IdUtil.simpleUUID();
                        String path = this.getServletContext().getRealPath("/WEB-INF/upload");
                        System.out.println(path);
//                        //创建文件输出流
                        File file = new File(path,uuid+".jpg");
                        if (!file.getParentFile().exists()){
                            file.getParentFile().mkdirs();
                        }
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        //将输入流中的数据写入到输出流中
                        int temp=0;
                        while ((temp =inputStream.read())!=-1){
                              fileOutputStream.write(temp);
                        }
                        //关闭流
                        inputStream.close();
                        fileOutputStream.close();
                        //拿到url
                        String url="http://localhost:8080/upload/"+uuid+".jpg";
                        //返回正确的json格式
                        Map map =new HashMap();
                        Map map1 =new HashMap();
                        map.put("code","0");
                        map.put("msg","上传成功");
                        map.put("url",url);
                        map.put("data",map1);
                        map1.put("src",url);
                        map1.put("title",uuid);
                        //返回
                        resp.getWriter().println(JSON.toJSONString(map));
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }
    }
}
