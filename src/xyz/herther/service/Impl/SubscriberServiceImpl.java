package xyz.herther.service.Impl;

import cn.hutool.crypto.SecureUtil;
import xyz.herther.dao.Impl.UserDaoImpl;
import xyz.herther.dao.UserDao;
import xyz.herther.entity.User;
import xyz.herther.service.SubscriberService;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SubscriberServiceImpl implements SubscriberService {

    //注入持久层
    private UserDao userDao =new UserDaoImpl();

    @Override
    public Object regist(String username, String password, String password1, String sex, String signature, String nickname, String phone, String city, String describe) throws ParseException, SQLException {
        //先去查询用户名是否存在
        User user = userDao.existUser(username);
        if(user != null){
            return null;
        }
        /**
         * 判断两个密码是否一致 双重验证（前台验证，后台验证）
         */
        if (!password.equals(password1)){
            return null;
        }
        /**
         * 1、生日转成Date类型  （Date）
         * 2、性别转Long类型  （Long）
         * 3、设置状态为 0-禁用 1-正常 2-停用 （Lone）
         * 4、获取当前时间 成为注册时间  和更新时间 （Date）
         * 5、对密码进行Md5()加密、用到工具是hutool
                */
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");  //年月日
        Date time = fmt.parse(signature); //异常项上抛出
        Long gender = Long.parseLong(sex);
        Long state = 1L;
        Date createTime =new Date();
        Date updateTime =new Date();
        String md5Pass = SecureUtil.md5(password);
        //执行业务层存储用户
        Object object=null;
        object = userDao.regist(new User(username,md5Pass,phone,city,gender,time,null,state,nickname,describe,createTime,updateTime));
        int code = (int)object;
        if (code !=1){
            return null;
        }
        return object;
    }

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public User Login(String username, String password) {
        //将密码转成md5
        String md5Pass = SecureUtil.md5(password);
        //然后去数据库查询
        User user = userDao.Login(username,md5Pass);
        if (user ==null){
            return null;
        }
        return user;
    }

    /**
     * 根据用户名去查询信息
     * @param username
     * @return
     */
    @Override
    public User ByUserAll(String username) {
        User user = userDao.ByUserAll(username);
        if (user == null){
            return null;
        }
       return user;
    }
}
