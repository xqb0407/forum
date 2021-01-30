package xyz.herther.dao;

import xyz.herther.entity.User;

import java.sql.SQLException;
import java.util.Date;

public interface UserDao {

    Object regist(User user); //注册
    User existUser(String username) throws SQLException;//判断用户名是否存在

    User Login(String username, String md5Pass); //登录

    User ByUserAll(String username); //根据用户名去查询信息
}
