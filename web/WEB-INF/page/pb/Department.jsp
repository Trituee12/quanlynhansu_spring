<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style>
        .trr:hover{
            background-color: lightsteelblue;
            color: white;
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
    <script>
             function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
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
                      <a class="active" href="${pageContext.request.contextPath}/home/Department" >
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
          <section class="wrapper site-min-height">
              <div style="float:left"><h3><i class="fa fa-angle-right "></i><strong><s:message code="label.pb.tc"  /></strong></h3></div><div style="float:right; padding-bottom: 10px"><a href="${pageContext.request.contextPath}/home/addpb"><h3><button type="button" class="btn btn-theme col-sm-12"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<s:message code="label.nv.them"  /></button></h3></a></div>
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
		                              <th style="text-align: center;font-weight: bold"><s:message code="label.pb.mapb"  /></th>
		                              <th style="text-align: center;font-weight: bold"><s:message code="label.pb.tenpb"  /></th>
		                              <th style="text-align: center;font-weight: bold"><s:message code="label.pb.sonv"  /></th>
                                              <th style="text-align: center;font-weight: bold"></th>
		                          </tr>
		                          </thead>
		                          <tbody>
                                             <% Class.forName("com.mysql.jdbc.Driver");
                                              Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlythanhtichabc","root","");
                                              try{
                                              
                                              Statement st = c.createStatement();
                                              String sql = "select phongban.maphong,phongban.tenphong,COUNT(*) from nhanvien INNER join phongban where nhanvien.maphongban = phongban.maphong GROUP by phongban.maphong";
                                              ResultSet rs = st.executeQuery(sql);
                                              while(rs.next()){
                                              %>
                                                  <tr class="trr" style="color: black">
                                                      <td><strong><a style="font-size: 20px;" href="diemdanh?maphongban=<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase() %></a></strong></td>
                                                      <td style="vertical-align: middle"><%=rs.getString(2) %></td>
                                                      <td style="vertical-align: middle">
                                 
                                              <c:out value="<%=rs.getInt(3)%>"/>
                                              
                                                        </td>
                                             
		                              
                                             
                                                      <td style="vertical-align: middle"><a href="editpb?maphong=<%=rs.getString(1) %>" class="btn btn-primary btn-xs"> <i class="fa fa-pencil"></i></a>&nbsp; <a href="removepb/<%=rs.getString(1) %>" class="btn btn-danger btn-xs" onclick="return confirm('Bạn có muốn xóa không?')"> <i class="fa fa-trash-o"></i></a></td>
                                          </tr>             <% } 
                                          rs.close();
                                          st.close();
                                          }
                                          catch(SQLException e){}
                                          finally{
                                                if(c!=null){c.close();}}
                                          %>
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
              <a href="basic_table.html#" class="go-top">
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
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
