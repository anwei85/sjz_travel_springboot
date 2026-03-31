<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>石家庄旅行咨询网</title>
        <link rel="shortcut icon" href="../image/logo1.png" type="image/x-icon" />
        <!-- Bootstrap Core CSS -->
        <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery -->
        <script src="<%=basePath%>js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="<%=basePath%>js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="<%=basePath%>js/metisMenu.min.js"></script>
        <!-- DataTables JavaScript -->
        <script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
        <script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="<%=basePath%>js/sb-admin-2.js"></script>
        <style>
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
        <div id="wrapper">
            <!-- 引入navigation.jsp -->
            <jsp:include page="navigation.jsp"></jsp:include>
            <!-- 操作面板 -->
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12" style="height:15px">
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-inline" action="${pageContext.request.contextPath }/reviewList" method="post">
                            <div class="form-group">
                                <label for="name">用户名称</label>
                                <input type="text" class="form-control" id="name" value="${name }" name="name">
                            </div>
                            <button type="submit" class="btn btn-primary">查询</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">评价列表</div>
                            <!-- /.panel-heading -->
                            <table class="table table-bordered table-striped">
                                <thead>
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
                                </thead>
                                <tbody>
                                <c:forEach items="${reviews}" var="review">
                                    <tr>
                                        <td>${review.id}</td>
                                        <td>${review.user != null ? review.user.username : '未知用户'}</td>
                                        <td>
                                            <c:if test="${review.targetType == 1}">景点: ${review.scenic != null ? review.scenic.name : '未知景点'}</c:if>
                                            <c:if test="${review.targetType == 2}">美食: ${review.food != null ? review.food.name : '未知美食'}</c:if>
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
                                                <a href="${pageContext.request.contextPath }/auditReview?id=${review.id}&state=1" class="btn btn-success btn-xs">通过</a>
                                                <a href="${pageContext.request.contextPath }/auditReview?id=${review.id}&state=2" class="btn btn-danger btn-xs">拒绝</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
        </div>
    </body>
</html>