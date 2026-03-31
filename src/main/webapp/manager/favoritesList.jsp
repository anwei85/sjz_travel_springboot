<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>收藏管理</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <!-- 引入header.jsp -->
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container-fluid" style="margin-top: 20px;">
        <div class="row">
            <!-- 引入左侧菜单 -->
            <jsp:include page="left.jsp"></jsp:include>

            <!-- 右侧内容区域 -->
            <div class="col-md-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">收藏管理</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>用户</th>
                                    <th>收藏内容</th>
                                    <th>收藏时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty favorites}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;">暂无收藏记录</td>
                                    </tr>
                                </c:if>
                                <c:forEach items="${favorites}" var="favorites">
                                    <tr>
                                        <td>${favorites.id}</td>
                                        <td>${favorites.user != null ? favorites.user.username : '未知用户'}</td>
                                        <td>
                                            <c:if test="${favorites.targetType == 1}">
                                                景点: ${favorites.scenic != null ? favorites.scenic.name : '未知景点'}
                                            </c:if>
                                            <c:if test="${favorites.targetType == 2}">
                                                美食: ${favorites.food != null ? favorites.food.name : '未知美食'}
                                            </c:if>
                                        </td>
                                        <td>${favorites.createTime}</td>
                                        <td>
                                            <a href="/deleteFavorites?id=${favorites.id}" class="btn btn-danger btn-sm" onclick="return confirm('确定要删除这条收藏记录吗？');">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 引入footer.jsp -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>