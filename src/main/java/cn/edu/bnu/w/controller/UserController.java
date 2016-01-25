package cn.edu.bnu.w.controller;

import cn.edu.bnu.w.entity.UserEntity;
import cn.edu.bnu.w.repository.TopicRepository;
import cn.edu.bnu.w.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by CHester on 16/1/16.
 */
@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TopicRepository topicRepository;

    /**
     * 用户注册
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String login() {
        return "register";
    }

    /**
     * 注册post信息处理
     * @param userEntity
     * @return
     */
    @RequestMapping(value = "/userRegisterPost", method = RequestMethod.POST)
    public String userRegister(@ModelAttribute("user") UserEntity userEntity) {
        List<UserEntity> userEntityList = userRepository.findAll();
        for (UserEntity user : userEntityList) {
            if (userEntity.getName().equals(user.getName())) {
                return "registerError";
            }
        }
        userRepository.saveAndFlush(userEntity);
        return "success";
    }


    /**
     * 用户管理
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users(ModelMap modelMap) {
        // 找到user表里的所有记录
        List<UserEntity> userList = userRepository.findAll();

        // 将所有记录传递给返回的jsp页面
        modelMap.addAttribute("userList", userList);

        // 返回 pages 目录下的 userManage.jsp 页面
        return "userManage";
    }

    /**
     * 页面(添加用户)
     */
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser() {
        return "addUser";
    }

    /**
     * 添加用户处理
     * @param userEntity
     * @return
     */
    @RequestMapping(value = "/addUserPost", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {

        // 数据库中添加一个用户
        //userRepository.save(userEntity);

        // 数据库中添加一个用户，并立即刷新
        userRepository.saveAndFlush(userEntity);

        // 返回重定向 到 /users 请求
        return "redirect:/users";
    }

    // 查看用户详情
    @RequestMapping(value = "/showUser/{userId}", method = RequestMethod.GET)
    public String showUser(@PathVariable("userId") Integer userId, ModelMap modelMap) {

        // 找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        // 传递给请求页面
        modelMap.addAttribute("user", userEntity);
        return "userDetail";
    }

    // 更新用户信息 页面
    @RequestMapping(value = "/updateUser/{userId}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("userId") Integer userId, ModelMap modelMap) {

        // 找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);

        // 传递给请求页面
        modelMap.addAttribute("user", userEntity);
        return "updateUser";
    }

    // 更新用户信息 操作
    @RequestMapping(value = "/updateUserPost", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("user") UserEntity userEntity) {

        // 更新用户信息
        userRepository.updateUser(userEntity.getName(),
                userEntity.getPassword(), userEntity.getId());
        return "redirect:/users";
    }


}
