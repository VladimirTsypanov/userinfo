package com.controller;

import com.entity.User;
import com.service.UserService;
import com.taglib.PaginationTaglib;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Владимир on 06.02.2016.
 */
@Controller
public class UserController {
    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    private static String url;
    private static final String LOCAL_HOST = "http://localhost:8080/";

    @RequestMapping(value = "createUser", method = RequestMethod.GET)
    public ModelAndView createUser(@ModelAttribute User user, HttpServletRequest request) {
        logger.info("Creating User. Data: "+user);
        return new ModelAndView("userForm");
    }

    @RequestMapping(value = "editUser", method = RequestMethod.GET)
    public ModelAndView editUser(@RequestParam int id, @ModelAttribute User user, HttpServletRequest request) {
        logger.info("Updating the User for the Id "+id);
        url = request.getHeader("Referer");
        user = userService.getUser(id);
        return new ModelAndView("userForm", "userObject", user);
    }

    @RequestMapping(value = "saveUser")
    public ModelAndView saveUser(@ModelAttribute User user) {
        logger.info("Saving the User. Data : "+user);
        long countOfUser = userService.count();
        if(user.getId() == 0){ // if user id is 0 then creating the user other updating the user
            userService.createUser(user);
            if (countOfUser / 10 >= 1){
                return new ModelAndView("redirect:" + LOCAL_HOST + "?offset=" + countOfUser / 10 + "0");
            }
            else {
                return new ModelAndView("redirect:getAllUsers");
            }
        } else {
            userService.updateUser(user);
            return new ModelAndView("redirect:" + url);
        }
    }

    @RequestMapping(value = "deleteUser", method = RequestMethod.GET)
    public ModelAndView deleteUser(@RequestParam int id, HttpServletRequest request) {
        logger.info("Deleting the User. Id : "+id);
        String url = request.getHeader("Referer");
        userService.deleteUser(id);
        long countOfUser = userService.count();
        if (url.substring(url.lastIndexOf("/") + 1).equals("getAllUsers")
                || url.substring(url.lastIndexOf("/") + 1).equals("?offset=0")
                || url.equals(LOCAL_HOST)){
            return new ModelAndView("redirect:getAllUsers");
        }
        long offset = Long.parseLong(url.substring(url.length() - 2));
        if (countOfUser > offset){
            return new ModelAndView("redirect:" + url);
        }
        else if (countOfUser == offset){
            return new ModelAndView("redirect:" + LOCAL_HOST + ((countOfUser / 10) - 1) + "0");
        }
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping(value = {"getAllUsers", "/"})
    public String getAllUsers(Model model, Integer offset, Integer maxResults) {
        logger.info("Getting the all Users.");
        model.addAttribute("userList", userService.getAllUsers(offset, maxResults));
        model.addAttribute("count", userService.count());
        model.addAttribute("offset", offset);
        return "userList";
    }

    @RequestMapping("searchUser")
    public String searchUser(@RequestParam("searchName") String searchName, Model model, Integer offset, Integer maxResults) {
        logger.info("Searching the User. User Names: "+searchName);
        List<User> userList = userService.getAllUsers(searchName, offset, maxResults);
        model.addAttribute("userList", userList);
        model.addAttribute("count", userList.size());
        model.addAttribute("offset", offset);
        return "userList";
    }

}
