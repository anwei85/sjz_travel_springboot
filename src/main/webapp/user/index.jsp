<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>石家庄旅行咨询网</title>
        <link rel="shortcut icon" href="../image/logo1.png" type="../image/x-icon" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
        <link href="../css/styles.css" rel="stylesheet" type="text/css" />
        <link href="../css/common.css" rel="stylesheet" type="text/css" />
		<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="container-fluid">
			<!-- 引入header.jsp -->
			<jsp:include page="header.jsp"></jsp:include>


			<!-- 轮播图 -->
			<div class="container-fluid">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- 轮播图的中的小点 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- 轮播图的轮播图片 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active" style="height:400px;">
							<img src="../image/lb1.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
                                <img src="../image/lbw.png">
							</div>
						</div>
						<div class="item" style="height:400px;">
							<img src="../image/lb2.png">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
                                <img src="../image/lbw.png">
							</div>
						</div>
						<div class="item" style="height:400px;">
							<img src="../image/lb3.png">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
                                <img src="../image/lbw.png">
							</div>
						</div>
					</div>

					<!-- 上一张 下一张按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>


            <!-- 景点门票 -->
            <div class="container-fluid" style="padding-left: 0px">
                <div class="col-md-12" style="height:20px;">
                </div>
                <%--景点前三名列表--%>
                <div class="col-md-8" style="width:1030px; padding-left: 0px">
                    <div class="mf_box">
                        <div class="mf_tit clearfix">
                            <span>景点门票</span>
                        </div>
                        <%--下面是固定的数据，需要从数据库查--%>
                        <div class="js_wrap claerdix">
                            <p>&nbsp;</p>
                            <c:forEach items="${list}" var="scenic">
                                <div class="js_con clearfix">
                                    <div class="js_l">
                                        <a href="#"><img src="../${scenic.pic }"></a>
                                    </div>
                                    <div class="js_c">
                                        <p>
                                            <b>【${scenic.name}】</b>
                                        </p>
                                        <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点主题：</font>
                                                ${scenic.theme}</p>
                                        <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点地址：</font>
                                                ${scenic.addr}</p>
                                        <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点特色：</font>
                                                ${scenic.feature}</p>
                                    </div>
                                    <div class="js_r">
                                        <p>&nbsp;</p>
                                        <p>
                                            <span class="fn_o">已售</span><b>${scenic.sales}</b>
                                            <span class="fn_o">张</span>
                                        </p>
                                        <a href="${pageContext.request.contextPath }/getScenicTById?id=${scenic.id}" class="btn btn-default btn-info">查看门票</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <%--地址选择+服务保障--%>
                <div class="col-md-4 column" style="width:260px;">
                    <!-- 1. 石家庄当地游模块 -->
                    <div style="margin-bottom: 8px;">
                        <div class="clumn_tit t01"
                            style="font-size: 16px; font-weight: bold; color: #222; margin-bottom: 3px; padding-bottom: 2px; border-bottom: 1px solid #eee;">
                            <span>石家庄当地游</span>
                        </div>
                        <div class="clumn_con" style="padding: 3px 0; font-size: 12px; line-height: 1.5;">
                            <!-- 市辖区 -->
                            <div style="font-weight: bold; color: #333; font-size: 11px; margin-bottom: 2px;">市辖区</div>
                            <div style="margin-bottom: 2px;">
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=长安区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">长安区</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=桥西区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">桥西区</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=新华区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">新华区</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=裕华区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">裕华区</a><br>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=井陉矿区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">井陉矿区</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=藁城区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">藁城区</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=鹿泉区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">鹿泉区</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=栾城区"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">栾城区</a>
                            </div>
                            <!-- 县 -->
                            <div style="font-weight: bold; color: #333; font-size: 11px; margin-bottom: 2px;">县</div>
                            <div style="margin-bottom: 2px;">
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=正定县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">正定县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=深泽县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">深泽县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=无极县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">无极县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=赵县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">赵县</a><br>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=高邑县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">高邑县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=元氏县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">元氏县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=赞皇县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">赞皇县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=井陉县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">井陉县</a><br>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=平山县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">平山县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=灵寿县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">灵寿县</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=行唐县"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">行唐县</a>
                            </div>
                            <!-- 县级市 -->
                            <div style="font-weight: bold; color: #333; font-size: 11px; margin-bottom: 2px;">县级市</div>
                            <div>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=辛集市"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">辛集市</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=晋州市"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">晋州市</a>
                                <a href="${pageContext.request.contextPath}/getScenicPageForUser?addr=新乐市"
                                    style="margin: 0 2px; color: #0066cc; text-decoration: none; transition: color 0.2s;">新乐市</a>
                            </div>
                        </div>
                    </div>
                
                    <!-- 2. 服务保障图片模块 -->
                    <div class="col-md-4 column" style="width:260px;border:1px solid #E8E8E8">
                        <img src="../image/fwbz.png" style="width: 100%; height: auto; border: none;">
                    </div>
                
                    <!-- hover悬浮样式-->
                    <style type="text/css">
                        .clumn_con a:hover {
                            color: #ff6600 !important;
                            /* 橙色hover */
                            text-decoration: underline !important;
                        }
                    </style>
            </div>


			<!-- 胜景宣传图 -->
            <div class="container-fluid" style="margin-top:30px;">
				<img src="../image/zmsjz.PNG" width="100%"/>
			</div>


            <!-- 热门推荐 -->
            <div class="clumn" style="width:1280px;border:1px solid #E8E8E8;margin-top: 30px;margin-left: 15px">
                <div class="clumn_tit t01">
                    <span>美食推荐</span><a href="${pageContext.request.contextPath }/getFoodPageForUser">更多</a>
                </div>
                <div class="container-fluid" style="padding-top: 15px">
                    <%--下面是固定的数据，需要从数据库查--%>
                    <div class="col-md-12" >
                        <c:forEach items="${listFood}" var="food">
                            <div class="col-md-4 column" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="thumbnail">
                                            <img alt="index_discount_hangzhoutotai" src="../${food.pic }" />
                                            <div class="caption">
                                                <p>
                                                    <b>【${food.name}】</b>
                                                </p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">美食介绍：</font>
                                                    ${food.describe}</p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">推荐餐馆：</font>
                                                    ${food.commend}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>


			<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>

	</body>
</html>