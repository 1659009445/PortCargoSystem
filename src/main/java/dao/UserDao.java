package dao;

import dom.User;

import java.util.List;

/**
 * 用户dao层接口
 */
public interface UserDao {
    //查询所有用户
    public List<User> findAll();
    //通过用户名和密码查找用户
    public User findUserByUsernameAndPassword(String username,String password);
    //添加用户(注册)
    public void addUser(User user);
    //修改用户信息
    public User modifyUser(User user);
    //删除用户
    public void deleteUser(int id);
}
