<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
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
        
    <!-- Custom styles for this template -->
    <link href="<c:url value="/assets/core/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/core/css/style-responsive.css"/>" rel="stylesheet">

    <script src="<c:url value="/assets/core/js/chart-master/Chart.js"/>"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
    
    <![endif]-->
   <style>
        .trr:hover{
            background-color: lightsteelblue;
            color: black;
            cursor: pointer;
        }
       
        
        .span1{
            font-size: 15px;
            font-weight: bold;
        }
        body{
            font-family: sans-serif;
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
                      <a class="active" href="${pageContext.request.contextPath}/home/achievements" >
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
          <section class="wrapper site-min-height">
              <div style="float:left"><h3><i class="fa fa-angle-right"></i><strong><s:message code="label.tkkl.tk"  /></strong></h3></div>
              <div style="float:right; padding-bottom: 10px"><a href="${pageContext.request.contextPath}/home/tongdiemcn"><h3><button type="button" class="btn btn-theme col-sm-12"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<s:message code="label.ttkl.thanhtichcanhan"  /></button></h3></a></div>
              <div style="float:right; padding-bottom: 10px"><a href="${pageContext.request.contextPath}/home/tongdiempb"><h3><button type="button" class="btn btn-theme col-sm-12"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<s:message code="label.ttkl.thanhtichphongban"  /></button></h3></a></div>

          	<div class="row mt">
          		<div class="col-lg-12">
          		
					<! -- 1st ROW OF PANELS -->
					<div class="row">
						<!-- TWITTER PANEL -->
						<!-- /col-md-4 -->
						
						<div class="col-lg-12 col-md-12 col-sm-12 mb">
							<!-- WHITE PANEL - TOP USER -->
                                                        <div style="text-align: center">
								<div class="white-header">
									<div class="content-panel">
                                                                            <section id="unseen">
                             
                                                                                <table  class="table" >
                                                                                <thead>
                                                                                    <tr style="color : navy"> 
                                                                                        <th style="text-align: center"><s:message code="label.nv.manv"  /></th>
                                                                                        <th style="text-align: center"><s:message code="label.nv.hoten"  /></th>
                                                                                        <th style="text-align: center"><s:message code="label.nv.loai"  /></th>
                                                                                        <th style="text-align: center"><s:message code="label.tkkl.lydo"  /></th>
                                                                                        <th style="text-align: center"><s:message code="label.ttkl.ngay"  /></th>
                                                                                    </tr>
                                                                                    
                                                                            </thead>
                                                                            <tbody>
                                                                                <c:forEach var="item" items="${listtt}">
                                                                                    <tr class="trr" style="color: black;">
                                                                <td>  <img src="${pageContext.servletContext.contextPath}/assets/core/img/friends/${item.nhanvien.getTenhinh()}" class="img-circle" width="70"></td>
                                                                                     <td style="text-align: center; vertical-align: middle"><c:out value="${item.nhanvien.getHoten()}"/></td>
                                                                                    <c:choose>
                                                                                        <c:when test="${item.loai == -1}">
                                                                                            <td style="text-align: center; vertical-align: middle"><span class="badge bg-important">0</span></td>
                                                                                    </c:when>
                                                                                       <c:when test="${item.loai == 1}">
                                                                                            <td style="text-align: center; vertical-align: middle"> <span  class="badge bg-warning">${item.loai}</span></td>
                                                                                    </c:when> 
                                                                                    </c:choose>
                                                                                            <td style="text-align: center; vertical-align: middle"><c:choose>
                                                                                                                                             <c:when test="${item.loai == 1}">
                                                                                                                                    Đúng giờ                        
                                                                                                                                                        </c:when>
                                                                                                                                                        <c:otherwise>Vắng</c:otherwise>     
                                                                                                                                                    </c:choose></td>
                                                                                    <td style="text-align: center; vertical-align: middle"><c:out value="${item.ngayghinhan}"/></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                                </table></section><hr>
									</div>
							</div>
						</div><!-- /col-md-4 -->
                                        </div></div></div>
						
			
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="panels.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<c:url value="assets/core/js/jquery.js"/>"></script>
    <script src="<c:url value="assets/core/js/bootstrap.min.js"/>"></script>
    <script class="include" type="text/javascript" src="<c:url value="assets/core/js/jquery.dcjqaccordion.2.7.js"/>"></script>
    <script src="<c:url value="assets/core/js/jquery.scrollTo.min.js"/>"></script>
    <script src="<c:url value="assets/core/js/jquery.nicescroll.js"/>" type="text/javascript"></script>
    <script src="<c:url value="assets/core/js/jquery.sparkline.js"/>"></script>

    <!--common script for all pages-->
    <script src="<c:url value="assets/core/js/common-scripts.js"/>"></script>

    <!--script for this page-->
    <script src="<c:url value="assets/core/js/sparkline-chart.js"/>"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
