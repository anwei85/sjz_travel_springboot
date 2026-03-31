<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的收藏</title>
    <link rel="shortcut icon" href="../image/logo1.png" type="../image/x-icon" />
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style>
        .favorites-item {
            background-color: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .favorites-item h3 {
            margin-top: 0;
            color: #333;
        }
        .favorites-item p {
            margin: 10px 0;
            color: #666;
        }
        .empty {
            text-align: center;
            padding: 50px;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <!-- 引入header.jsp -->
        <jsp:include page="header.jsp"></jsp:include>

        <div class="clumn" style="width:1280px;border:1px solid #E8E8E8;margin-top: 15px;margin-left: 20px">
            <div class="clumn_tit t01">
                <span>我的收藏</span>
            </div>
            <div class="container-fluid" style="padding-top: 15px">
                <c:if test="${empty favorites}">
                    <div class="empty">
                        <p>您还没有收藏任何内容</p>
                    </div>
                </c:if>
                <c:forEach items="${favorites}" var="favorites">
                    <div class="favorites-item">
                        <c:if test="${favorites.targetType == 1}">
                            <h3>景点: ${favorites.scenic.name}</h3>
                            <p>地址: ${favorites.scenic.addr}</p>
                            <p>特色: ${favorites.scenic.feature}</p>
                        </c:if>
                        <c:if test="${favorites.targetType == 2}">
                            <h3>美食: ${favorites.food.name}</h3>
                            <p>描述: ${favorites.food.describe}</p>
                            <p>推荐理由: ${favorites.food.commend}</p>
                        </c:if>
                        <p>收藏时间: ${favorites.createTime}</p>
                        <a href="/favorites/delete?id=${favorites.id}" class="btn btn-danger" style="padding: 3px 6px;font-size: 11px">取消收藏</a>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- 引入footer.jsp -->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>