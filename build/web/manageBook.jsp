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
        <jsp:useBean id="pub" class="dal.PublisherDAO"/>
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
                                <li class="active"><a href="manage?mid=1" class=""><span>Sản phẩm</span></a></li>
                                <li class=""><a href="manage?mid=2" class=""><span>Doanh thu</span></a></li>
                                <li class=""><a href="manage?mid=3" class=""><span>Khách hàng</span></a></li>
                                <li class=""><a href="manage?mid=4" class=""><span>Nhân viên</span></a></li>
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
                <nav class="nav-sidebar">
                    <ul class="nav tabs ">
                        <li class="active"><a href="#tab1" data-toggle="tab">Danh sách sản phẩm</a></li>
                        <li class=""><a href="#tab2" data-toggle="tab">Thêm sản phẩm mới</a></li> 
                    </ul>
                </nav>
                <div class=" tab-content tab-content-t ">                                                                  
                    <div class="tab-pane active text-style" id="tab1">
                        <div class="con-w3l">
                            <table class="table ">
                                <tr class="row">
                                    <th class="t-head head-it  col-md-1"></th>
                                    <th class="t-head head-it  col-md-4">Tựa đề</th>
                                    <th class="t-head col-md-1">NXB</th>
                                    <th class="t-head col-md-1">Đơn giá</th>
                                    <th class="t-head col-md-1">Số lượng</th>
                                    <th class="t-head col-md-2">Đường dẫn ảnh</th>
                                    <th class="t-head col-md-2">Tùy chọn</th>
                                </tr>

                                <c:forEach items="${requestScope.listBook}" var="lb" varStatus="status"> 
                                    <tr class="cross2 row">
                                        <td class="t-data col-md-1">
                                            <h3>${status.count}</h3>
                                        </td>
                                        <td class="t-data col-md-4">
                                            <div class="col-md-3">
                                                <h3><img src="${lb.imgLink}" class="img-responsive"></h3>
                                            </div>
                                            <div class="col-md-9">
                                                <h3>${lb.title}</h3>
                                            </div>
                                        </td>
                                        <td class="t-data col-md-1"><h3>${lb.publisher}</h3>
                                            <div class="clearfix"> </div>
                                        </td>                                               
                                        <td class="t-data col-md-1"><h3>${lb.price}</h3></td>
                                        <td class="t-data col-md-1"><h3>${lb.quantity}</h3></td> 
                                        <td class="t-data col-md-2"><h3>${lb.imgLink}</h3></td>
                                        <td class="t-data col-md-2">
                                            <div class="col-md-6">
                                                <div> 
                                                    <a href="updateBook?bid=${lb.id}"><button><h3>Sửa</h3></button></a>                                                      
                                                </div>
                                            </div>                                            
                                                <div>
                                                    <input type="hidden" value="${lb.id}" name="oid${lb.id}">                                                        
                                                    <h3><input type="button" style="background-color: #4CAF50; color: white; border: none" value="Xóa" onclick="confirmDelete('${lb.id}')"></h3>                                
                                                </div>
                                            <script>
                                                function confirmDelete(id) {
                                                    var result = confirm("Có chắc chắn muốn xóa sản phẩm này? Sản phẩm sẽ không thể xóa nếu tồn tại trong đơn hàng đã hoàn thành.");
                                                    if (result) {
                                                        window.location = "<%=request.getContextPath()%>/delete?bid="+id;
                                                    }
                                                }
                                            </script>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="tab-pane  text-style" id="tab2">    
                        <div class="row">
                            <div class="col-md-9">
                                <form id="updateForm" action="updateBook" method="post">
                                    <table class="table row-md-12">
                                        <tr class="col">
                                            <th><input  type="hidden" value="" name="id" required></th>
                                        </tr>
                                        <tr class="cross2 col">
                                            <td><h3>Tựa đề: &nbsp; <input  type="text" value="" name="title" required></h3>

                                            </td>
                                        </tr>
                                        <tr class="cross2 col">
                                            <td><h3>Nhà xuất bản: &nbsp;
                                                    <input  type="hidden" value="  " name="publisher" required>
                                                    <select type="text" value="${b.publisher}" name="publisherId" required>
                                                        <c:forEach items="${pub.all}" var="pn">
                                                            <option value="${pn.id}">${pn.name}</option>
                                                        </c:forEach>
                                                    </select></h3>

                                            </td>
                                        </tr>
                                        <tr class="cross2 col">
                                            <td><h3>Kho: &nbsp; <input  type="number" min="0" name="quantity" required></h3>
                                            </td>
                                        </tr>
                                        <tr class="cross2 col">
                                            <td><h3>Giá: &nbsp; <input  type="number" min="0" name="price" required></h3>
                                            </td>
                                        </tr>
                                        <tr class="cross2 col">
                                            <td><h4>Đường dẫn ảnh: &nbsp; <input type="text" name="imgLink" required></h4>
                                            </td>
                                        </tr>
                                        <tr class="cross2 col">
                                            <td><h3><input type="button" style="background-color: #4CAF50; color: white; border: none" value="Lưu thay đổi" onclick="confirmSubmit()">
                                                </h3>
                                            </td>
                                        </tr>
                                    </table>  
                                </form>
                                <script>
                                    function confirmSubmit() {
                                        var result = confirm("Bạn có chắc chắn lưu thông tin chỉnh sửa?");
                                        if (result) {
                                            document.getElementById("updateForm").submit();
                                        }
                                    }
                                </script>
                                <div class="clearfix"></div>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.js"></script>
    </body>
</html>