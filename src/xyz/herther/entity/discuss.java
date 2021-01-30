package xyz.herther.entity;

import java.util.Date;

public class discuss {
    private int id ;
    private int uId;
    private int aId;
    private int glike;
    private Date  comment_time;
    private String  Rinfo;
    private Date create_time;
    private Date update_time;

    public discuss() {

    }
    public discuss(int id, int uId, int aId, int glike, Date comment_time, String rinfo, Date create_time, Date update_time) {
        this.id = id;
        this.uId = uId;
        this.aId = aId;
        this.glike = glike;
        this.comment_time = comment_time;
        Rinfo = rinfo;
        this.create_time = create_time;
        this.update_time = update_time;
    }
    public discuss(int uId, int aId, int glike, Date comment_time, String rinfo, Date create_time, Date update_time) {
        this.uId = uId;
        this.aId = aId;
        this.glike = glike;
        this.comment_time = comment_time;
        Rinfo = rinfo;
        this.create_time = create_time;
        this.update_time = update_time;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public int getGlike() {
        return glike;
    }

    public void setGlike(int glike) {
        this.glike = glike;
    }

    public Date getComment_time() {
        return comment_time;
    }

    public void setComment_time(Date comment_time) {
        this.comment_time = comment_time;
    }

    public String getRinfo() {
        return Rinfo;
    }

    public void setRinfo(String rinfo) {
        Rinfo = rinfo;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}
