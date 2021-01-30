package xyz.herther.entity;

import java.util.Date;

public class Article {
    private int id;
    private Long category;
    private Long label;
    private int uId;
    private Date createTime;
    private String content;
    private String title;
    private int showCount;
    private Date updateTime;

    public Article(int id, Long category, Long label, Date createTime, String content, String title, int showCount) {
        this.id = id;
        this.category = category;
        this.label = label;
        this.createTime = createTime;
        this.content = content;
        this.title = title;
        this.showCount = showCount;
    }

    public Article() {
    }

    public Article(Long category, Long label, int uId, Date createTime, String content, String title, int showCount, Date updateTime) {
        this.category = category;
        this.label = label;
        this.uId = uId;
        this.createTime = createTime;
        this.content = content;
        this.title = title;
        this.showCount = showCount;
        this.updateTime = updateTime;
    }

    public Article(int id, Long category, Long label, int uId, Date createTime, String content, String title, int showCount, Date updateTime) {
        this.id = id;
        this.category = category;
        this.label = label;
        this.uId = uId;
        this.createTime = createTime;
        this.content = content;
        this.title = title;
        this.showCount = showCount;
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", category=" + category +
                ", label=" + label +
                ", uId=" + uId +
                ", create_time=" + createTime +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                ", showCount=" + showCount +
                ", updateTime=" + updateTime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Long getCategory() {
        return category;
    }

    public void setCategory(Long category) {
        this.category = category;
    }

    public Long getLabel() {
        return label;
    }

    public void setLabel(Long label) {
        this.label = label;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getShowCount() {
        return showCount;
    }

    public void setShowCount(int showCount) {
        this.showCount = showCount;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
