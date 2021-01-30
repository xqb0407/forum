package xyz.herther.dao.Impl;

import xyz.herther.dao.UserDao;
import xyz.herther.entity.User;
import xyz.herther.tools.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class UserDaoImpl implements UserDao {
    /**
     * 注册
     */
    @Override
    public Object regist(User user) {
        Connection conn=null; //获取连接对象
        PreparedStatement ps = null;
        int code=0;
        try {
            conn = JDBCUtils.getConnection();
            String sql ="INSERT INTO user (username,password,phone,city,sex,birthday,face,state,nickname,signature,create_time,update_time) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            //将问号给替换掉
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getPhone());
            ps.setString(4,user.getCity());
            ps.setLong(5,user.getSex());
            ps.setObject(6,user.getBirthday());
            ps.setString(7,user.getFace());
            ps.setLong(8,user.getState());
            ps.setString(9,user.getNickname());
            ps.setString(10,user.getSignature());
            ps.setObject(11,user.getCreateTime());
            ps.setObject(12,user.getUpdateTime());
            //执行插入
            code = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(ps,conn);
        }
        return code;
    }

    /**
     * 判断用户名是否存在
     * @param username
     * @return
     */
    @Override
    public User existUser(String username) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        User user =null;
        conn = JDBCUtils.getConnection();
        String sql="SELECT * FROM user where username=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1,username);
        rs = ps.executeQuery();
        while (rs.next()){
            user= new User();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setBirthday(rs.getDate("birthday"));
            user.setCity(rs.getString("city"));
            user.setCreateTime(rs.getDate("create_time"));
            user.setFace(rs.getString("face"));
            user.setSex(rs.getLong("sex"));
            user.setSignature(rs.getString("Signature"));
            user.setState(rs.getLong("state"));
            user.setUpdateTime(rs.getDate("update_time"));
            user.setNickname(rs.getString("nickname"));
            user.setPhone(rs.getString("phone"));
            user.setPassword(rs.getString("password"));
        }
        JDBCUtils.close(rs,ps,conn);
        return user;
    }

    /**
     * 登录
     * @param username
     * @param md5Pass
     * @return
     */
    @Override
    public User Login(String username, String md5Pass) {
        Connection conn =null;
        PreparedStatement ps =null;
        ResultSet rs =null;
        User user = null;
        try {
            conn = JDBCUtils.getConnection();
            String sql ="SELECT * FROM  user where username=? and password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,md5Pass);
            rs = ps.executeQuery();
            while (rs.next()){
                user= new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setBirthday(rs.getDate("birthday"));
                user.setCity(rs.getString("city"));
                user.setCreateTime(rs.getDate("create_time"));
                user.setFace(rs.getString("face"));
                user.setSex(rs.getLong("sex"));
                user.setSignature(rs.getString("signature"));
                user.setState(rs.getLong("state"));
                user.setUpdateTime(rs.getDate("update_time"));
                user.setNickname(rs.getString("nickname"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(rs,ps,conn);
        }
        return user;
    }

    @Override
    public User ByUserAll(String username) {
        Connection conn =null;
        PreparedStatement ps =null;
        ResultSet rs =null;
        User user = null;
        try {
            conn = JDBCUtils.getConnection();
            String sql ="SELECT * FROM  user where username=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()){
                user= new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setBirthday(rs.getDate("birthday"));
                user.setCity(rs.getString("city"));
                user.setCreateTime(rs.getDate("create_time"));
                user.setFace(rs.getString("face"));
                user.setSex(rs.getLong("sex"));
                user.setSignature(rs.getString("Signature"));
                user.setState(rs.getLong("state"));
                user.setUpdateTime(rs.getDate("update_time"));
                user.setNickname(rs.getString("nickname"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(rs,ps,conn);
        }
        return user;
    }
}
