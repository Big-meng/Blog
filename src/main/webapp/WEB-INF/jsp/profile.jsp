<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.xkenmon.blog.util.TimeUtil" %>
<%@ page import="cn.xkenmon.blog.vo.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blog - BigMeng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="xkenmon.cn"/>
    <meta name="keywords" content="xkenmon.cn mix"/>
    <meta name="author" content="Mix"/>


    <link href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i|Roboto+Mono" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/res/favicon.ico"/>
    <!-- Animate.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/magnific-popup.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/style.css">

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/res/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/res/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<script>
    if (window.name === "ref"){
        window.location.reload();
        window.name = "doNotRef";
    }
</script>

<jsp:useBean id="popularList" scope="request" type="java.util.List"/>
<jsp:useBean id="typeList" scope="request" type="java.util.List"/>
<jsp:useBean id="articleList" scope="request" type="java.util.List"/>
<%
    User user = (User) request.getAttribute("user");
    int total = (Integer) request.getAttribute("total");
    int currentPage = (Integer) request.getAttribute("page");
    String sort = (String) request.getAttribute("sort");
%>

<div class="gtco-loader"></div>

<div id="page">
    <nav class="gtco-nav" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 text-left">
                    <div id="gtco-logo"><a href="${pageContext.request.contextPath}/index.html">大<span>.</span>孟</a>
                    </div>
                </div>
                <div class="col-xs-10 text-right menu-1">
                    <ul>
                        <li class="has-dropdown">
                            <a>排序方式</a>
                            <ul class="dropdown">
                                <li><a href="${pageContext.request.contextPath}/profile/${user.userName}?sort=click">按点击数</a></li>
                                <li><a href="${pageContext.request.contextPath}/profile/${user.userName}?sort=createTime">按创建时间</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <%--&nbsp;--%>
                            <c:if test="${empty currentUser}">
                            <a href="${pageContext.request.contextPath}/static/login.html">
                                <img height="30" width="30" src="${pageContext.request.contextPath}/res/userpic1.png"/>
                                [登陆/注册]
                                </c:if>
                                <c:if test="${not empty currentUser}">
                                <a>
                                    <img height="30" width="30"
                                         src="${pageContext.request.contextPath}/res/userpic1.png"/>
                                        ${currentUser.userName}
                                    </c:if>
                                </a>
                                <c:if test="${not empty currentUser}">
                                <ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/profile/${currentUser.userName}" >个人主页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/manage/edit">写文章</a></li>
                                    <li><a href="${pageContext.request.contextPath}/manage/logout.do">注销登录</a></li>
                                </ul>
                                </c:if>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>

    <!-- 主页文章 -->
    <header id="gtco-header" class="gtco-cover" role="banner" style="background-image:url(${pageContext.request.contextPath}/res/images/img_1.jpg);"
            data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-7 text-left">
                    <div class="display-t">
                        <div class="display-tc animate-box" data-animate-effect="fadeInUp">
                            <h1 class="mb30">${user.userName}个人主页
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="copyrights">Powered By <a href="http://www.xkenmon.cn/" title="BigMeng">BigMeng</a></div>

    <!-- 前十篇文章 -->
    <div id="gtco-main">
        <div class="container">
            <div class="row row-pb-md">
                <div class="col-md-12">
                    <ul id="gtco-post-list">
                        <c:forEach var="article" items="${articleList}">

                            <li class="one-third entry animate-box" data-animate-effect="fadeIn">
                                <a href="${pageContext.request.contextPath}/Article/${article.id}">
                                    <c:if test="${empty article.cover}">
                                        <div class="entry-img w3layouts-main"
                                             style="background-image: url(${pageContext.request.contextPath}/res/images/img_5.jpg)">

                                        </div>
                                    </c:if>
                                    <c:if test="${not empty article.cover}">
                                        <div class="entry-img"
                                             style="background-image: url(${pageContext.request.contextPath}/userImg/ArticlePic?fileName=${article.cover})"></div>
                                    </c:if>
                                    <div class="entry-desc">
                                        <h3>${article.title}</h3>
                                        <p>${article.summary}</p>
                                    </div>
                                </a>
                                <a href="${pageContext.request.contextPath}/profile/${article.author}"
                                   class="post-meta">By ${article.author} <span
                                        class="date-posted">${TimeUtil.getShortTime(article.date)}</span></a>
                            </li>

                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/profile/${type}page=1&sort=<%=sort%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%
                                int allPage = total == 9 ? 1 : total / 9 + 1;
                                int pageStart = currentPage - 2;
                                int pageEnd = currentPage + 2;

                                if (pageStart < 1) {
                                    pageEnd = pageEnd - pageStart;
                                    pageStart = 1;
                                }
                                if (pageEnd > allPage) {
                                    pageEnd = allPage;
                                }
                                if (pageEnd == 0) {
                                    pageEnd = 1;
                                }
                            %>
                            <%
                                for (int i = pageStart; i <= pageEnd; i++) {
                                    if (i == currentPage) {
                                        out.write("<li class=\"active\"><a href=\"/profile/" + user.getUserName()+ "?page=" + i + "&sort=" + sort + "\">" + i + "</a></li>");
                                    } else
                                        out.write("<li><a href=\"" + request.getContextPath() + "/profile/" + user.getUserName()+ "?page=" + i + "&sort=" + sort + "\">" + i + "</a></li>");
                                }
                            %>
                            <li>
                                <a href="${pageContext.request.contextPath}/profile/${user.userName}?page=<%=allPage%>&sort=<%=sort%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>


    <footer id="gtco-footer" role="contentinfo">
        <div class="container">
            <div class="row row-pb-md">
                <div class="col-md-12">
                    <h3 class="footer-heading">Most Popular</h3>
                </div>

                <c:forEach var="popular" items="${popularList}">
                    <div class="col-md-4">
                        <div class="post-entry">
                            <div class="post-img">
                                <a href="${pageContext.request.contextPath}/Article/${popular.id}"><img
                                        src="${pageContext.request.contextPath}/userImg/ArticlePic?fileName=${popular.cover}"
                                        class="img-responsive" alt="Most Popular"></a>
                            </div>
                            <div class="post-copy">
                                <h4><a href="${pageContext.request.contextPath}/Article/${popular.id}">${popular.title}</a></h4>
                                <a href="${pageContext.request.contextPath}/Article/${popular.id}" class="post-meta"><span
                                        class="date-posted">点击数：${popular.readCount}</span> </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="row copyright">
                <div class="col-md-12 text-center">
                    <p>
                        <small class="block">&copy; 2017 BigMeng.top & xkenmon.cn All Rights Reserved. <a
                                href="http://www.xkenmon.cn/" target="_blank" title="xkenmon.cn">xkenmon.cn</a> -
                            Powered By <a href="http://www.xkenmon.cn/" title="xkenmon.cn"
                                          target="_blank">xkenmon.cn</a></small>
                    </p>
                    <p>
                    <ul class="gtco-social-icons">
                        <li><a href="https://twitter.com/xkenmon"><i class="icon-twitter"></i></a></li>
                        <li><a href="https://www.facebook.com/profile.php?id=100012841268713"><i
                                class="icon-facebook"></i></a></li>
                        <li><a href="https://www.linkedin.com/in/%E7%A5%A5%E5%9D%A4-%E5%AD%9F-7049b2128/"><i
                                class="icon-linkedin"></i></a></li>
                        <li><a href="#"><i class="icon-qq"></i></a></li>
                    </ul>
                    </p>
                </div>
            </div>

        </div>
    </footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/res/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/res/js/jquery.waypoints.min.js"></script>
<!-- Stellar -->
<script src="${pageContext.request.contextPath}/res/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="${pageContext.request.contextPath}/res/js/main.js"></script>
<!--love.js-->
<script src="${pageContext.request.contextPath}/res/js/love.js"></script>

</body>
</html>


