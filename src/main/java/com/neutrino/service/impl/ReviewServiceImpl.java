package com.neutrino.service.impl;

import com.neutrino.entity.Review;
import com.neutrino.mapper.ReviewMapper;
import com.neutrino.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public void addReview(Review review) {
        reviewMapper.insert(review);
    }

    @Override
    public void updateReview(Review review) {
        reviewMapper.update(review);
    }

    @Override
    public void deleteReview(Integer id) {
        reviewMapper.delete(id);
    }

    @Override
    public Review getReviewById(Integer id) {
        return reviewMapper.selectById(id);
    }

    @Override
    public List<Review> getReviewsByTarget(Integer targetId, Integer targetType) {
        return reviewMapper.selectByTarget(targetId, targetType);
    }

    @Override
    public List<Review> getReviewsByUser(String userId) {
        return reviewMapper.selectByUser(userId);
    }

    @Override
    public List<Review> getAllReviews() {
        return reviewMapper.selectAll();
    }

    @Override
    public List<Review> getReviewsByState(Integer state) {
        return reviewMapper.selectByState(state);
    }
}