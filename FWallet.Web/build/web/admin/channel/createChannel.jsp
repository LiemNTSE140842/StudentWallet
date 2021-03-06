<%-- 
    Document   : createChanel
    Created on : Oct 22, 2021, 8:02:25 AM
    Author     : ThanhLiemPro
--%>

<%@page import="fwallet.data.user.UserDTO"%>
<%@page import="fwallet.data.channel.ChannelDTO"%>
<%@page import="fwallet.data.channel.ChannelDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Create Channel Page
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <!-- CSS Files -->
        <link href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/assets/css/now-ui-dashboard.css?v=1.6.0" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="<%= request.getContextPath()%>/assets/demo/demo.css" rel="stylesheet" />
    </head>

    <body class=" sidebar-mini ">
        <div class="wrapper ">
            <div class="sidebar" data-color="orange">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
                -->
                <div class="logo">
                    <a href="#" class="simple-text logo-mini">
                        FPT
                    </a>
                    <a href="#" class="simple-text logo-normal">
                        Admin 
                    </a>
                    <div class="navbar-minimize">
                        <button id="minimizeSidebar" class="btn btn-outline-white btn-icon btn-round">
                            <i class="now-ui-icons text_align-center visible-on-sidebar-regular"></i>
                            <i class="now-ui-icons design_bullet-list-67 visible-on-sidebar-mini"></i>
                        </button>
                    </div>
                </div>

                <%
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                %>
                <div class="sidebar-wrapper" id="sidebar-wrapper">
                    <div class="user">
                        <div class="photo">
                            <img src="<%= loginUser.getImage()%>" />
                        </div>
                        <div class="info">
                            <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                                <span>
                                    <%= loginUser.getUserID()%>
                                    <b class="caret"></b>
                                </span>
                            </a>
                            <div class="clearfix"></div>
                            <div class="collapse" id="collapseExample">
                                <ul class="nav">
                                </ul>
                            </div>
                        </div>
                    </div>
                    <ul class="nav">
                        <li>
                            <a href="<%= request.getContextPath()%>/admin/channelData.jsp">
                                <i class="now-ui-icons design_app"></i>
                                <p>Back To Channel Page</p>
                            </a>
                        </li>
                </div>
            </div>
            <div class="main-panel" id="main-panel">
                <!-- Navbar -->
                <!-- End Navbar -->
                <form id="TypeValidation" class="form-horizontal" action="<%= request.getContextPath()%>/CreateChanelDataController" method="POST">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">Create Channel</h4>
                        </div>
                        <div class="card-body ">
                            <div class="row">
                                <label class="col-sm-2 col-form-label">Channel ID</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" type="text"  name="channelID" required="true" placeholder="The fomat channelID cn-6{XXX}" />
                                        <h5 style="color: red">${requestScope.MASSAGEID}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a href="../studentData.jsp"></a>
                                <label class="col-sm-2 col-form-label">Channel Name</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="channelName" value="${param.channelName}" required="true" />
                                        <h5 style="color: red">${requestScope.MASSAGENAME}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 col-form-label">Office</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="channelOffice" value="${param.channelOffice}" required="true" />
                                        <h5 style="color: red">${requestScope.MASSAGEOFF}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-2 col-form-label">Phone</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" type="number" name="channelPhone" required="true" value="${param.channelPhone}"/>
                                        <h5 style="color: red">${requestScope.MASSAGEPHONE}</h5>
                                    </div>
                                </div>
                            </div>  
                            <div class="card-footer text-center">
                                <button class="btn btn-primary btn-fill">Create Channel</button>
                            </div>
                            </form>                      
                        </div>
                    </div>
            </div>
        </div>

        <!-- footer -->
        <footer class="footer">
            <div class=" container-fluid ">
                <nav>
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://presentation.creative-tim.com">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright" id="copyright">
                    &copy; <script>
                        document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
                    </script>, Designed by <a href="https://www.facebook.com/siliem3k" target="_blank">LiemTroller</a>. Coded by <a href="https://www.facebook.com/pphuhuy" target="_blank">PhuHuy</a>.
                </div>
            </div>
        </footer>
    </div>
</div>
<!--   Core JS Files   -->
<script src="<%= request.getContextPath()%>/assets/js/core/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/assets/js/core/popper.min.js"></script>
<script src="<%= request.getContextPath()%>/assets/js/core/bootstrap.min.js"></script>
<script src="<%= request.getContextPath()%>/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/assets/js/plugins/moment.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/sweetalert2.min.js"></script>
<!-- Forms Validations Plugin -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/jquery.validate.min.js"></script>
<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-datetimepicker.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chart JS -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="<%= request.getContextPath()%>/assets/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
<script src="<%= request.getContextPath()%>/assets/demo/demo.js"></script>
<script>
              function setFormValidation(id) {
                  $(id).validate({
                      highlight: function (element) {
                          $(element).closest('.form-group').removeClass('has-success').addClass('has-danger');
                          $(element).closest('.form-check').removeClass('has-success').addClass('has-danger');
                      },
                      success: function (element) {
                          $(element).closest('.form-group').removeClass('has-danger').addClass('has-success');
                          $(element).closest('.form-check').removeClass('has-danger').addClass('has-success');
                      },
                      errorPlacement: function (error, element) {
                          $(element).append(error);
                      },
                  });
              }

              $(document).ready(function () {
                  setFormValidation('#RegisterValidation');
                  setFormValidation('#TypeValidation');
                  setFormValidation('#LoginValidation');
                  setFormValidation('#RangeValidation');
              });
</script>
</body>

</html>
