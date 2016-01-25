package cn.edu.bnu.w.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by CHester on 16/1/15.
 */

@Controller
public class MainController {

    /**
     * 默认进入首页
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "login";
    }

}
