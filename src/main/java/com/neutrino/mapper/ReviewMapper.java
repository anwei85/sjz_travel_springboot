package com.neutrino.mapper;

import com.neutrino.entity.Review;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface ReviewMapper {
    void insert(Review review);
    void update(Review review);
    void delete(Integer id);
    Review selectById(Integer id);
    List<Review> selectByTarget(@Param("targetId") Integer targetId, @Param("targetType") Integer targetType);
    List<Review> selectByUser(String userId);
    List<Review> selectAll();
    List<Review> selectByState(Integer state);
}