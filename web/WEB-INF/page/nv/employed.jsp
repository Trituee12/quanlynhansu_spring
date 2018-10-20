
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <!--external css-->
    <link href="<c:url value="/assets/core/font-awesome/css/font-awesome.css"/>" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<c:url value="/assets/core/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/core/css/style-responsive.css"/>" rel="stylesheet">

    <link href="<c:url value="/assets/core/css/table-responsive.css"/>" rel="stylesheet">
<script src="<c:url value="/assets/core/js/chart-master/Chart.js"/>"></script>
<script src="<c:url value="/assets/core/js/jquery-1.8.3.min.js"/>"></script>
<script src="<c:url value="/assets/core/js/bootstrap.min.js"/>"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
      
        function openPopup(){
    var dheight = document.body.clientHeight;
    var dwidth = document.body.clientWidth;
 
    $("#background").width(dwidth).height(dheight);
 
    $("#background").fadeTo("slow",0.8);
 
    var $popup1=$("#popup1");
    $popup1.css("top", (dheight-$popup1.height())/2);
    $popup1.css("left",(dwidth-$popup1.width())/2);
 
    $popup1.fadeIn();
}
  
   function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[6];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
		
    </script>
    
    <style>
        .trr:hover{
            background: lightsteelblue;
          color: #F7F8F9;
            cursor: pointer;
         
            
        }
        .trr{
            background: #ffffff;
            
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
            <a href="index.html" class="logo"><strong><s:message code="label.nv.abc"  /></strong></a>
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
                    <li><a class="logout" href="logout"><s:message code="label.nv.logout"/></a></li>
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
                          <span class="span1"><s:message code="label.nv.home" text="Trang chủ" /></span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a class="active" href="${pageContext.request.contextPath}/home/employed" >
                          <i class="fa fa-user"></i>
                          <span class="span1"><s:message code="label.nv.nv" text="Nhân viên" /></span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="${pageContext.request.contextPath}/home/Department" >
                          <i class="fa fa-cogs"></i>
                          <span class="span1" ><s:message code="label.pb.pb"/></span>
                      </a>
                     
                  </li>
                  <li class="sub-menu">
                      <a href="${pageContext.request.contextPath}/home/achievements" >
                          <i class="fa fa-book"></i>
                          <span class="span1" ><s:message code="label.ttkl.ttkl"/></span>
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
    
              <div style="float:left"><h3><i class="fa fa-angle-right "></i><strong><s:message code="label.nv.dsnv" text="DANH SÁCH NHÂN VIÊN" /></strong></h3></div>
              <c:choose>
                          <c:when test="${userad.getLoaitk() == 'AD'}">
                                <div style="float:right; padding-bottom: 10px"><a href="${pageContext.request.contextPath}/home/adddnv"><h3><button type="button" class="btn btn-theme col-sm-12"><i class="material-icons">person_add</i>&nbsp;&nbsp;<s:message code="label.nv.add"/></button></h3></a></div>
                        </c:when>  
              </c:choose>
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
                          
                             
                                   <input class="form-control round-form"  type="text" id="myInput" onkeyup="myFunction()" placeholder="<s:message code="label.nv.timkiem"  />">
                                
                                
                        
                                    <br/>
                              <table  class="table"   id="myTable">
                              <thead>
                                  <tr style="color : navy"> 
                                  <th  class="site_name"  style="text-align: center;font-weight: bold"><s:message code="label.nv.hinhanh"/></th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.nv.hoten"/></th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.nv.gt"/></th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.nv.ngaysinh"/></th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.nv.luong"/>(VND)</th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.nv.capdo"/></th>
                                  <th  style="text-align: center;font-weight: bold">Email</th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.nv.sdt"/></th>
                                  <th  style="text-align: center;font-weight: bold"><s:message code="label.pb.pb"/></th>
                                  
                                  <c:choose>
                                         <c:when test="${userad.getLoaitk() == 'AD'}">
                                <th  style="text-align: center;font-weight: bold"></th>
                                         </c:when>  
                                </c:choose>
                                  
                              </tr>
                              </thead>
                              <tbody>
                                   <c:forEach var="item" items="${list}">
                  
            
                                       <tr class="trr" style="color:black">
                                  <td  style="text-align: center; vertical-align: middle">
                                     <img src="${pageContext.servletContext.contextPath}/assets/core/img/friends/${item.tenhinh}" width="50" height="50" />
                                  </td>
                                  <td  style="text-align: center; vertical-align: middle"><c:out value="${item.hoten}"></c:out></td>
                                  <td  style="text-align: center; vertical-align: middle"><c:out value="${item.gioitinh}"></c:out></td>
                                  <td  style="text-align: center; vertical-align: middle"><c:out value="${item.ngaysinh}"></c:out></td>
                                  <td  style="text-align: center; vertical-align: middle"> <fmt:formatNumber value="${item.luong}" maxFractionDigits="3" /></td>
                                  <td  style="text-align: center; vertical-align: middle"><c:out value="${item.capdo}"></c:out></td>
                                  <td  style="text-align: center; vertical-align: middle"> <c:out value="${item.email}"></c:out></td>
                                  <td style="text-align: center; vertical-align: middle"> <c:out value="${item.dienthoai}"></c:out></td>
                                  <td style="text-align: center; vertical-align: middle"> <c:out value="${item.phongban.getTenphong()}"></c:out></td>
                                    
                                 
                                 
                                  <c:choose>
                                         <c:when test="${userad.getLoaitk() == 'AD'}">
                                            <td  style="text-align: center; vertical-align: middle"><a href="editnv?manv=${item.manv}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>&nbsp;<a href="<c:url value="/home/removenv/${item.manv}" />" class="btn btn-danger btn-xs" onclick="return confirm('Bạn có muốn xóa không?')"> <i class="fa fa-trash-o"></i></a></td>
                                         </c:when>  
                                </c:choose>
                                  
                                 
                                  </tr> 
                                 
                              </c:forEach>
                              
                              </tbody>
                          </table>
                                  <div class="pagination-container">
		<nav>
			<ul class="pagination"></ul>
		</nav>
	</div>
                          </section><hr>
                  </div>
						</div><!-- /col-md-4 -->
                                                        </div></div></div></div></div>  <!-- /row -->
		  	
		<!-- /row -->

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
    <script src="<c:url value="/assets/core/js/jquery.js"/>"></script>
    <script src="<c:url value="/assets/core/js/bootstrap.min.js"/>"></script>
    <script class="include" type="text/javascript" src="<c:url value="/assets/core/js/jquery.dcjqaccordion.2.7.js"/>"></script>
    <script src="<c:url value="/assets/core/js/jquery.scrollTo.min.js"/>"></script>
    <script src="<c:url value="/assets/core/js/jquery.nicescroll.js"/>" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="<c:url value="/assets/core/js/common-scripts.js"/>"></script>

    <!--script for this page-->
    

  </body>
</html>
