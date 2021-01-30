package xyz.herther.service;

import xyz.herther.entity.Uartile;

import java.util.List;
import java.util.Map;

/**
 * 文章接口
 */
public interface ContentService {
    int addPublish(String category, String content, String title, String uid); //添加文章

    Map SelectContentAll(String userId, String limitPage, String currepage); //分页查询

    List findArticle(); //渲染首页文章
}
