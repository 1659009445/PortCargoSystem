package service.impl;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import dom.User;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    //使用dao层接口查询数据
    private UserDao dao = new UserDaoImpl();

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public User login(User user) {
        return dao.findUserByUsernameAndPassword(user.getUsername(),user.getPassword());
    }

    @Override
    public void register(User user) {
        dao.addUser(user);
    }
}
