package xyz.herther.Test;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.omg.CORBA.ARG_IN;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * 爬虫文章
 */
public class reptile {
    public static void main(String[] args) throws Exception {
        String url ="https://blog.51cto.com/14975073/2608574";
        int time = 10000;
        Document document = Jsoup.parse(new URL(url), time);
        Elements elementsByClass = document.getElementsByClass("artical-Left-blog");
        for (Element e:elementsByClass){
//            String h1 = e.getElementsByTag("h1").text();
            String elementsByClass1 = e.getElementsByClass("artical-content-bak main-content").text();
            System.out.println(elementsByClass1);
        }
    }
}
