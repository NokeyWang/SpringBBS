package cn.edu.bnu.w.entity;

import javax.persistence.*;
import java.util.List;

/**
 * Created by CHester on 16/1/24.
 */
@Entity
@Table(name = "topic", schema = "db_springbbs", catalog = "")
public class TopicEntity {
    private int topicid;
    private String title;
    private String content;
    private UserEntity useridByUser;
    private List<ReplyEntity> replys;

    @Id
    @Column(name = "topicid", nullable = false)
    public int getTopicid() {
        return topicid;
    }

    public void setTopicid(int topicid) {
        this.topicid = topicid;
    }

    @Basic
    @Column(name = "title", nullable = true, length = 45)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

        TopicEntity that = (TopicEntity) o;

        if (topicid != that.topicid) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = topicid;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "userid", referencedColumnName = "id")
    public UserEntity getUseridByUser() {
        return useridByUser;
    }

    public void setUseridByUser(UserEntity useridByUser) {
        this.useridByUser = useridByUser;
    }

    @OneToMany(mappedBy = "topicidByTopic", fetch = FetchType.EAGER)
    public List<ReplyEntity> getReplys() {
        return replys;
    }

    public void setReplys(List<ReplyEntity> replys) {
        this.replys = replys;
    }
}
