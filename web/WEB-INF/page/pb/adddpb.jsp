<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/assets/core/css/bootstrap.css"/>" rel="stylesheet">
    <!--external css-->
     <link href="<c:url value="/assets/core/font-awesome/css/font-awesome.css"/>" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/core/js/bootstrap-datepicker/css/datepicker.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/core/js/bootstrap-daterangepicker/daterangepicker.css"/>" />
        
    <!-- Custom styles for this template -->
    <link href="<c:url value="/assets/core/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/core/css/style-responsive.css"/>" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style>        .span1{
            font-size: 15px;
            font-weight: bold;
        }
        body{
            font-family: sans-serif;
            color: black;
        }
        .round-form {
            color: blue;
        }
    </style>
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b><s:message code="label.nv.abc"  /></b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
               <ul class="nav top-menu">
                        <a  href="?lang=en">
                           <img src="${pageContext.servletContext.contextPath}/assets/core/img/USA.png"/>
                        </a>
                        
                    
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                        <a  href="?lang=vi">
                           <img src="${pageContext.servletContext.contextPath}/assets/core/img/Viet Nam_1.png"/>
                        </a>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout"><s:message code="label.nv.logout"  /></a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	 <h5 class="centered table">
                          <c:if test="${userad.getLoaitk() == 'AD'}">
                             <p class="centered"><a href=""><img src="${pageContext.servletContext.contextPath}/assets/core/img/friends/${userad.getTenhinh()}" class="img-circle" width="70"></a></p>
                               ${userad.getHoten()}
                          </c:if>
                     <c:if test="${usernv.getLoaitk() == 'NV'}">
                                                                 <p class="centered"><a href="achievements.jsp"><img src="${pageContext.servletContext.contextPath}/assets/core/img/friends/${usernv.getTenhinh()}" class="img-circle" width="60"></a></p>
                               ${usernv.getHoten()}
                          </c:if>
                      
                  </h5>

                  <li class="mt" >
                      <a  href="${pageContext.request.contextPath}/home/">
                          <i class="fa fa-dashboard"></i>
                          <span class="span1"><s:message code="label.nv.home"  /></span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="${pageContext.request.contextPath}/home/employed" >
                          <i class="fa fa-user"></i>
                          <span class="span1"><s:message code="label.nv.nv"  /></span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="${pageContext.request.contextPath}/home/Department" >
                          <i class="fa fa-cogs"></i>
                          <span class="span1" ><s:message code="label.pb.pb"  /></span>
                      </a>
                     
                  </li>
                  <li class="sub-menu">
                      <a href="${pageContext.request.contextPath}/home/achievements" >
                          <i class="fa fa-book"></i>
                          <span class="span1" ><s:message code="label.ttkl.ttkl"  /></span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper ">
              <h3><i class="fa fa-angle-right"></i><strong><s:message code="label.pb.suapb"  /></strong></h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel ">
                  	  
                      <f:form class="form-horizontal style-form" action="addpbp"  method="POST">
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"><s:message code="label.pb.mapb"  /></label>
                              <div class="col-sm-10">
                                  <input type="text"   class="form-control round-form" name="maphong" >
                                  <p>${errorpb}</p>
                              </div>
                          </div>
                              <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"><s:message code="label.pb.tenpb"  /></label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" name="tenphong" >
                                  <p>${errorpb1}</p>
                              </div>
                          </div>    
                          <div style="text-align: center">
                              <input type="submit" class="btn btn-primary" value="<s:message code="label.nv.them"  />"/></div>
                      </f:form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
          	<!-- INLINE FORM ELELEMNTS -->
          	
          	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="form_component.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<c:url value="/assets/core/js/jquery.js"/>"></script>
    <script src="<c:url value="/assets/core/js/bootstrap.min.js"/>"></script>
    <script class="include" type="text/javascript" src="<c:url value="/assets/core/js/jquery.dcjqaccordion.2.7.js"/>"></script>
    <script src="<c:url value="/assets/core/js/jquery.scrollTo.min.js"/>"></script>
    <script src="<c:url value="/assets/core/js/jquery.nicescroll.js"/>" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="<c:url value="/assets/core/js/common-scripts.js"/>"></script>

    <!--script for this page-->
    <script src="<c:url value="/assets/core/js/jquery-ui-1.9.2.custom.min.js"/>"></script>

	<!--custom switch-->
	<script src="<c:url value="/assets/core/js/bootstrap-switch.js"/>"></script>
	
	<!--custom tagsinput-->
	<script src="<c:url value="/assets/core/js/jquery.tagsinput.js"/>"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="<c:url value="/assets/core/js/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/assets/core/js/bootstrap-daterangepicker/date.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/assets/core/js/bootstrap-daterangepicker/daterangepicker.js"/>"></script>
	
	<script type="text/javascript" src="<c:url value="/assets/core/js/bootstrap-inputmask/bootstrap-inputmask.min.js"/>"></script>
	
	
	<script src="<c:url value="/assets/core/js/form-component.js"/>"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
