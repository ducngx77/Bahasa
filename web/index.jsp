<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>Bahasa.com</title>
        <%@include file="link.jsp" %>
    </head>

    <body>
        <c:set var="size" value="${sessionScope.size}"/>
        <c:set var="ac" value="${sessionScope.account}"/>
        <jsp:useBean id="cate" class="dal.CategoryDAO"/>
        <jsp:useBean id="pub" class="dal.PublisherDAO"/>
        <c:if test="${not empty account}">
            <%@include file="logoutHeader.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginHeader.jsp" %>
        </c:if>   

        <div data-vide-bg="video/video">
            <div class="container">
                <div class="banner-info">
                    <h3>Chào mừng đến với Bahasa.com - Thiên đường sách, truyện tiểu thuyết</h3>	
                    <div class="search-form">
                        <form action="search" method="post">
                            <input type="text" placeholder="Search..." name="keyword">
                            <input type="submit" value=" " >
                        </form>
                    </div>		
                </div>	
            </div>
        </div>

        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.1.min.js"><\/script>')</script>
        <script src="js/jquery.vide.min.js"></script>
    <center>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="first-slide" src="images/saleMarch.jpg" alt="First slide">
                </div>

                <div class="item">
                    <img class="second-slide" src="images/sale30.jpg" alt="Second slide">
                </div>

                <div class="item">
                    <img class="third-slide " src="images/miniGame.jpg" alt="Third slide">
                </div>
            </div>

        </div><!-- /.carousel-->
    </center>
    <div class="content-top ">
        <div class="container ">

            <div class="spec ">
                <h3>Tiêu Điểm</h3>
                <div class="ser-t">
                    <b></b>
                    <span><i></i></span>
                    <b class="line"></b>
                </div>
            </div>

            <div class="tab-head ">
                <nav class="nav-sidebar">
                    <ul class="nav tabs ">
                        <li class="active"><a href="#tab1" data-toggle="tab">Manga mới</a></li>
                        <li class=""><a href="#tab2" data-toggle="tab">Manga hot</a></li> 
                    </ul>
                </nav>

                <div class=" tab-content tab-content-t ">                  
                    <div class="tab-pane active text-style" id="tab1">
                        <div class="con-w3l">
                            <table>
                                <c:forEach items="${requestScope.listNewBook}" var="lnb" varStatus="status">
                                    <c:if test="${status.count % 4 == 0}">
                                        <div class="row">
                                        </c:if>
                                        <div class="col-md-3 m-wthree">
                                            <a href="<%=request.getContextPath()%>/item?id=${lnb.id}" class="offer-img">
                                                <img src="${lnb.imgLink}" class="img-responsive" alt="">
                                            </a>
                                            <div class="mid-1">
                                                <div class="women">
                                                    <h6><a href="<%=request.getContextPath()%>/item?id=${lnb.id}">${lnb.title}</a></h6>							
                                                </div>
                                                <div class="mid-2">
                                                    <p ><label>${lnb.price*1.05}</label><em class="item_price">${lnb.price}VND</em></p>

                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${status.count % 4 == 0}">
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </table>
                            <div class="clearfix"></div>
                        </div>                                                                 
                    </div>		  

                    <div class="tab-pane text-style" id="tab2">
                        <div class="con-w3l">
                            <c:forEach items="${requestScope.listHotBook}" var="lhb" varStatus="status">
                                <c:if test="${status.count % 4 == 0}">
                                    <div class="row">
                                    </c:if>
                                    <div class="col-md-3 m-wthree">
                                        <a href="<%=request.getContextPath()%>/item?id=${lhb.id}" class="offer-img">
                                            <img src="${lhb.imgLink}" class="img-responsive" alt="${lhb.title}">
                                        </a>
                                        <div class="mid-1">
                                            <div class="women">
                                                <h6><a href="<%=request.getContextPath()%>/item?id=${lhb.id}">${lhb.title}</a></h6>							
                                            </div>
                                            <div class="mid-2">
                                                <p ><label>${lhb.price*1.05}</label><em class="item_price">${lhb.price}VND</em></p>

                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${status.count % 4 == 0}">
                                    </div>
                                </c:if>
                            </c:forEach>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <br>
    <br>
    <br> 
    <div class="spec ">
        <h3>Nhà Xuất Bản</h3>
        <div class="ser-t">
            <b></b>
            <span><i></i></span>
            <b class="line"></b>
        </div>
    </div>
    <!--content-->
    <div class="content-mid">
        <div class="container">
            <div class="col-md-4 m-w3ls">
                <div class="col-md1 ">
                    <a href="search?pid=1">
                        <img src="images/nxbKimDongLogo.png" class="img-responsive img" alt="">                          
                    </a>
                </div>
            </div>

            <div class="col-md-4 m-w3ls1">
                <div class="col-md ">
                    <a href="search?pid=2">
                        <img src="images/nxbTreLogo.png" class="img-responsive img" alt="">
                    </a>
                </div>
            </div>

            <div class="col-md-4 m-w3ls">
                <div class="col-md2 ">
                    <a href="search?pid=3">
                        <img src="images/amakLogo.png" class="img-responsive img1" alt="">
                    </a>
                </div>
                <div class="col-md3 ">
                    <a href="search?pid=4">
                        <img src="images/ipmLogo.png" class="img-responsive img1" alt="">
                    </a>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
    <!--content-->

    <c:if test="${not empty curUser}">
        <%@include file="logoutFooter.jsp" %>
    </c:if>
    <c:if test="${empty curUser}">
        <%@include file="loginFooter.jsp" %>
    </c:if>
</body>
</html>