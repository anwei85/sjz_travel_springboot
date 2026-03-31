package com.neutrino.entity;

import java.util.Date;

public class Favorites {
    private Integer id;
    private String userId;
    private Integer targetId;
    private Integer targetType; // 1=景点, 2=美食
    private Date createTime;
    
    private User user;
    private Scenic scenic;
    private TastyFood food;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public Integer getTargetType() {
        return targetType;
    }

    public void setTargetType(Integer targetType) {
        this.targetType = targetType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Scenic getScenic() {
        return scenic;
    }

    public void setScenic(Scenic scenic) {
        this.scenic = scenic;
    }

    public TastyFood getFood() {
        return food;
    }

    public void setFood(TastyFood food) {
        this.food = food;
    }
}