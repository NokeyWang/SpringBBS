package cn.edu.bnu.w.entity;

import javax.persistence.*;

/**
 * Created by CHester on 16/1/24.
 */
@Entity
@Table(name = "reply", schema = "db_springbbs", catalog = "")
public class ReplyEntity {
    private int replyid;
    private Integer userid;
    private String content;
    private TopicEntity topicidByTopic;

    @Id
    @Column(name = "replyid", nullable = false)
    public int getReplyid() {
        return replyid;
    }

    public void setReplyid(int replyid) {
        this.replyid = replyid;
    }

    @Basic
    @Column(name = "userid", nullable = true)
    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "content", nullable = true, length = 255)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReplyEntity that = (ReplyEntity) o;

        if (replyid != that.replyid) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = replyid;
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "topicid", referencedColumnName = "topicid")
    public TopicEntity getTopicidByTopic() {
        return topicidByTopic;
    }

    public void setTopicidByTopic(TopicEntity topicidByTopic) {
        this.topicidByTopic = topicidByTopic;
    }
}
