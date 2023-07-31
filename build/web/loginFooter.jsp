<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <!--footer-->
    <div class="footer">
        <div class="container">
            <div class="col-md-3 footer-grid">
                <h3>About Us</h3>
                <p>Bahasa.com - Chuỗi hệ thống bán lẻ sách, truyện, văn phòng phẩm với quy mô toàn quốc. Hệ thống thuộc chương trình PRJ301 của trường đại học FPT</p>
            </div>
            <div class="col-md-3 footer-grid ">
                <h3>Menu</h3>
                <ul>
                    <li><a href="#">Trang chủ</a></li>
                    <li><a href="#">Thể Loại</a></li>
                    <li><a href="#">Nhà Xuất Bản</a></li>						 
                    <li><a href="#">Liên Hệ</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid ">
                <h3>Customer Services</h3>
                <ul>
                    <li><a href="shipping">Shipping</a></li>
                    <li>Terms & Conditions</li>
                    <li>Faqs</li>
                    <li><a href="contact">Liên hệ</a></li>              						
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>My Account</h3>
                <ul>
                    <li><a href="login">Đăng nhập</a></li>
                    <li><a href="register">Đăng xuất</a></li>
                    <li><a href="wishlist" onclick="showMessage()">Giỏ hàng</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
            <div class="footer-bottom">
                <h2><a href="<%=request.getContextPath()%>"><b>B<br>H<br>S</b>Bahasa<span class="subtitle">Books in multiverse</span></a></h2>
                <p class="fo-para">Sách, truyện, tiểu thuyết, tạp chí, văn phòng phẩm, đồ trang trí và tất cả những gì bạn cần</p>
                <ul class="social-fo">
                    <li><a href="#" class=" face"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    <li><a href="#" class=" twi"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#" class=" pin"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
                    <li><a href="#" class=" dri"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                </ul>
                <div class=" address">
                    <div class="col-md-4 fo-grid1">
                        <p><i class="fa fa-home" aria-hidden="true"></i>Đại học FPT, xã Thạch Hòa, huyện Thạch Thất, TP.Hà Nội</p>
                    </div>
                    <div class="col-md-4 fo-grid1">
                        <p><i class="fa fa-phone" aria-hidden="true"></i>+1234 758 839 , +8476 6268 678</p>	
                    </div>
                    <div class="col-md-4 fo-grid1">
                        <p><a href="mailto:DucNXHE176841@fpt.edu.vn"><i class="fa fa-envelope-o" aria-hidden="true"></i>DucNXHE176841@fpt.edu.vn</a></p>
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            <div class="copy-right">
                <p> &copy; 2023 Bahasa.com. All Rights Reserved | Design by <a href="https://www.facebook.com/cacondftyuaduc"> DucNX</a></p>
            </div>
        </div>
        <script src="js/bootstrap.js"></script>
    </div>
    <!-- //footer-->
</html>
