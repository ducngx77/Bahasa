<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Big store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | About :: w3layouts</title>
        <%@include file="link.jsp" %>
    </head>
    <body>
        <c:set var="size" value="${sessionScope.size}"/>
        <c:set var="c" value="${sessionScope.cart}"/>
        <c:set var="ac" value="${sessionScope.account}"/>
        <jsp:useBean id="cate" class="dal.CategoryDAO"/>
        <jsp:useBean id="pub" class="dal.ProductDAO"/>
        <c:if test="${not empty account}">
            <%@include file="logoutHeader.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginHeader.jsp" %>
        </c:if>   

        <div class="banner-top"  style="background-color: gray">
            <div class="container">
                <h3 >Giỏ hàng</h3>
                <h4><a href="<%=request.getContextPath()%>">Trang chủ</a><label>/</label>Giỏ hàng</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="check-out">	 
            <div class="container">	 
                <div class="spec ">
                    <h3>Giỏ hàng</h3>
                    <div class="ser-t">
                        <b></b>
                        <span><i></i></span>
                        <b class="line"></b>
                    </div>
                </div>

                <table class="table ">
                    <tr class="row">
                        <th class="t-head head-it  col-md-4">Sản phẩm</th>
                        <th class="t-head col-md-2">Giá tiền</th>
                        <th class="t-head col-md-2">Số lượng</th>
                        <th class="t-head col-md-4">Tùy chọn</th>
                    </tr>

                    <c:forEach items="${c.items}" var="ci">
                        <tr class="cross2 row">
                            <td class="t-data ring-in col-md-4">                          
                                <div class="col-md-3">
                                    <a href="item?id=${ci.book.id}" class="at-in"><img src="${ci.book.imgLink}" class="img-cart img-responsive" alt=""></a>
                                </div>
                                <div class="sed col-md-9">
                                    <h5>${ci.book.title}</h5>
                                </div>
                                <div class="clearfix"> </div>
                            </td>
                            <td class="t-data col-md-2">${ci.price}</td>
                            <td class="t-data col-md-2">
                                <div class="quantity"> 
                                    <div class="quantity-select">            
                                        <a href="process?num=-1&&id=${ci.book.id}"><div class="entry value-minus">&nbsp;</div></a>
                                        <div class="entry value"><span class="span-1">${ci.quantity}</span></div>									
                                        <a href="process?num=1&&id=${ci.book.id}"><div class="entry value-plus active">&nbsp;</div></a>
                                    </div>
                                </div>

                            </td>                    
                            <td class="t-data col-md-6">
                                <div class="col-md-8">
                                    <form action="buy" method ="post">
                                        <div>
                                            <input type="hidden" value="${ci.book.id}" name="id">
                                            <button>Mua ngay</button>                                   
                                        </div>
                                    </form>
                                </div>
                                <form action="process" method ="post">
                                    <div class="col-md-4">
                                        <input type="hidden" value="${ci.book.id}" name="id">
                                        <button style="border: none; background-color: white"><img src="images/del.png" class="img-responsive"  alt=""></button>                                   
                                    </div>
                                </form>                            
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${not empty requestScope.totalPrice}">
                        <tr class="cross2 row">
                            <td class="t-data ring-in col-md-4">
                                <h4><b>Tổng giá tiền:</b></h4>
                            </td>
                            <td class="t-data col-md-2"><b>${requestScope.totalPrice}</></td>
                            <td class="t-data col-md-2">
                            </td>                    
                            <td class="t-data col-md-6">
                                <div class="col-md-6">
                                    <form action="buy" method ="post">
                                        <div>
                                            <input type="hidden" value="checkout" name="checkout">
                                            <button>Mua tất cả</button>                                   
                                        </div>
                                    </form>
                                </div>
                                <form id="cancelForm" action="cancel" method ="post">
                                    <div class="col-md-6">
                                        <input type="hidden" value="clear" name="clear">
                                        <input type="button" style="background-color: #4CAF50; color: white; border: none" value="Xóa tất cả" onclick="confirmSubmit()">                                   
                                    </div>
                                </form>
                                <script>
                                    function confirmSubmit() {
                                        var result = confirm("Bạn có chắc chắn muốn xóa tất cả sản phẩm trong giỏ?");
                                        if (result) {
                                            document.getElementById("cancelForm").submit();
                                        }
                                    }
                                </script>
                            </td>
                        </tr>
                    </c:if>
                </table>
            </div>
        </div>
        <div>

        </div>
        <c:if test="${not empty curUser}">
            <%@include file="logoutFooter.jsp" %>
        </c:if>
        <c:if test="${empty curUser}">
            <%@include file="loginFooter.jsp" %>
        </c:if>
    </body>
</html>