<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Big store a Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Contact :: w3layouts</title>
        <%@include file="link.jsp" %>

    </head>
    <body>
        <c:set var="ac" value="${requestScope.account}"/>
        <c:if test="${not empty account}">
            <%@include file="logoutHeader.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginHeader.jsp" %>
        </c:if>
        <!--banner-->

        <!--banner-->
        <div class="banner-top" style="background-color: gray">
            <div class="container" >
                <h3 >Liên hệ</h3>
                <h4><a href="<%=request.getContextPath()%>">Trang chủ</a><label>/</label>Liên hệ</h4>
                <div class="clearfix"> </div>
            </div>
        </div>

        <!-- contact -->
        <div class="contact">
            <div class="container">
                <div class="spec ">
                    <h3>Liên hệ</h3>
                    <div class="ser-t">
                        <b></b>
                        <span><i></i></span>
                        <b class="line"></b>
                    </div>
                </div>
                <div class=" contact-w3">	
                    <div class="col-md-5 contact-right">	
                        <img src="images/daihocFPT.jpg" class="img-responsive" alt="">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7667.260803412463!2d105.52564914807536!3d21.012891401155244!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2sFPT%20University!5e0!3m2!1sen!2s!4v1678461157078!5m2!1sen!2s"style="border:0"></iframe>
                    </div>
                    <div class="col-md-7 contact-left">
                        <h4>Thông tin liên hệ</h4>
                        <p> Hệ thống Bahasa.com là hệ thống phân phối các sản phẩm sách, truyện, tiểu thuyết,,... thuộc hệ thống PRJ301 của Trường đại học FPT</p>
                        <ul class="contact-list">
                            <li> <i class="fa fa-map-marker" aria-hidden="true"></i>xã Thạch hòa, huyện Thạch Thất, TP.Hà Nội</li>
                            <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:DucNXHE176841@fpt.edu.vn">DucNXHE176841@fpt.edu.vn</a></li>
                            <li> <i class="fa fa-phone" aria-hidden="true"></i>+1234 758 839</li>
                        </ul>
                        <div id="container">
                            <!--Horizontal Tab-->
                            <div id="parentHorizontalTab">
                                <ul class="resp-tabs-list hor_1">
                                    <li><i class="fa fa-envelope" aria-hidden="true"></i></li>
                                    <li> <i class="fa fa-map-marker" aria-hidden="true"></i> </span></li>
                                    <li> <i class="fa fa-phone" aria-hidden="true"></i></li>
                                </ul>
                                <div class="resp-tabs-container hor_1">
                                    <div>
                                        <form action="#" method="post">
                                            <input type="text" value="Name" name="Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Name';
                                                    }" required="">
                                            <input type="email" value="Email" name="Email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Email';
                                                    }" required="">
                                            <textarea name="Message..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Message...';
                                                    }" required="">Message...</textarea>
                                            <input type="submit" value="Submit" >
                                        </form>
                                    </div>
                                    <div>
                                        <div class="map-grid">
                                            <h5>Our Branches</h5>
                                            <ul>
                                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i>xã Thạch hòa, huyện Thạch Thất, TP.Hà Nội</li>
                                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i>889 diamond street, USA.</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="map-grid">
                                            <h5>Contact Me Through</h5>
                                            <ul>
                                                <li>Mobile No : +123 456 7890</li>
                                                <li>Office No : +123 222 2222</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Plug-in Initialisation-->
                        <script type="text/javascript">
                            $(document).ready(function () {
                                //Horizontal Tab
                                $('#parentHorizontalTab').easyResponsiveTabs({
                                    type: 'default', //Types: default, vertical, accordion
                                    width: 'auto', //auto or any width like 600px
                                    fit: true, // 100% fit in a container
                                    tabidentify: 'hor_1', // The tab groups identifier
                                    activate: function (event) { // Callback function if tab is switched
                                        var $tab = $(this);
                                        var $info = $('#nested-tabInfo');
                                        var $name = $('span', $info);
                                        $name.text($tab.text());
                                        $info.show();
                                    }
                                });

                                // Child Tab
                                $('#ChildVerticalTab_1').easyResponsiveTabs({
                                    type: 'vertical',
                                    width: 'auto',
                                    fit: true,
                                    tabidentify: 'ver_1', // The tab groups identifier
                                    activetab_bg: '#fff', // background color for active tabs in this group
                                    inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
                                    active_border_color: '#c1c1c1', // border color for active tabs heads in this group
                                    active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
                                });

                                //Vertical Tab
                                $('#parentVerticalTab').easyResponsiveTabs({
                                    type: 'vertical', //Types: default, vertical, accordion
                                    width: 'auto', //auto or any width like 600px
                                    fit: true, // 100% fit in a container
                                    closed: 'accordion', // Start closed if in accordion view
                                    tabidentify: 'hor_1', // The tab groups identifier
                                    activate: function (event) { // Callback function if tab is switched
                                        var $tab = $(this);
                                        var $info = $('#nested-tabInfo2');
                                        var $name = $('span', $info);
                                        $name.text($tab.text());
                                        $info.show();
                                    }
                                });
                            });
                        </script>
                        <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('#horizontalTab').easyResponsiveTabs({
                                    type: 'default', //Types: default, vertical, accordion           
                                    width: 'auto', //auto or any width like 600px
                                    fit: true   // 100% fit in a container
                                });
                            });
                        </script>
                        <!-- //tabs -->
                        <!-- smooth scrolling -->
                        <script type="text/javascript">
                            $(document).ready(function () {
                                /*
                                 var defaults = {
                                 containerID: 'toTop', // fading element id
                                 containerHoverID: 'toTopHover', // fading element hover id
                                 scrollSpeed: 1200,
                                 easingType: 'linear' 
                                 };
                                 */
                                $().UItoTop({easingType: 'easeOutQuart'});
                            });
                        </script>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- //contact -->
        <c:if test="${not empty account}">
            <%@include file="logoutFooter.jsp" %>
        </c:if>
        <c:if test="${empty account}">
            <%@include file="loginFooter.jsp" %>
        </c:if>
    </body>
</html>