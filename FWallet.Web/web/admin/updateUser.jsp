<%-- 
    Document   : createUser
    Created on : Oct 1, 2021, 10:31:53 PM
    Author     : pphuh
--%>

<%@page import="java.util.List"%>
<%@page import="fwallet.data.university.UniversityDTO"%>
<%@page import="fwallet.data.university.UniversityDAO"%>
<%@page import="fwallet.data.user.UserDTO"%>
<%@page import="fwallet.data.user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Update Student Form
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
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userEmail = request.getParameter("email");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.getAUserByEmail(userEmail);
            if (user.isGender()) {
                String userGender = "male";
            } else {
                String userGender = "female";
            }
        %>
        <div class="wrapper ">
            <div class="sidebar" data-color="orange">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
                -->
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                        FCoin
                    </a>
                    <a href="http://www.creative-tim.com" class="simple-text logo-normal">
                        FPT University
                    </a>
                    <div class="navbar-minimize">
                        <button id="minimizeSidebar" class="btn btn-outline-white btn-icon btn-round">
                            <i class="now-ui-icons text_align-center visible-on-sidebar-regular"></i>
                            <i class="now-ui-icons design_bullet-list-67 visible-on-sidebar-mini"></i>
                        </button>
                    </div>
                </div>
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
                                    <li>
                                        <a href="#">
                                            <span class="sidebar-mini-icon">MP</span>
                                            <span class="sidebar-normal">My Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="sidebar-mini-icon">EP</span>
                                            <span class="sidebar-normal">Edit Profile</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="sidebar-mini-icon">S</span>
                                            <span class="sidebar-normal">Settings</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <ul class="nav">
                        <li>
                            <a href="../../examples/dashboard.html">
                                <i class="now-ui-icons design_app"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                </div>
            </div>
            <div class="main-panel" id="main-panel">
                <!-- Navbar -->
                <!-- End Navbar -->
                <form id="TypeValidation" class="form-horizontal" action="<%= request.getContextPath()%>/UpdateController" method="POST">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">Update Student</h4>
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">University</label>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <%
                                        String cmb = request.getParameter("cmbStatus");
                                        if (cmb == null) {
                                            cmb = "Choose a university";
                                        }
                                        UniversityDAO universityDAO = new UniversityDAO();
                                        List<UniversityDTO> universityList = universityDAO.getAllUniversity();

                                    %>
                                    <select name="universityName" class="form-control" id="exampleFormControlSelect1" required="true">
                                        
                                        <%
                                            if (universityList != null) {
                                                for (UniversityDTO university : universityList) {
                                        %>
                                        <option value="<%= university.getUniversityName()%>=<%= university.getUniversityID()%>"><%= university.getUniversityName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>  
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">Student Name</label>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="studentName" required="true" value="<%= user.getStudentName()%>"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">Age</label>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <input class="form-control" type="number" name="age" required="true" value="<%= user.getAge()%>"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">Gender</label>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="male" <%= user.isGender()? "checked" : "" %>>Male
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="female" <%= user.isGender()? "" : "checked" %>>Female
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">Address</label>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="address" required="true" value="<%= user.getAddress()%>"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <input class="form-control" type="email" name="email" required="true" value="<%= user.getEmail()%> " />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-sm-2 col-form-label">Account Status</label>
                            
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" required name="status" id="inlineRadio1" value="1" <%= user.getStatusID().equals("1")? "checked" : "" %>>Active
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="0" <%= user.getStatusID().equals("0")? "checked" : "" %>>Inactive
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="form-group">
                                    <input class="form-control" type="number" min="0" name="status" required="true" value="<%= user.getStatusID()%>"/>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            <input type="hidden" name="oldEmail" value="<%= userEmail%>"/>
                            <button type="submit"class="btn btn-primary">Update</button>
                        </div>
                    </div>
            </div>
        </div>
    </from>
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
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
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

