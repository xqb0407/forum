package xyz.herther.entity;

import java.util.Date;

public class User {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String city;
    private Long  sex;
    private Date birthday;
    private String face;
    private Long state;
    private String nickname;
    private String signature;
    private Date createTime;
    private Date updateTime;

    public User(int id, String city, Long sex, String face, String nickname, String signature) {
        this.id = id;
        this.city = city;
        this.sex = sex;
        this.face = face;
        this.nickname = nickname;
        this.signature = signature;
    }

    public User(int id, String username, String password, String phone, String city, Long sex, Date birthday, String face, Long state, String nickname, String signature, Date createTime, Date updateTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.city = city;
        this.sex = sex;
        this.birthday = birthday;
        this.face = face;
        this.state = state;
        this.nickname = nickname;
        this.signature = signature;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public User(String username, String password, String phone, String city, Long sex, Date birthday, String face, Long state, String nickname, String signature, Date createTime, Date updateTime) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.city = city;
        this.sex = sex;
        this.birthday = birthday;
        this.face = face;
        this.state = state;
        this.nickname = nickname;
        this.signature = signature;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public User() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Long getSex() {
        return sex;
    }

    public void setSex(Long sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", city='" + city + '\'' +
                ", sex=" + sex +
                ", birthday=" + birthday +
                ", face='" + face + '\'' +
                ", state=" + state +
                ", nickname='" + nickname + '\'' +
                ", signature='" + signature + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
