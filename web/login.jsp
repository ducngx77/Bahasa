
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Bahasa.com | Login</title>
        <%@include file="link.jsp" %>
    </head>
    <body>
        <c:set var="cu" value="${requestScope.account}"/>
        <c:if test="${not empty account}">
            <%@include file="logoutHeader.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginHeader.jsp" %>
        </c:if>   
        <!--banner-->
        <div class="banner-top" style="background-color: gray">
            <div class="container">
                <h3 >Đăng nhập</h3>
                <h4><a href="http://localhost:9999/bahasa/">Trang chủ</a><label>/</label>Đăng nhập</h4>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--login-->

        <div class="login">

            <div class="main-agileits">
                <div class="form-w3agile">
                    <h3>Đăng nhập</h3>
                    <form action="login" method="post">
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="Username or Email" name="name" onfocus="if (this.value == 'Username or Email')this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Username or Email';
                                    }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" value="Password" name="pass" onfocus="if (this.value == 'Password')this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Password';
                                    }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <%
                        String err = (String)request.getAttribute("err");
                        if(err!=null){
                        %>
                        <div style="color: red"><%=err%></div>
                        <%}
                        %>
                        <input type="submit" value="Đăng nhập">
                    </form>
                </div>
                <div class="forg">
                    <a href="forgotPass" class="forg-left">Quên mật khẩu</a>
                    <a href="register" class="forg-right">Đăng ký</a>
                    <div class="clearfix"></div>
                </div>
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