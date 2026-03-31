package com.neutrino.mapper;

import com.neutrino.entity.Favorites;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface FavoritesMapper {
    void insert(Favorites favorites);
    void delete(Integer id);
    Favorites selectById(Integer id);
    Favorites selectByUserAndTarget(@Param("userId") String userId, @Param("targetId") Integer targetId, @Param("targetType") Integer targetType);
    List<Favorites> selectByUser(String userId);
    List<Favorites> selectByTarget(@Param("targetId") Integer targetId, @Param("targetType") Integer targetType);
    List<Favorites> selectAll();
}