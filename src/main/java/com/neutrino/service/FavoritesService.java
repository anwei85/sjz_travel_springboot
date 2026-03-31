package com.neutrino.service;

import com.neutrino.entity.Favorites;
import java.util.List;

public interface FavoritesService {
    void addFavorites(Favorites favorites);
    void deleteFavorites(Integer id);
    Favorites getFavoritesById(Integer id);
    Favorites getFavoritesByUserAndTarget(String userId, Integer targetId, Integer targetType);
    List<Favorites> getFavoritesByUser(String userId);
    List<Favorites> getFavoritesByTarget(Integer targetId, Integer targetType);

    boolean isFavorited(String userId, Integer targetId, Integer targetType);

    List<Favorites> getAllFavorites();
}