package xyz.herther.service.Impl;

import xyz.herther.dao.ArticleDao;
import xyz.herther.dao.Impl.ArticleDaoImpl;
import xyz.herther.entity.Article;
import xyz.herther.entity.Uartile;
import xyz.herther.service.ContentService;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章通用业务类
 */
public class ContentServiceImpl implements ContentService {
    //注入持久层对数据库操作
    private ArticleDao articleDao =new ArticleDaoImpl();
    /**
     * 添加文章 ，返回一个状态
     * @param category
     * @param content
     * @param title
     * @param uid
     * @return
     */
    @Override
    public int addPublish(String category, String content, String title, String uid ) {
        //数据库需要哪些数据 、类目，标签，用户id ，发文时间，文章内容,标题，查看次数(默认为0 每次请求+1)
        Article article = new Article();
        //类目
        article.setCategory(Long.parseLong(category));
        //标签 默认给他空的数据
        article.setLabel(0L);
        //文章内容
        article.setContent(content);
        //文章标题
        article.setTitle(title);
        //发文时间
        article.setCreateTime(new Date());
        //查看次数
        article.setShowCount(0);
        //更新时间
        article.setUpdateTime(new Date());
        //用户id
        article.setuId(Integer.parseInt(uid));
        return articleDao.addPublish(article);
    }

    /**
     * 分页查询
     * @param userId
     * @param limitPage
     * @param currepage
     * @return
     */
    @Override
    public Map SelectContentAll(String userId, String limitPage, String currepage) {
        int uId=Integer.parseInt(userId);
        int limit=Integer.parseInt(limitPage);
        int curre=Integer.parseInt(currepage);
        List list =  articleDao.SelectContentAll(uId,limit,curre);
        int count = articleDao.finContentCount(uId);
        if (count == 0 ){
            return null;
        }
        Map map = new HashMap();
        map.put("count",count);
        map.put("data",list);
        return map;
    }

    /**
     * 渲染首页文章
     * @return
     */
    @Override
    public List findArticle() {
        List list =  articleDao.findArticle();
        return list;
    }
}
