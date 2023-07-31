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
                <h3 >Lịch sử đơn hàng</h3>
                <h4><a href="<%=request.getContextPath()%>/start">Trang chủ</a><label>/</label>Lịch sử đơn hàng</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="check-out">	 
            <div class="container">	 
                <div class="spec ">
                    <h3>Đơn hàng</h3>
                    <div class="ser-t">
                        <b></b>
                        <span><i></i></span>
                        <b class="line"></b>
                    </div>
                </div>

                <table class="table ">
                    <tr class="row">
                        <th class="t-head head-it  col-md-1"></th>
                        <th class="t-head head-it  col-md-1">Mã đơn</th>
                        <th class="t-head head-it  col-md-3">Đơn hàng</th>
                        <th class="t-head col-md-1">Tổng giá tiền</th>
                        <th class="t-head col-md-1">Ngày đặt hàng</th>
                        <th class="t-head col-md-1">Trạng thái</th>
                        <th class="t-head col-md-4">Tùy chọn</th>
                    </tr>

                    <c:forEach items="${requestScope.listOrder}" var="lo" varStatus="status"> 
                        <tr class="cross2 row">
                            <td class="t-data col-md-1">
                                <h3>${status.count}</h3>
                            </td>
                            <td class="t-data col-md-1">
                                <h3>${lo.id}</h3>
                            </td>
                            <td class="t-data ring-in col-md-4">                          
                                <div class="col-md-3"> </div>
                                <div class="clearfix"> </div>
                            </td>
                            <td class="t-data col-md-1"><h3>${lo.totalPrice}</h3></td>
                            <td class="t-data col-md-1"><h3>${lo.orderDate}</h3></td> 
                            <td class="t-data col-md-1">
                                <c:if test="${lo.status == 'Đã hoàn thành'}">
                                    <h3>Đã nhận hàng</h3>
                                </c:if>
                                <c:if test="${lo.status != 'Đã hoàn thành'}">
                                <h3>${lo.status}</h3>
                                </c:if>
                            </td>
                            <td class="t-data col-md-4">
                                <div class="col-md-8">
                                    <c:if test="${lo.status == 'Đang giao'}">
                                        <form id="confirmForm${lo.id}" action="confirm?oid=${lo.id}&&confirmId=1" method ="post">
                                            <div>
                                                <input type="hidden" value="${lo.id}" name="oid${lo.id}">
                                                <h3><input type="button" style="background-color: #4CAF50; color: white; border: none" value="Đã nhận được hàng" onclick="confirmDeli()"></h3>                                  
                                            </div>
                                        </form>
                                        <script>
                                            function confirmDeli() {
                                                var result = confirm("Xác nhận đã nhận hàng? Bạn sẽ không thể hoàn trả sau khi xác nhận.");
                                                if (result) {
                                                    document.getElementById("confirmForm${lo.id}").submit();
                                                }
                                            }
                                        </script>
                                    </c:if>
                                    <c:if test="${lo.status == 'Chờ xử lý'}">
                                        <form id="cancelForm${lo.id}" action="cancel?oid=${lo.id}&&cancelId=1" method ="post">
                                            <div>
                                                <input type="hidden" value="${lo.id}" name="oid${lo.id}">

                                                <input type="button" style="background-color: #4CAF50; color: white; border: none" value="Hủy đơn" onclick="confirmSubmit()">                                   
                                            </div>
                                        </form>
                                        <script>
                                            function confirmSubmit() {
                                                var result = confirm("Bạn có chắc chắn muốn hủy đơn hàng?");
                                                if (result) {
                                                    document.getElementById("cancelForm${lo.id}").submit();
                                                }
                                            }
                                        </script>        
                                    </c:if>
                                </div>                              
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <c:if test="${not empty curUser}">
            <%@include file="logoutFooter.jsp" %>
        </c:if>
        <c:if test="${empty curUser}">
            <%@include file="loginFooter.jsp" %>
        </c:if>
    </body>
</html>