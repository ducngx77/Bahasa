<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <title>Bahasa.com | Item</title>
        <%@include file="link.jsp" %>
    </head>
    <body>
        <c:set var="ac" value="${sessionScope.account}"/>
        <jsp:useBean id="cate" class="dal.CategoryDAO"/>
        <jsp:useBean id="pub" class="dal.ProductDAO"/>
        <c:if test="${not empty account}">
            <%@include file="logoutHeader.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginHeader.jsp" %>
        </c:if>
        <div class="banner-top" style="background-color: gray">
            <div class="container">
                <h3 >Thông tin sản phẩm</h3>
                <h4><a href="start">Trang chủ</a><label>/</label>Sản phẩm</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="container item_info">
            <c:set var="b" value="${requestScope.book}"/>
            <div class="row">
                <div class="col-md-6">
                    <img src="${b.imgLink}" class="img-responsive item_img" alt=""> 
                </div>

                <div class="col-md-6">
                    <form name="f" action="" method="post">
                        <div class="women">
                            <h1 style="">${b.title}</h1><br>
                            <h4>Nhà xuất bản: ${b.publisher}</h4><br>
                            <h4>Kho: ${b.quantity}</h4><br>
                            <div class="mid-2">
                                <h3>Đơn giá: </h3>
                                <h3><p><label>${b.price*1.05}</label><em class="item_price">${b.price}VND</em></p></h3>
                                <input type="hidden" value="${b.price}" name="price" id="price">
                                <input type="hidden" value="${b.id}" name="id" id="id">
                                <div class="clearfix"></div>
                                <div class="clearfix"></div>
                            </div>
                            <label for="quantity"><h3>Số lượng: </h3></label>
                            <div>
                                <button type="button" onclick="decrease()">-</button>
                                    <input type="text" value="1" name="quantity" id="quantity">
                                <button type="button" onclick="increase()">+</button>
                            </div><br>

                            <div class="col-md-6">
                                <input type="submit" onclick="item('${b.id}')" style="background-color: #4CAF50;
                                       border: none;
                                       color: white;
                                       text-align: center;
                                       text-decoration: none;
                                       display: inline-block;
                                       font-size: 15px;
                                       cursor: pointer;" value="Thêm vào giỏ hàng">  
                            </div> 
                            <div class="col-md-6">  
                                <input type="submit" onclick="buy('${b.id}')" style="background-color: #4CAF50;
                                       border: none;
                                       color: white;
                                       text-align: center;
                                       text-decoration: none;
                                       display: inline-block;
                                       font-size: 15px;
                                       cursor: pointer;" value="Mua ngay">
                            </div>
                        </div>               
                    </form> 
                </div>    
            </div>

        </div>
        <div class="spec ">
            <h3>Có thể bạn sẽ thích</h3>
            <div class="ser-t">
                <b></b>
                <span><i></i></span>
                <b class="line"></b>
            </div>
        </div>
        <div class=" con-w3l">
            <c:forEach items="${requestScope.listRelatedBook}" var="lrb">
                <div class="col-md-3 m-wthree">
                    <a href="<%=request.getContextPath()%>/item?id=${lrb.id}" class="offer-img">
                        <img src="${lrb.imgLink}" class="img-responsive" alt="">
                    </a>
                    <div class="mid-1">
                        <div class="women">
                            <h6><a href="<%=request.getContextPath()%>/item?id=${lrb.id}">${lrb.title}</a></h6>							
                        </div>
                        <div class="mid-2">
                            <p ><label>${lrb.price*1.05}</label><em class="item_price">${lrb.price}VND</em></p>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>                          
            <div class="clearfix"></div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <c:if test="${not empty account}">
            <%@include file="logoutFooter.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginFooter.jsp" %>
        </c:if>
        <script>
            function decrease() {
                var quantity = document.getElementById("quantity");
                if (quantity.value > 1) {
                    quantity.value--;
                }
            }

            function increase() {
                var quantity = document.getElementById("quantity");
                if (quantity.value < ${b.quantity}) {
                    quantity.value++;
                }
            }

            const input = document.getElementById("quantity");
            input.addEventListener("input", function () {
                this.value = this.value.replace(/[^0-9]/g, '');
            });

            function buy(id) {
                document.f.action = "buy?id=" + id;
                document.f.submit();
            }

            function item(id) {
                document.f.action = "item?id=" + id;
                document.f.submit();
            }
        </script>
    </body>
</html>