package xyz.herther.dao;

import xyz.herther.entity.Article;
import xyz.herther.entity.Uartile;

import java.util.List;

public interface ArticleDao {
    int addPublish(Article article);

    List SelectContentAll(int uId, int limit, int curre); //分页查询
    int finContentCount(int uId);

    List findArticle(); //渲染首页文章
}
