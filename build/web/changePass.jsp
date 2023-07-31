<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Bahasa.com | Register</title>
        <%@include file="link.jsp" %>
    </head>
    <body>
        <c:set var="cu" value="${sessionScope.account}"/>
        <c:if test="${not empty account}">
            <%@include file="logoutHeader.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginHeader.jsp" %>
        </c:if>

        <!--banner-->
        <div class="banner-top" style="background-color: gray">
            <div class="container">
                <c:if test="${not empty account}">
                    <h3 >Thay đổi mật khẩu</h3>
                </c:if>
                <c:if test="${empty account}">
                    <h3 >Quên mật khẩu</h3>
                </c:if>

            </div>
        </div>

        <!--login-->

        <div class="login">
            <div class="main-agileits">
                <div class="form-w3agile form1">
                    <c:if test="${not empty account}">
                        <h3 >Mật khẩu</h3>
                    </c:if>
                    <c:if test="${empty account}">
                        <h3 >Quên mật khẩu</h3>
                    </c:if>
                    <form action="register" method="post">
                        <div class="key">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <input  type="text" value="Username" name="user" onfocus="if (this.value == 'Username')
                                        this.value = '';" onblur="if (this.value == '') {
                                                    this.value = 'Username';
                                                }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <div class="key">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input  type="text" value="Email" name="email" onfocus="if (this.value == 'Email')
                                        this.value = '';" onblur="if (this.value == '') {
                                                    this.value = 'Email';
                                                }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" value="Password" name="pass" onfocus="if (this.value == 'Password')
                                        this.value = '';" onblur="if (this.value == '') {
                                                    this.value = 'Password';
                                                }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <div class="key">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input  type="password" value="Confirm Password" name="confirmPass" onfocus="if (this.value == 'Confirm Password')
                                        this.value = '';" onblur="if (this.value == '') {
                                                    this.value = 'Confirm Password';
                                                }" required="">
                            <div class="clearfix"></div>
                        </div>
                        <%
                        String aerr = (String)request.getAttribute("aerr");
                        String perr = (String)request.getAttribute("perr");
                        String eerr = (String)request.getAttribute("eerr");
                        if(aerr!=null){
                        %>
                        <div style="color: red"><%=aerr%></div>
                        <%}
                        if(perr!=null){
                        %>
                        <div style="color: red"><%=perr%></div>
                        <%}
                        if(eerr!=null){
                        %>
                        <div style="color: red"><%=eerr%></div>
                        <%}
                        %>
                        <input type="submit" value="Đăng ký">
                    </form>
                </div>

            </div>
        </div>
        <c:if test="${not empty account}">
            <%@include file="logoutFooter.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginFooter.jsp" %>
        </c:if>
    </body>
</html>