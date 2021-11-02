<%-- 
    Document   : transactionDetail
    Created on : Nov 1, 2021, 2:30:12 PM
    Author     : ThanhLiemPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Create User
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
                    <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                        FPT
                    </a>
                    <a href="http://www.creative-tim.com" class="simple-text logo-normal">
                        USER
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
                            <img src="" />
                        </div>
                        <div class="info">
                            <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                                <span>
                                   
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
                            <a href="../../examples/dashboard.html">
                                <i class="now-ui-icons design_app"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                </div>
            </div>
              <div class="wrapper wrapper-full-page ">
    <div class="full-page invoice-page section-image" filter-color="black" data-image="../../assets/img/bg13.jpg">
      <!--   you can change the color of the filter page using: data-color="blue | green | orange | red | purple" -->
      <div class="content">
        <div class="container">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="card card-invoice mt-5">
              <div class="card-header text-center" data-color-icon="warning">
                <div class="row">
                </div>
                <div class="row">
                  <div class="col-12">
                    <h4 class="card-title">Invoice <span class="font-weight-light">#AFG4261KL</span></h4>
                    <h5 class="card-description mt-3 font-weight-bold">
                      <hr> Creative Tim
                    </h5>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive">
                      <table class="table mt-3">
                        <thead>
                          <tr>
                            <th class="pl-0">
                              <h6 class="font-weight-bold text-capitalize">Product</h6>
                            </th>
                            <th class="px-0 ">
                              <h6 class="font-weight-bold text-capitalize">Unit</h6>
                            </th>
                            <th class="pr-0 text-right">
                              <h6 class="font-weight-bold text-capitalize">Price</h6>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="pl-0">
                              Web Updates
                            </td>
                            <td class="px-0">
                              1
                            </td>
                            <td class="pr-0 text-right">
                              $380.00
                            </td>
                          </tr>
                          <tr>
                            <td class="pl-0">
                              SSL Renewals
                            </td>
                            <td class="px-0">
                              3
                            </td>
                            <td class="pr-0 text-right">
                              $175.00
                            </td>
                          </tr>
                          <tr>
                            <td class="pl-0">
                              VAT
                            </td>
                            <td class="px-0">
                              1
                            </td>
                            <td class="pr-0 text-right">
                              $37.00
                            </td>
                          </tr>
                          <tr>
                            <td class="px-0 font-weight-bold">
                              Total amount due
                            </td>
                            <td></td>
                            <td class="px-0 text-right">
                              <h3>
                                $592.00
                              </h3>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <div class="row mt-5">
                  <div class="col-12 col-md-6">
                    <h6 class="text-uppercase card-description font-weight-bold mb-3">
                      Invoiced from
                    </h6>
                    <p class="mb-4">
                      <strong>Chris Michael</strong> <br>
                      133 Nice Street <br>
                      Appleville, NY 34212
                    </p>
                  </div>
                  <div class="col-12 col-md-6 text-md-right">
                    <h6 class="text-uppercase card-description font-weight-bold mb-3">
                      Invoiced to
                    </h6>
                    <p class="mb-4">
                      <strong>Jenny Lame</strong> <br>
                      12 Nord Street <br>
                      Dortmund, QR 63568
                    </p>
                  </div>
                </div>
              </div>
              <hr class="hr">
              <div class="card-footer text-center">
                <button type="button" class="btn btn-primary btn-round w-50 mt-3" name="button">Back to</button>
                <h6 class="mt-4 text-left">
                  <div class="h6 text-capitalize font-weight-bold card-description mb-3">
                    Notes
                  </div>
                  The notes added will not be reflected in the previously generated invoices. It will only be added to the upcoming invoices.
                </h6>
              </div>
            </div>
          </div>
        </div>
      </div>
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
<script src="<%= request.getContextPath()%>/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="<%= request.getContextPath()%>/assets/js/now-ui-dashboard.min.js?v=1.6.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
<script src="<%= request.getContextPath()%>/assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      demo.checkFullPageBackgroundImage();
    });
  </script>
</body>

</html>