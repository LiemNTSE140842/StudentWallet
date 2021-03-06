<%-- 
    Document   : welcome
    Created on : Sep 25, 2021, 3:14:46 PM
    Author     : pphuh
--%>

<%@page import="fwallet.data.studentreward.StudentRewardDTO"%>
<%@page import="java.util.List"%>
<%@page import="fwallet.data.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Add Point Page
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
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <div class="wrapper ">
            <div class="sidebar" data-color="orange">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
                -->
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                        FPT
                    </a>
                    <a href="http://www.creative-tim.com" class="simple-text logo-normal">
                        Student
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
                            <img src="<%= user.getImage()%>"height="150px" width="150px"/>
                        </div>
                        <div class="info">
                            <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                                <span>
                                    <%= user.getUserID()%>
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
                                </ul>
                            </div>
                        </div>
                    </div>
                    <ul class="nav">
                        <li>
                            <a data-toggle="collapse" href="#pagesExamples">
                                <i class="now-ui-icons design_image"></i>
                                <p>
                                    Data <b class="caret"></b>
                                </p>
                            </a>
                            <div class="collapse " id="pagesExamples">
                                <ul class="nav">
                                    <li>
                                        <a href="<%= request.getContextPath()%>/admin/channelData.jsp">
                                            <span class="sidebar-mini-icon">C</span>
                                            <span class="sidebar-normal"> Channel </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath()%>/admin/rewardData.jsp">
                                            <span class="sidebar-mini-icon">R</span>
                                            <span class="sidebar-normal"> Reward</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath()%>/admin/productData.jsp">
                                            <span class="sidebar-mini-icon">P</span>
                                            <span class="sidebar-normal"> Product </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath()%>/admin/studentData.jsp">
                                            <span class="sidebar-mini-icon">S</span>
                                            <span class="sidebar-normal"> Student </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath()%>/admin/walletData.jsp">
                                            <span class="sidebar-mini-icon">W</span>
                                            <span class="sidebar-normal">Wallet</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="sidebar-mini-icon">AP</span>
                                            <span class="sidebar-normal">Add Point</span>
                                        </a>
                                    </li>
                                </ul>
                    </ul>
                </div>                         
            </div>
            <div class="main-panel" id="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <div class="navbar-toggle">
                                <button type="button" class="navbar-toggler">
                                    <span class="navbar-toggler-bar bar1"></span>
                                    <span class="navbar-toggler-bar bar2"></span>
                                    <span class="navbar-toggler-bar bar3"></span>
                                </button>
                            </div>
                            <a class="navbar-brand" href="#pablo">Student Wallet</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <form action="<%=request.getContextPath()%>/SearchStudentRewardDataController" id="search" method="POST">


                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link">
                                            <select name="filterStatus" aria-labelledby="navbarDropdownMenuLink">
                                                <option  value="All" selected>All</option>
                                                <option  value="Deleted">Deleted</option>
                                                <option  value="Activated">Activated</option>
                                            </select>
                                        </a>

                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/LogOutController">
                                            <i class="now-ui-icons media-1_button-power"></i>
                                            <p>
                                                <span class="d-lg-none d-md-block"></span>
                                                Log Out
                                            </p>
                                        </a>
                                    </li>
                                </ul>
                                <div class="input-group no-border">
                                    <input type="text" name="search" value="" class="form-control" placeholder="Search By Email">
                                    <div class="input-group-append" onclick="returnForm()">
                                        <div class="input-group-text">
                                            <i class="now-ui-icons ui-1_zoom-bold"></i>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <div class="panel-header">
                </div>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Student Reward Data</h4>
                                </div>
                                <div class="card-body">
                                    <div class="toolbar">
                                        <form action="<%= request.getContextPath()%>/admin/studentReward/createStudentReward.jsp">
                                            <button class="btn btn-primary">Create</button>
                                        </form>   
                                    </div>
                                    <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Student ID</th>
                                                <th>Email</th>
                                                <th>Reward Name</th>
                                                <th>Reward Status</th>
                                                <th class="disabled-sorting">Actions</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Student ID</th>
                                                <th>Email</th>
                                                <th>Reward Name</th>
                                                <th>Reward Status</th>
                                                <th class="disabled-sorting">Actions</th>
                                            </tr>
                                        </tfoot>
                                        
                                        <tbody>
                                            <%
                                            List<StudentRewardDTO> list = (List<StudentRewardDTO>) request.getAttribute("STUDENT_REWARD_LIST");
                                            if (list != null) {
                                                if (!list.isEmpty()) {
                                                    for (StudentRewardDTO studentReward : list) {
                                        %>
                                            <tr>
                                                <td><%= studentReward.getStudentID()%> </td>
                                                <td><%= studentReward.getEmail()%></td>
                                                <td><%= studentReward.getRewardName()%></td>
                                                <td><%= studentReward.isStudentRewardStatus()? "holding" : "used" %></td>
                                                <td>
                                                    <a href="RemoveStudentRewardController?studentRewardID=<%= studentReward.getStudentRewardID()%>" class="btn btn-round btn-danger btn-icon btn-sm remove"><i class="fas fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <%
                                            }
                                        %>
                                        <%
                                            }
                                        %>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                        
                                    </table>
                                </div><!-- end content-->
                            </div><!--  end card  -->
                        </div> <!-- end col-md-12 -->
                    </div> <!-- end row -->
                </div>
                <footer class="footer">
                    <div class=" container-fluid ">
                        <nav>
                            <ul>
                                <li>
                                    <a href="https://www.creative-tim.com">
                                        HotLine
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
                                $(document).ready(function () {
                                    $('#datatable').DataTable({
                                        "pagingType": "full_numbers",
                                        "lengthMenu": [
                                            [10, 25, 50, -1],
                                            [10, 25, 50, "All"]
                                        ],
                                        responsive: true,
                                        language: {
                                            search: "_INPUT_",
                                            searchPlaceholder: "Search records",
                                        }

                                    });

//                                    var table = $('#datatable').DataTable();

                                    // Edit record
//                                    table.on('click', '.edit', function () {
//                                        $tr = $(this).closest('tr');
//                                        if ($($tr).hasClass('child')) {
//                                            $tr = $tr.prev('.parent');
//                                        }

//                                        var data = table.row($tr).data();
//                                        alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
//                                    });

                                    // Delete a record
//                                    table.on('click', '.remove', function (e) {
//                                        $tr = $(this).closest('tr');
//                                        if ($($tr).hasClass('child')) {
//                                            $tr = $tr.prev('.parent');
//                                        }
//                                        table.row($tr).remove().draw();
//                                        e.preventDefault();
//                                    });

                                    //Like record
//                                    table.on('click', '.like', function () {
//                                        alert('You clicked on Like button');
//                                    });
                                });
                                function returnForm() {
                                    document.getElementById('search').submit();             // Function returns the product of a and b
                                }
        </script>
    </body>

</html>
