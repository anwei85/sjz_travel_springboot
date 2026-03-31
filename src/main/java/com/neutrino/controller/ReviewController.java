package com.neutrino.controller;

import com.neutrino.entity.Review;
import com.neutrino.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/add")
    public ModelAndView addReview(Review review, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String userId = (String) session.getAttribute("userid");
        if (userId == null) {
            mv.setViewName("user/login");
            return mv;
        }
        review.setUserId(userId);
        review.setCreateTime(new Date());
        review.setState(0); // 待审核
        reviewService.addReview(review);
        mv.setViewName("redirect:/index");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView deleteReview(@RequestParam Integer id) {
        ModelAndView mv = new ModelAndView();
        reviewService.deleteReview(id);
        mv.setViewName("redirect:/manager/reviewList");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView updateReview(Review review) {
        ModelAndView mv = new ModelAndView();
        reviewService.updateReview(review);
        mv.setViewName("redirect:/manager/reviewList");
        return mv;
    }
}