package service;

import dom.User;

import java.util.List;

/**
 * 用户业务接口
 */
public interface UserService {
    //查询所有用户信息
    public List<User> findAll();

    public User login(User user);

    public void register(User user);
}
