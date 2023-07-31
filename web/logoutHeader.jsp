
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <a href="start"><img style="width: 100%" src="images/bahasa.png" class="col-1img-head" alt="Bahasa.com|Logo"></a>
                </div>
                <div class="col-md-6">
                    <div class="logo">
                        <h1 ><a href="start"><b>B<br>H<br>S</b>Bahasa<span class="subtitle">Books in multiverse</span></a></h1>
                    </div>

                    <div class="head-t">
                        <ul class="card">
                            <li><a href="wishlist" ><i class="fa fa-heart" aria-hidden="true"></i>Giỏ hàng</a></li>
                            <li><a href="orderHistory" ><i class="fa fa-file-text-o" aria-hidden="true"></i>Đơn của tôi</a></li>
                            <li><a href="shipping" ><i class="fa fa-ship" aria-hidden="true"></i>Shipping</a></li>
                            <li><a href="logout" ><i class="fa fa-user" aria-hidden="true"></i>Đăng xuất</a></li>
                            <li><a href="info" ><i class="fa fa-arrow-right" aria-hidden="true"></i>Chào ${ac.username}</a></li>
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
                            <li class="active"><a href="start" class="hyper "><span>Trang chủ</span></a></li>	

                            <li class="dropdown ">
                                <a href="#" class="dropdown-toggle  hyper" data-toggle="dropdown" ><span>Thể Loại<b class="caret"></b></span></a>
                                <ul class="dropdown-menu multi multi1">                                                                         
                                    <ul class="multi-column-dropdown">
                                        <c:forEach items="${cate.all}" var="ca" varStatus="status">  
                                            <c:if test="${status.count % 4 == 0}"><div class="row"></c:if>
                                                    <div class="col-md-3">
                                                        <li><a href="<%=request.getContextPath()%>/category?cid=${ca.id}"><i class="fa fa-angle-right" aria-hidden="true"></i>${ca.name}</a></li>
                                                    </div>
                                            <c:if test="${status.count % 4 == 0}"></div></c:if>
                                        </c:forEach>
                                    </ul>                                        
                                    <div class="clearfix"></div>
                                </ul>
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle hyper" data-toggle="dropdown" ><span>Nhà Xuất Bản<b class="caret"></b></span></a>
                                <ul class="dropdown-menu multi multi1">                                                                         
                                    <ul class="multi-column-dropdown">
                                        <c:forEach items="${pub.all}" var="p" varStatus="status">  
                                            <c:if test="${status.count % 4 == 0}"><div class="row"></c:if>
                                                    <div class="col-md-3">
                                                        <li><a href="<%=request.getContextPath()%>/publisher?pid=${p.id}"><i class="fa fa-angle-right" aria-hidden="true"></i>${p.name}</a></li>
                                                    </div>
                                            <c:if test="${status.count % 4 == 0}"></div></c:if>
                                        </c:forEach>
                                    </ul>                                        
                                    <div class="clearfix"></div>
                                </ul>                              
                            </li>
                            <li><a href="contact" class="hyper"><span>Liên hệ</span></a></li>
                        </ul>
                    </div>
                </nav>
                <div class="cart" >					
                    <a href="wishlist"><span class="fa fa-shopping-cart my-cart-icon"><span class="badge badge-notify my-cart-badge">${size}</span></span></a>
                </div>
                <div class="clearfix"></div>
            </div>

        </div>			
    </div>
    <!---->
</html>
