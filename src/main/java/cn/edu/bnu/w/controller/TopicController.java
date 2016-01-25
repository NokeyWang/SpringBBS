package cn.edu.bnu.w.controller;

import cn.edu.bnu.w.entity.ReplyEntity;
import cn.edu.bnu.w.entity.TopicEntity;
import cn.edu.bnu.w.entity.UserEntity;
import cn.edu.bnu.w.model.ReplyInfo;
import cn.edu.bnu.w.repository.ReplyRepository;
import cn.edu.bnu.w.repository.TopicRepository;
import cn.edu.bnu.w.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by CHester on 16/1/17.
 */
@Controller
public class TopicController {
    @Autowired
    private TopicRepository topicRepository;
    @Autowired
    private ReplyRepository replyRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/showTopics", method = RequestMethod.POST)
    public ModelAndView showTopics(@ModelAttribute("userid") Integer userid) {
        UserEntity userEntity = userRepository.findOne(userid);
        ModelAndView modelAndView = new ModelAndView("forum");
        List<TopicEntity> topicEntityList = topicRepository.findAll();
        modelAndView.addObject("username", userEntity.getName());
        modelAndView.addObject("userid", userid);
        modelAndView.addObject("topicList", topicEntityList);
        return modelAndView;
    }
    /**
     * 显示帖子内容,包含回帖等
     * @param userid 用户ID
     * @param topicId 帖子ID
     * @return
     */
    @RequestMapping(value = "/showTopicDetail", method = RequestMethod.POST)
    public ModelAndView showTopic(@ModelAttribute("userid") Integer userid, @ModelAttribute("topicid") Integer topicId) {

        TopicEntity topicEntity = topicRepository.findOne(topicId);
        List<ReplyEntity> replyEntityList = topicEntity.getReplys();
        List<ReplyInfo> replyInfoList = new ArrayList<ReplyInfo>();
        for (ReplyEntity reply :
                replyEntityList) {
            ReplyInfo replyInfo = new ReplyInfo(userRepository.findOne(reply.getUserid()).getName(), reply);
            replyInfoList.add(replyInfo);
        }
        ModelAndView modelAndView = new ModelAndView("topicDetail");
        // 传递给请求页面
        modelAndView.addObject("userid", userid);
        modelAndView.addObject("topic", topicEntity);
        modelAndView.addObject("replyInfoList", replyInfoList);
        return modelAndView;
    }

    /**
     * 添加回复
     * @param userid 用户ID
     * @param topicid 帖子ID
     * @return 回复内容输入页面
     */
    @RequestMapping(value = "/addReply", method = RequestMethod.POST)
    public ModelAndView addReply(@ModelAttribute("userid") Integer userid, @ModelAttribute("topicid") Integer topicid) {
        ModelAndView modelAndView = new ModelAndView("addReply");
        modelAndView.addObject("userid", userid);
        modelAndView.addObject("topicid", topicid);
        return modelAndView;
    }


    /**
     * 回复内容提交
     * @param userid 用户ID
     * @param topicid 帖子ID
     * @param replyContent 回复内容
     * @return 返回主帖及回帖页面
     */
    @RequestMapping(value = "/addReplyPost", method = RequestMethod.POST)
    public ModelAndView addReplyPost(@ModelAttribute("userid") Integer userid, @ModelAttribute("topicid") Integer topicid,
                                     @ModelAttribute("replycontent") String replyContent) {
        ReplyEntity replyEntity = new ReplyEntity();
        replyEntity.setTopicidByTopic(topicRepository.findOne(topicid));
        replyEntity.setUserid(userid);
        replyEntity.setContent(replyContent);
        replyRepository.saveAndFlush(replyEntity);

        TopicEntity topicEntity = topicRepository.findOne(topicid);
        List<ReplyEntity> replyEntityList = topicEntity.getReplys();
        List<ReplyInfo> replyInfoList = new ArrayList<ReplyInfo>();
        for (ReplyEntity reply :
                replyEntityList) {

            ReplyInfo replyInfo = new ReplyInfo(userRepository.findOne(reply.getUserid()).getName(), reply);
            replyInfoList.add(replyInfo);

        }
        return showTopic(userid, topicid);
    }

    @RequestMapping(value = "/addTopic", method = RequestMethod.POST)
    public ModelAndView addTopic(@ModelAttribute("userid1") Integer userid) {
        ModelAndView modelAndView = new ModelAndView("addTopic");
        modelAndView.addObject("userid", userid);
        return modelAndView;
    }


    @RequestMapping(value = "/addTopicPost", method = RequestMethod.POST)
    public ModelAndView addTopicPost(@ModelAttribute("userid") Integer userid, @ModelAttribute("title") String title,
                                     @ModelAttribute("topiccontent") String content) {
        TopicEntity topicEntity = new TopicEntity();
        topicEntity.setTitle(title);
        topicEntity.setContent(content);
        topicEntity.setUseridByUser(userRepository.findOne(userid));
        topicRepository.saveAndFlush(topicEntity);
        return showTopics(userid);
    }


    @RequestMapping(value = "/userLoginPost", method = RequestMethod.POST)
    public ModelAndView userLogin(@ModelAttribute("name") String name, @ModelAttribute("password") String password) {
        List<UserEntity> userEntityList = userRepository.findAll();
        for (UserEntity user : userEntityList) {
            if (user.getName().equals(name)) {
                if (user.getPassword().equals(password)) {
                    return showTopics(user.getId());
                }
            }
        }
        return (new ModelAndView("loginError"));
    }
}
