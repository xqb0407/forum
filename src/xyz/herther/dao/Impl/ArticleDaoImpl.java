package xyz.herther.dao.Impl;

import xyz.herther.dao.ArticleDao;
import xyz.herther.entity.Article;
import xyz.herther.entity.Uartile;
import xyz.herther.entity.User;
import xyz.herther.tools.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 文章持久层数据库操作
 */
public class ArticleDaoImpl implements ArticleDao {
    @Override
    public int addPublish(Article article) {
        Connection conn = null;
        PreparedStatement ps =null;
        int code =0;
        try {
            conn= JDBCUtils.getConnection();
            String sql = "INSERT INTO article (category,label,uId,create_time,content,title,show_count,update_time) VALUES(?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setLong(1,article.getCategory());
            ps.setLong(2,article.getLabel());
            ps.setInt(3,article.getuId());
            ps.setObject(4,article.getCreateTime());
            ps.setString(5,article.getContent());
            ps.setString(6,article.getTitle());
            ps.setInt(7,article.getShowCount());
            ps.setObject(8,article.getUpdateTime());
            code = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(ps,conn);

        }
        return code;
    }
    /**
     * 分页查询
     */

    @Override
    public List SelectContentAll(int uId, int limit, int curre) {
        Connection conn = null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        List<Article> list = new ArrayList<>();
        try {
            conn= JDBCUtils.getConnection();
            String sql= "SELECT * FROM article WHERE uid=? LIMIT ?,? ";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,uId);
            ps.setInt(2,(curre-1)*limit);
            ps.setInt(3,limit);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Article(rs.getInt("id"),rs.getLong("category"),rs.getLong("label"),rs.getInt("uId"),rs.getDate("create_time"),rs.getString("content"),rs.getString("title"),rs.getInt("show_count"),rs.getDate("update_time")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(rs,ps,conn);
        }
        return list;
    }

    /**
     * 查询总记录数
     * @param uId
     * @return
     */
    @Override
    public int finContentCount(int uId) {
        Connection conn = null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        List<Article> list = new ArrayList<>();
        int count =0;
        try {
            conn= JDBCUtils.getConnection();
            String sql= "SELECT count(*) FROM article WHERE uid=? ";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,uId);
            rs = ps.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(rs,ps,conn);
        }
        return count;
    }

    /**
     * 渲染首页文章
     * @return
     */
    @Override
    public List findArticle() {
        Connection conn = null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        Uartile uartile =null;
        User user = null;
        Article article =null;
        List<Uartile> list = new ArrayList<Uartile>();
        int count =0;
        try {
            conn= JDBCUtils.getConnection();
            String sql= "SELECT \t\n" +
                    "user.id,\n" +
                    "\tuser.city,\n" +
                    "\tuser.sex,\n" +
                    "\tuser.face,\n" +
                    "\tuser.nickname,\n" +
                    "\tuser.signature,\n" +
                    "\tarticle.id,\n" +
                    "\tarticle.category,\n" +
                    "\tarticle.label,\n" +
                    "\tarticle.create_time,\n" +
                    "\tarticle.content,\n" +
                    "\tarticle.title,\n" +
                    "\tarticle.show_count \n" +
                    "from user JOIN article ON user.id = article.uId";

            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()){
                user = new User(rs.getInt("id"),rs.getString("city"),rs.getLong("sex"),rs.getString("face"),rs.getString("nickname"),rs.getString("signature"));
                article =new Article(rs.getInt("id"),rs.getLong("category"),rs.getLong("label"),rs.getDate("create_time"),rs.getString("content"),rs.getString("title"),rs.getInt("show_count"));
                list.add(new Uartile(user,article));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCUtils.close(rs,ps,conn);
        }
        return list;
    }
}
