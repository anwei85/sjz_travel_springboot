<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>评价管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .btn {
            display: inline-block;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
        }
        .btn-success {
            background-color: #4CAF50;
            color: white;
        }
        .btn-danger {
            background-color: #f44336;
            color: white;
        }
        .status {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
        }
        .status-pending {
            background-color: #ffc107;
            color: #333;
        }
        .status-approved {
            background-color: #4CAF50;
            color: white;
        }
        .status-rejected {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>评价管理</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>用户</th>
                <th>评价对象</th>
                <th>评分</th>
                <th>内容</th>
                <th>创建时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${reviews}" var="review">
                <tr>
                    <td>${review.id}</td>
                    <td>${review.user.username}</td>
                    <td>
                        <c:if test="${review.targetType == 1}">景点: ${review.scenic.name}</c:if>
                        <c:if test="${review.targetType == 2}">美食: ${review.food.name}</c:if>
                    </td>
                    <td>${review.rating}星</td>
                    <td>${review.content}</td>
                    <td>${review.createTime}</td>
                    <td>
                        <span class="status 
                            <c:if test="${review.state == 0}">status-pending</c:if>
                            <c:if test="${review.state == 1}">status-approved</c:if>
                            <c:if test="${review.state == 2}">status-rejected</c:if>
                        ">
                            <c:if test="${review.state == 0}">待审核</c:if>
                            <c:if test="${review.state == 1}">已审核</c:if>
                            <c:if test="${review.state == 2}">已拒绝</c:if>
                        </span>
                    </td>
                    <td>
                        <c:if test="${review.state == 0}">
                            <a href="/auditReview?id=${review.id}&state=1" class="btn btn-success">通过</a>
                            <a href="/auditReview?id=${review.id}&state=2" class="btn btn-danger">拒绝</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>