package com.dao.impl;

import com.dao.UserDAO;
import com.entity.User;
import com.util.HibernateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Владимир on 06.02.2016.
 */
@Repository
public class UserDAOImpl implements UserDAO {

    public UserDAOImpl() {
        System.out.println("EmployeeDAOImpl");
    }

    @Autowired
    private HibernateUtil hibernateUtil;

    @Override
    public int createUser(User user) {
        return (Integer) hibernateUtil.create(user);
    }

    @Override
    public User updateUser(User user) {
        return hibernateUtil.update(user);
    }

    @Override
    public void deleteUser(int id) {
        User user = new User();
        user.setId(id);
        hibernateUtil.delete(user);
    }

    public void hyi(){

    }

    @Override
    public List<User> getAllUsers() {
        return hibernateUtil.fetchAll(User.class);
    }

    @Override
    public User getUser(int id) {
        return hibernateUtil.fetchById(id, User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers(String userName) {
        String query = "SELECT * FROM Users e WHERE e.name like '%"+ userName +"%'";
        List<Object[]> employeeObjects = hibernateUtil.<Object[]>fetchAll(query);
        List<User> users = new ArrayList<>();
        for(Object[] userObject: employeeObjects) {
            User user = new User();
//            int id = ((BigInteger) userObject[0]).intValue();
            int id = (Integer) userObject[0];
            String name = (String) userObject[1];
            int age = (int) userObject[2];
            boolean admin = (boolean) userObject[3];
            Timestamp timestamp = (Timestamp) userObject[4];
            user.setId(id);
            user.setName(name);
            user.setAge(age);
            user.setAdmin(admin);
            user.setTimestamp(timestamp);
            users.add(user);
        }
        System.out.println(users);
        return users;
    } 
}
