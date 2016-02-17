package cn.edu.bnu.w.repository;

import cn.edu.bnu.w.entity.TopicEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by CHester on 16/1/17.
 */
public interface TopicRepository extends JpaRepository<TopicEntity, Integer> {
    @Modifying      // 说明该方法是修改操作
    @Transactional  // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update TopicEntity topic set topic.title =:qTitle, topic.content =:qContent where topic.topicid=:qId")
    public void updateTopic(@Param("qTitle") String title, @Param("qContent") String content,
                            @Param("qId") Integer id);
}
