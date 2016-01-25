package cn.edu.bnu.w.model;

import cn.edu.bnu.w.entity.ReplyEntity;

/**
 * Created by CHester on 16/1/19.
 */
public class ReplyInfo {
    private String name;
    private ReplyEntity replyEntity;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ReplyEntity getReplyEntity() {
        return replyEntity;
    }

    public void setReplyEntity(ReplyEntity replyEntity) {
        this.replyEntity = replyEntity;
    }

    public ReplyInfo(String name, ReplyEntity replyEntity) {

        this.name = name;
        this.replyEntity = replyEntity;
    }
}
