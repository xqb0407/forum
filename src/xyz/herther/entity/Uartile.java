package xyz.herther.entity;

import java.util.List;

/**
 * 首页文章渲染返回类型
 */
public class Uartile {
    private User user;
    private Article article;

    public Uartile(User user, Article article) {
        this.user = user;
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
