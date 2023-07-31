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
                <h3 >Thông tin cá nhân</h3>
                <h4><a href="start">Trang chủ</a><label>/</label>Thông tin</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="container">
            <form id="updateForm" action="update" method="post">
                <table class="table row-md-12">
                    <tr class="col">
                        <th></th>
                    </tr>
                    <tr class="cross2 col">
                        <td><h2>Tên đăng nhập: &nbsp; ${ac.username}</h2>
                        </td>
                    </tr>
                    <tr class="cross2 col">
                        <td><h2>Họ và Tên: &nbsp; <input  type="text" value="${ac.name}" name="name" required></h2>

                        </td>
                    </tr>
                    <tr class="cross2 col">
                        <td><h2>Email: &nbsp; <input  type="text" value="${ac.email}" name="email" required></h2>
                        </td>
                    </tr>
                    <tr class="cross2 col">
                        <td><h2>Số điện thoại: &nbsp; <input  type="text" value="${ac.phone}" name="phone" required></h2>
                        </td>
                    </tr>
                    <tr class="cross2 col">
                        <td><h2>Địa chỉ: &nbsp; <input  type="text" value="${ac.address}" name="address" required></h2>
                        </td>
                    </tr>
                    <tr class="cross2 col">
                        <td><h3><input type="button" style="background-color: #4CAF50; color: white; border: none" value="Lưu thay đổi" onclick="confirmSubmit()">
                                &nbsp;&nbsp;&nbsp;<a href="changePass"><button type="button"><h3>Thay đổi mật khẩu</h3></button></a>
                            </h3>
                        </td>
                    </tr>
                </table>  
            </form>

        </div>
        <script>
            function confirmSubmit() {
                var result = confirm("Bạn có chắc chắn lưu thông tin chỉnh sửa?");
                if (result) {
                    document.getElementById("updateForm").submit();
                }
            }
        </script>
        <c:if test="${not empty account}">
            <%@include file="logoutFooter.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginFooter.jsp" %>
        </c:if>
    </body>
</html>