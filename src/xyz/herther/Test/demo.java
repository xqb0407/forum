package xyz.herther.Test;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import xyz.herther.entity.Article;
import xyz.herther.tools.JDBCUtils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class demo {

//    public static void main(String[] args) {
////        for (int i =0; i<100; i++){
//////            addPublish(i);
////        }
//
//    }
    public static void main(String[] args) throws IOException {
        Connection conn = null;
        PreparedStatement ps =null;
        int code =0;
        Map map = Confun();
        try {
            conn= JDBCUtils.getConnection();
            String sql = "INSERT INTO article (category,label,uId,create_time,content,title,show_count,update_time) VALUES(?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setLong(1,1L);
            ps.setLong(2,0L);
            ps.setInt(3,2);
            ps.setObject(4,new Date());
            ps.setString(5,(String) map.get("content"));
            ps.setString(6,(String) map.get("title"));
            ps.setInt(7,1);
            ps.setObject(8,new Date());
            code = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(ps,conn);

        }
    }


    public static Map Confun() throws IOException {
        String url ="https://blog.51cto.com/14975073/2608574";
        int time = 10000;
        Document document = Jsoup.parse(new URL(url), time);
        Elements elementsByClass = document.getElementsByClass("artical-Left-blog");
        HashMap map = new HashMap();
        for (Element e:elementsByClass){
            String h1 = e.getElementsByTag("h1").text();
            String elementsByClass1 = e.getElementsByClass("artical-content-bak main-content").text();
//            System.out.println(elementsByClass1);
            map.put("title",h1);
            map.put("content",elementsByClass1);

        }
        return map;
    }

}
