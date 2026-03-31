package com.neutrino.controller;

import com.neutrino.entity.Favorites;
import com.neutrino.service.FavoritesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/favorites")
public class FavoritesController {

    @Autowired
    private FavoritesService favoritesService;

    @RequestMapping("/add")
    public ModelAndView addFavorites(@RequestParam Integer targetId, @RequestParam Integer targetType, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        com.neutrino.entity.User user = (com.neutrino.entity.User) session.getAttribute("user");
        if (user == null) {
            mv.setViewName("/user/login");
            return mv;
        }
        String userId = user.getUserid();
        
        // 检查是否已收藏
        if (favoritesService.isFavorited(userId, targetId, targetType)) {
            mv.setViewName("redirect:/index");
            return mv;
        }
        
        Favorites favorites = new Favorites();
        favorites.setUserId(userId);
        favorites.setTargetId(targetId);
        favorites.setTargetType(targetType);
        favorites.setCreateTime(new Date());
        favoritesService.addFavorites(favorites);
        
        mv.setViewName("redirect:/favoritesList");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView deleteFavorites(@RequestParam Integer id) {
        ModelAndView mv = new ModelAndView();
        favoritesService.deleteFavorites(id);
        mv.setViewName("redirect:/favoritesList");
        return mv;
    }

    @RequestMapping("/toggle")
    public ModelAndView toggleFavorites(@RequestParam Integer targetId, @RequestParam Integer targetType, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        com.neutrino.entity.User user = (com.neutrino.entity.User) session.getAttribute("user");
        if (user == null) {
            mv.setViewName("/user/login");
            return mv;
        }
        String userId = user.getUserid();
        
        Favorites favorites = favoritesService.getFavoritesByUserAndTarget(userId, targetId, targetType);
        if (favorites != null) {
            favoritesService.deleteFavorites(favorites.getId());
        } else {
            favorites = new Favorites();
            favorites.setUserId(userId);
            favorites.setTargetId(targetId);
            favorites.setTargetType(targetType);
            favorites.setCreateTime(new Date());
            favoritesService.addFavorites(favorites);
        }
        
        mv.setViewName("redirect:/favoritesList");
        return mv;
    }
}