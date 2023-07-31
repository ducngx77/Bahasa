<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>Bahasa.com</title>
        <%@include file="link.jsp"%>
    </head>
    <body>
        <jsp:useBean id="acc" class="dal.AccountDAO"/>
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
                                <li class=""><a href="manage?mid=2" class=""><span>Doanh thu</span></a></li>
                                <li class=""><a href="manage?mid=3" class=""><span>Khách hàng</span></a></li>
                                <li class="active"><a href="manage?mid=4" class=""><span>Nhân viên</span></a></li>
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
                <div class=" tab-content tab-content-t ">                  
                    <div class="tab-pane active text-style" id="tab1">                                
                        <div class="tab-pane text-style" id="tab4">
                            <div class="con-w3l">
                                <table class="table ">
                                    <tr class="row">
                                        <th class="t-head head-it  col-md-1"></th>
                                        <th class="t-head head-it  col-md-4">Nhân viên</th>
                                        <th class="t-head col-md-1">Email</th>
                                        <th class="t-head col-md-1">Số điện thoại</th>
                                        <th class="t-head col-md-1">Địa chỉ</th>
                                        <th class="t-head col-md-4">Tùy chọn</th>
                                    </tr>

                                    <c:forEach items="${requestScope.listStaff}" var="ls" varStatus="status"> 
                                        <tr class="cross2 row">
                                            <td class="t-data col-md-1">
                                                <h3>${status.count}</h3>
                                            </td>
                                            <td class="t-data ring-in col-md-4"><h3>${ls.name} | ${ls.username} | ID: ${ls.id}</h3>
                                                <div class="clearfix"> </div>
                                            </td>                                               
                                            <td class="t-data col-md-1"><h3>${ls.email}</h3></td>
                                            <td class="t-data col-md-1"><h3>${ls.phone}</h3></td> 
                                            <td class="t-data col-md-1"><h3>${ls.address}</h3></td>
                                            <td class="t-data col-md-4">
                                                <div class="col-md-6">
                                                   
                                                </div>                              
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="js/bootstrap.js"></script>
    </body>
</html>