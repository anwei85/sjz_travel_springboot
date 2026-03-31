package com.neutrino.service.impl;

import com.neutrino.entity.Favorites;
import com.neutrino.mapper.FavoritesMapper;
import com.neutrino.service.FavoritesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoritesServiceImpl implements FavoritesService {

    @Autowired
    private FavoritesMapper favoritesMapper;

    @Override
    public void addFavorites(Favorites favorites) {
        favoritesMapper.insert(favorites);
    }

    @Override
    public void deleteFavorites(Integer id) {
        favoritesMapper.delete(id);
    }

    @Override
    public Favorites getFavoritesById(Integer id) {
        return favoritesMapper.selectById(id);
    }

    @Override
    public Favorites getFavoritesByUserAndTarget(String userId, Integer targetId, Integer targetType) {
        return favoritesMapper.selectByUserAndTarget(userId, targetId, targetType);
    }

    @Override
    public List<Favorites> getFavoritesByUser(String userId) {
        return favoritesMapper.selectByUser(userId);
    }

    @Override
    public List<Favorites> getFavoritesByTarget(Integer targetId, Integer targetType) {
        return favoritesMapper.selectByTarget(targetId, targetType);
    }

    @Override
    public boolean isFavorited(String userId, Integer targetId, Integer targetType) {
        return favoritesMapper.selectByUserAndTarget(userId, targetId, targetType) != null;
    }

    @Override
    public List<Favorites> getAllFavorites() {
        return favoritesMapper.selectAll();
    }
}