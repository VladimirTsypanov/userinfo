package com.dao;

import com.entity.User;

import java.util.List;

/**
 * Created by Владимир on 06.02.2016.
 */
public interface UserDAO {
    int createUser(User user);
    User updateUser(User user);
    void deleteUser(int id);
    List<User> getAllUsers();
    User getUser(int id);
    List<User> getAllUsers(String userName);
}
