package com.neutrino.service;

import com.neutrino.entity.Review;
import java.util.List;

public interface ReviewService {
    void addReview(Review review);
    void updateReview(Review review);
    void deleteReview(Integer id);
    Review getReviewById(Integer id);
    List<Review> getReviewsByTarget(Integer targetId, Integer targetType);
    List<Review> getReviewsByUser(String userId);
    List<Review> getAllReviews();
    List<Review> getReviewsByState(Integer state);
}