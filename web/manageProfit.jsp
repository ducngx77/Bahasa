<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <title>Bahasa.com</title>
        <%@include file="link.jsp"%>
    </head>
    <body>
        <jsp:useBean id="acc" class="dal.AccountDAO"/>
        <jsp:useBean id="pub" class="dal.PublisherDAO"/>
        <jsp:useBean id="pro" class="dal.ProfitDAO"/>
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/staff"><img style="width: 100%" src="images/bahasa.png" class="col-1img-head" alt="Bahasa.com|Logo"></a>
                    </div>
                    <div class="col-md-6">
                        <div class="logo">
                            <h1 ><a href="<%=request.getContextPath()%>/staff"><b>B<br>H<br>S</b>Bahasa<span class="subtitle">Books in multiverse</span></a></h1>
                        </div>

                        <div class="head-t">
                            <ul class="card">
                                <c:set var="ac" value="${sessionScope.account}"/>                      
                                <li><a href="logout" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Đăng xuất</a></li>
                                <li><a href="info" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Hi ${ac.username}</a></li>
                            </ul>	
                        </div>

                        <div class="header-ri">
                            <ul class="social-top">
                                <li class="icon facebook"><i class="fa fa-facebook" aria-hidden="true"></i><span></span></a></li>
                                <li class="icon twitter"><i class="fa fa-twitter" aria-hidden="true"></i><span></span></a></li>
                                <li class="icon pinterest"><i class="fa fa-pinterest-p" aria-hidden="true"></i><span></span></a></li>
                                <li class="icon dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i><span></span></a></li>
                            </ul>	
                        </div>

                    </div>   
                </div>   

                <div class="nav-top">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div> 

                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav">                            
                                <li class=""><a href="staff" class=""><span>Đơn hàng</span></a></li>
                                <li class=""><a href="manage?mid=1" class=""><span>Sản phẩm</span></a></li>
                                <li class="active"><a href="manage?mid=2" class=""><span>Doanh thu</span></a></li>
                                <li class=""><a href="manage?mid=3" class=""><span>Khách hàng</span></a></li>
                                <li class=""><a href="manage?mid=4" class=""><span>Nhân viên</span></a></li>
                            </ul>
                        </div>
                    </nav>
                    <div class="clearfix"></div>
                </div>

            </div>
            <div class="banner-top" style="background-color: gray">
                <div class="container">
                    <h3 >Nhân viên: ${ac.username}</h3>
                    <div class="clearfix"> </div>
                </div>
            </div>  

            <div class="tab-head ">
                <nav class="nav-sidebar">
                    <ul class="nav tabs ">
                        <li class="active"><a href="#tab1" data-toggle="tab">Lợi nhuận</a></li>
                        <li class=""><a href="#tab2" data-toggle="tab">Sản phẩm bán chạy</a></li> 
                    </ul>
                </nav>
                <div class=" tab-content tab-content-t ">                                                                  
                    <div class="tab-pane active text-style" id="tab1">
                        <div class="container">
                            <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                        </div>
                        <br><br><br>
                        <div class="container">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th class="t-head col-md-4"><h3>Tháng/Năm</h3></th>
                                        <th class="t-head col-md-4"><h3>Doanh thu</h3></th>
                                        <th class="t-head col-md-4"><h3>Lợi nhuận(30%)</h3></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pro.all}" var="pr">
                                        <tr>
                                            <td class="t-data col-md-4"><h3>${pr.period}</h3></td>
                                                    <fmt:formatNumber type="number" pattern = "###.##" value="${pr.revenue}" var="r"/>
                                                    <fmt:formatNumber type="number" pattern = "###.##" value="${pr.profit}" var="p"/>
                                            <td class="t-data col-md-4"><h3>${r}(VND)</h3></td>
                                            <td class="t-data col-md-4"><h3>${p}(VND)</h3></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <br><br><br> <br><br><br>
                    </div>

                    <div class="tab-pane  text-style" id="tab2">    
                        <div class="container">
                            <c:forEach items="${requestScope.listHotBook}" var="lhb" varStatus="status">
                                <c:if test="${status.count % 4 == 0}">
                                    <div class="row">
                                    </c:if>
                                    <div class="col-md-3 m-wthree">
                                        <a href="#" class="offer-img">
                                            <img src="${lhb.imgLink}" class="img-responsive" alt="">
                                        </a>
                                        <div class="mid-1">
                                            <div class="women">
                                                <h6><a href="#">${lhb.title}</a></h6>							
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    exportEnabled: true,
                    theme: "light1", // "light1", "light2", "dark1", "dark2"
                    title: {
                        text: "Doanh thu theo tháng"
                    },
                    axisY: {
                        includeZero: true
                    },
                    data: [{
                            type: "column", //change type to bar, line, area, pie, etc
                            //indexLabel: "{y}", //Shows y value on all Data Points
                            indexLabelFontColor: "#5A5757",
                            indexLabelFontSize: 16,
                            indexLabelPlacement: "outside",
                            dataPoints: [
            <c:forEach items="${pro.all}" var="pr">
                                {x: ${pr.period}, y: ${pr.profit}},
            </c:forEach>
                            ]
                        }]
                });
                chart.render();
            }
        </script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>