package xyz.herther.tools;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtils {
    private static DataSource dataSource;
    static {
        //加载配置文件
        Properties properties = new Properties();
        //通过反射
        InputStream inputStream = JDBCUtils.class.getClassLoader().getResourceAsStream("db.properties");//字节流
        //加载配置文件
        try {
            properties.load(inputStream);
            //初始化连接池
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //获取连接池中的对象
    public static DataSource getDataSource(){
        return dataSource;
    }
    //获取Connection
    public static Connection  getConnection() throws SQLException {
        return dataSource.getConnection();
    }
    /**
     * 关闭资源
     */
    public static void closeFile(Closeable... io) {
        for(Closeable temp : io) {
            if(temp != null) {
                try {
                    temp.close();
                } catch (IOException e) {
                    System.out.println("文件关闭失败");
                    e.printStackTrace();
                }
            }
        }
    }
    public static void close(Statement ps, Connection conn){
        try {
            if(ps!=null){
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn){
        try {
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void close(ResultSet rs, Statement ps, Connection conn) {
        try {
            if(rs!=null){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(ps!=null){
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(getConnection());
    }
}
