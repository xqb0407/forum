package xyz.herther.service;

import xyz.herther.entity.User;

import java.sql.SQLException;
import java.text.ParseException;

public interface SubscriberService {
    /**
     * 注册
     */
    Object regist(String username, String password, String password1, String sex, String signature, String nickname, String phone, String city, String describe) throws ParseException, SQLException;

    User Login(String username, String password); //登录

    User ByUserAll(String username); //根据用户查信息
}
