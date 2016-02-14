package com.service.impl;

import com.dao.UserDAO;
import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

/**
 * Created by Владимир on 06.02.2016.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    public UserServiceImpl(){
        System.out.println("EmployeeServiceImpl()");
    }

    @Autowired
    private UserDAO userDAO;

    @Override
    public int createUser(User user) {
        return userDAO.createUser(user);
    }

    @Override
    public User updateUser(User user) {
        return userDAO.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    @Override
    public List<User> getAllUsers(Integer offset, Integer maxResults) {
        return userDAO.getAllUsers(offset, maxResults);
    }

    @Override
    public User getUser(int id) {
        return userDAO.getUser(id);
    }

    @Override
    public Long count() {
        return userDAO.count();
    }

    @Override
    public List<User> getAllUsers(String userName, Integer offset, Integer maxResults) {
        return userDAO.getAllUsers(userName, offset, maxResults);
    }
}
