<%-- 
    Document   : showProduct
    Created on : Oct 3, 2021, 11:11:24 AM
    Author     : pphuh
--%>

<%@page import="fwallet.data.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="<%= request.getContextPath()%>/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   Show Product
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
          Student FPT
        </a>
        <div class="navbar-minimize">
          <button id="minimizeSidebar" class="btn btn-outline-white btn-icon btn-round">
            <i class="now-ui-icons text_align-center visible-on-sidebar-regular"></i>
            <i class="now-ui-icons design_bullet-list-67 visible-on-sidebar-mini"></i>
          </button>
        </div>
        </div>
      </div>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
       <%
                List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("LIST_PRODUCT");
                if(list!=null){
                for(ProductDTO p : list){
            %> 
      <div class="wrapper wrapper-full-page ">
        <div class="full-page pricing-page section-image" data-image="<%= request.getContextPath()%>/assets/img/bg15.jpg">
          <div class="content">
            <div class="container">
              <div class="row">
                <div class="col-md-6 ml-auto mr-auto text-center">
                  <h2 class="title">Pick the hot product for Summer </h2>
                  <h5 class="description"> We have choice with you point you have</h5>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-3 col-md-6">
                  <div class="card card-pricing card-plain">
                    <h6 class="card-category"> Bravo Pack</h6>
                    <div class="card-body">
                      <div class="card-icon icon-warning ">
                        <i class="now-ui-icons media-1_button-power"><%= p.getImage() %></i>
                      </div>
                      <h3 class="card-title"> <%= p.getPrice() %></h3>
                      <ul>
                        <li><%= p.getProductName() %></li>
                        <li>For to do list</li>
                      </ul>
                    </div>
                    <form action="ChargePointController">
                    <div class="card-footer">
                    <a href="#pablo" class="btn btn-round btn-primary">Add to Cart</a>
                    </div>
                        </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
                         <%
                    }
            %>
            <%
                }else{
            %>                        
                <h1>No Product</h1>
            <%
                }
            %>
      <!-- End Navbar -->

          </div> <!-- wizard container -->
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
  <script src="<%= request.getContextPath()%>/assets/js/core/jquery.min.js"></script>
  <script src="<%= request.getContextPath()%>/assets/js/core/popper.min.js"></script>
  <script src="<%= request.getContextPath()%>/js/core/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath()%>/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <script src="<%= request.getContextPath()%>/assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="<%= request.getContextPath()%>/assets/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="<%= request.getContextPath()%>/assets/js/plugins/sweetalert2.min.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="<%= request.getContextPath()%>/assets/js/plugins/jquery.validate.min.js"></script>
  <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="<%= request.getContextPath()%>/js/plugins/jquery.bootstrap-wizard.js"></script>
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
    $(document).ready(function() {
      // Initialise the wizard
      demo.initNowUiWizard();
      setTimeout(function() {
        $('.card.card-wizard').addClass('active');
      }, 600);
    });
  </script>
</body>

</html>


 <%--<%@page import="fwallet.data.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
 <!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>
        <h1>All Product</h1>
        <div class="col mb-5" style="display: inline-flex;">
            <%--<%
                List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("LIST_PRODUCT");
                if(list!=null){
                for(ProductDTO p : list){
            %>
                        <div class="card h-100" style="margin: auto 30px;">
                            <!-- Product image-->
                            <%-- <img class="card-img-top" src="<%= p.getImage() %>" alt="" /> --%>
                            <!-- Product details-->
                            <%--<div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%= p.getProductName() %></h5>
                                    <!-- Product price-->
                                    <%= p.getPrice() %>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <form action="ChargePointController">
                                    </div>
                                        <button type="submit" name="action" value="Add to cart" class="btn btn-outline-dark mt-auto">Get</button>
                                    </div>
                                </form>
            <%
                    }
            %>
            <%
                }else{
            %>                        
                <h1>No Product</h1>
            <%
                }
            %>
                            </div>

                        </div>
                    </div>
    </body>
                            </html>--%>

