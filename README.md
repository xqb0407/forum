# forum
Java+servlet+ajax项目

# 						forum 社区开发文档



## 基于：Java+servlet+ajax项目

## 需求分析

- **登录注册、**
- **发帖，编辑**
- **修改资料（资料、密码、头像）**
- **找回密码**
- **评论、点赞、回复、删帖**



## 数据库设计

| TABLE_SCHEMA | TABLE_NAME | COLUMN_NAME  | COLUMN_TYPE  | COLUMN_COMMENT                          |
| ------------ | ---------- | ------------ | ------------ | --------------------------------------- |
| forum        | article    | id           | int(11)      | 文章id                                  |
| forum        | article    | category     | bigint(20)   | 类目 1-分享 2-讨论 3-建议 4-公告 5-动态 |
| forum        | article    | label        | bigint(20)   | 标签   1-精贴 2-垃圾文章                |
| forum        | article    | uId          | int(11)      |                                         |
| forum        | article    | create_time  | datetime     | 发文时间                                |
| forum        | article    | content      | text         | 文章内容                                |
| forum        | article    | title        | varchar(255) | 查看                                    |
| forum        | article    | show_count   | int(11)      |                                         |
| forum        | article    | update_time  | datetime     | 更新时间                                |
| forum        | discuss    | id           | int(11)      | 评论id                                  |
| forum        | discuss    | uId          | int(11)      | 外键   用户主键                         |
| forum        | discuss    | aId          | int(11)      | 文章主键                                |
| forum        | discuss    | glike        | int(11)      | 点赞次数                                |
| forum        | discuss    | comment_time | date         | 评论时间                                |
| forum        | discuss    | Rinfo        | text         | 评论信息                                |
| forum        | discuss    | create_time  | datetime     |                                         |
| forum        | discuss    | update_time  | datetime     |                                         |
| forum        | user       | id           | int(25)      | id                                      |
| forum        | user       | username     | varchar(25)  | 用户名                                  |
| forum        | user       | password     | varchar(50)  | 密码                                    |
| forum        | user       | phone        | varchar(25)  | 手机                                    |
| forum        | user       | city         | varchar(50)  | 地址                                    |
| forum        | user       | sex          | bigint(20)   | 性别：1 - 男   2 - 女                   |
| forum        | user       | birthday     | date         | 生日                                    |
| forum        | user       | face         | varchar(255) | 头像                                    |
| forum        | user       | state        | bigint(20)   | 状态 0-未激活 1-正常 2-停用             |
| forum        | user       | nickname     | varchar(25)  | 昵称                                    |
| forum        | user       | signature    | varchar(255) | 描述                                    |
| forum        | user       | create_time  | datetime     | 创建时间                                |
| forum        | user       | update_time  | datetime     | 修改时间                                |



## 准备工具

### 数据库连接池（druid）

**导入需要的jar文件：druid-1.1.23.jar**

**创建配置文件（放在SRC目录下）**

```properties
driverClassName=com.mysql.jdbc.Driver
url=jdbc:mysql://localhost:3306/forum?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone = GMT
username=root
password=123456
initialSize=5
maxActive=10
maxWait=3000
```

**封装JDBCUtils连接工具类**

```java
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
}
```

**书写测试类**

```java
public static void main(String[] args) throws SQLException {
    System.out.println(getConnection());
}
```

**测试结果**

![image-20210126131725943](D:/桌面/软件工程/文档/社区项目/img/image-20210126131725943.png)

**测试成功**

## 功能开发

### 开发注册页面（注册功能实现）

1. **从前台请求参数中传进数据**  

   > 通过ajax向服务器请求
   >
   > **Jqery实现：**1、拿到from 表单中填写的数据 2、单击提交拿到值  3、在发送请求。

   **此处演示layui框架的from提交事件监听**

   ```js
    ;!function(){
       var form = layui.form,layer = layui.layer;
       form.on('submit(*)', function(data){
           //请求的数据转成String
           var dataStr = JSON.stringify(data.field);
           //再把String转成JSON
          var dataJson =  JSON.parse(dataStr);
           // console.log("表单数据为:"+dataStr);
         if (dataJson.password != dataJson.password1){
             layer.msg('不要骗我了，两次密码不一致', {icon: 5,anim: 6});
         }else{
               $.ajax({
                   url:"/register",
                   type:"POST",
                   data:dataJson,
                   dataType:"json",
                   success:function (data) {
                       // console.log(data);
                       layer.msg('注册成功，开心', {icon: 1,anim: 2},data);
                   },
                   error:function (error) {
                       console.log(error.responseText);
                       layer.msg(error.responseText, {icon: 5,anim: 2},error);
                   }
               });
         }
         return false;
       });
         //自定义表单验证
         form.verify({
             username: [
                 /^[a-zA-Z0-9_-]{4,16}$/
                 ,'用户名为4到16位（字母，数字，下划线，减号）'
             ],
             password:[
                 /^[a-zA-Z0-9]{6,12}$/
                 ,'密码不能含有非法字符，长度在6-12之间'
             ],
         });
     }();
   ```

2. **Servlet拿到请求的数据** 

   > **服务器如何拿到请求的数据呢？**
   >
   > ​	借助**request.getParameter();**

   - ```java
     //获取请求参数
     String username= req.getParameter("username");
     String password1 = req.getParameter("password1");
     String password= req.getParameter("password");
     String sex = req.getParameter("sex");
     String birthday= req.getParameter("birthday");
     String nickname=req.getParameter("nickname");
     String phone=req.getParameter("phone");
     String city = req.getParameter("city");
     String signature = req.getParameter("signature");
     ```

   **拿到数据数据应该如何处理?**

   1、 可以看到拿到的数据都是String类型、不是我们想要的类型，应该执行强制转换

   ```java
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
   ```

   2、拿到我们想要的数据就是执行插入数据库

   > ​	**那我执行插入时候是不是要先判断用户是否存在才执行插入**
   >
   > ​	**所以我们先要将用户名传到数据库去查询、如果没查询到相同的，就应该可以执行插入、如果有相同的我们就应该去执行向前台返回用户名存在**

   ```java
   //先去查询用户名是否存在
   User user = userDao.existUser(username);
   if(user != null){
       return null;
   }
   ```

   ```java
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
   ```

   

   **3、执行数据库操作**

   ```java
   //执行业务层存储用户
   Object object=null;
   object = userDao.regist(new User(username,md5Pass,phone,city,gender,time,null,state,nickname,describe,createTime,updateTime));
   int code = (int)object;
   if (code !=1){
       return null;
   }
   return object;
   ```

   ```java
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
   ```

   **4、响应到前台**

   > 如何返回前台能、前台是不是需要JSON格式的，那我们返回的时候应该也要返回JSON
   >
   > 借助阿里巴巴的fastjson工具类来把对象序列化成JSON
   >
   > 响应的应该JSON

   ```java
   resp.setContentType("application/json;charset=utf-8");
   ```

   ```java
   //转成JSON
   String data = JSON.toJSONString(map);
   resp.getWriter().println(data); //返回前台
   ```

   **注册功能就实现类**

   ### 验证码功能实现

   > 验证码是一张图，在html中用什么标签设置图片、img标签，img标签中有src属性。
   >
   > src属性中是不是可以加一个，向Servlet请求图片，通过后台来实现生成验证码图片

   **借助工具Hutool工具类生成验证码**

   ```java
   @WebServlet("/verifyServlet")
   public class verifyServlet extends HttpServlet {
       @Override
       protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           //生成验证码
           ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(100, 50, 4, 4);
           ServletOutputStream outputStream = resp.getOutputStream();
           captcha.write(outputStream);
           outputStream.close();
       }
   }
   ```

   **前台实现**

   ```html
   <img id="randImage" src="/verifyServlet?1"style="margin-top: -10px;">
   ```

   

### 		登录功能实现

​	1、从前台拿到用户名和密码验证码

​	2、拿到验证码判断是否和生成验证码相同

​	3、相同的话执行查询数据库，如果没查到，则返回空，返回前台，用户名或密码错误，成功的话就返回JSON				  数据并存到Session会话中，跳转至主页。

