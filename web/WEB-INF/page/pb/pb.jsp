<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat" %>  
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
    <link href="<c:url value="/assets/core/css/newcss.css"/>" rel="stylesheet">
    <!--external css-->
    <link href="<c:url value="/assets/core/font-awesome/css/font-awesome.css"/>" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
     <link href="<c:url value="/assets/core/css/style.css"/>" rel="stylesheet">
     <link href="<c:url value="/assets/core/css/style-responsive.css"/>" rel="stylesheet">
<script src="<c:url value="/assets/core/js/chart-master/Chart.js"/>"></script>
<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
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
 
     function getTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('abcd').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){getTime()},500);
        }

        function checkTime(i)
        {
            if (i<10)
            {
                i="0" + i;
            }
            return i;
        }
  $(function(){

	// Cache some selectors

	var clock = $('#clock'),
		alarm = clock.find('.alarm'),
		ampm = clock.find('.ampm');

	// Map digits to their names (this will be an array)
	var digit_to_name = 'zero one two three four five six seven eight nine'.split(' ');

	// This object will hold the digit elements
	var digits = {};

	// Positions for the hours, minutes, and seconds
	var positions = [
		'h1', 'h2', ':', 'm1', 'm2', ':', 's1', 's2'
	];

	// Generate the digits with the needed markup,
	// and add them to the clock

	var digit_holder = clock.find('.digits');

	$.each(positions, function(){

		if(this == ':'){
			digit_holder.append('<div class="dots">');
		}
		else{

			var pos = $('<div>');

			for(var i=1; i<8; i++){
				pos.append('<span class="d' + i + '">');
			}

			// Set the digits as key:value pairs in the digits object
			digits[this] = pos;

			// Add the digit elements to the page
			digit_holder.append(pos);
		}

	});

	// Add the weekday names

	var weekday_names = 'MON TUE WED THU FRI SAT SUN'.split(' '),
		weekday_holder = clock.find('.weekdays');

	$.each(weekday_names, function(){
		weekday_holder.append('<span>' + this + '</span>');
	});

	var weekdays = clock.find('.weekdays span');


	// Run a timer every second and update the clock

	(function update_time(){

		// Use moment.js to output the current time as a string
		// hh is for the hours in 12-hour format,
		// mm - minutes, ss-seconds (all with leading zeroes),
		// d is for day of week and A is for AM/PM

		var now = moment().format("hhmmssdA");

		digits.h1.attr('class', digit_to_name[now[0]]);
		digits.h2.attr('class', digit_to_name[now[1]]);
		digits.m1.attr('class', digit_to_name[now[2]]);
		digits.m2.attr('class', digit_to_name[now[3]]);
		digits.s1.attr('class', digit_to_name[now[4]]);
		digits.s2.attr('class', digit_to_name[now[5]]);

		// The library returns Sunday as the first day of the week.
		// Stupid, I know. Lets shift all the days one position down, 
		// and make Sunday last

		var dow = now[6];
		dow--;
		
		// Sunday!
		if(dow < 0){
			// Make it last
			dow = 6;
		}

		// Mark the active day of the week
		weekdays.removeClass('active').eq(dow).addClass('active');

		// Set the am/pm text:
		ampm.text(now[7]+now[8]);

		// Schedule this function to be run again in 1 sec
		setTimeout(update_time, 1000);

	})();

	// Switch the theme

	$('a.button').click(function(){
		clock.toggleClass('light dark');
	});

});
    </script>
  </head>

  <body  onload="getTime()" >

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
              <div style="float:left"><h3><i class="fa fa-angle-right "></i><strong><s:message code="label.pb.tc"  /></strong></h3></div><div style="float:right; padding-bottom: 10px"><a href="${pageContext.request.contextPath}/home/adddnv"><h3><button type="button" class="btn btn-theme col-sm-12"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;<s:message code="label.nv.them"  /></button></h3></a></div>
          	
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
                                                                            <f:form action="addtt" method="POST">   <section id="unseen">    

 
                                                                             
                                                                           
                                                                                 
                                                                                                 
                                                                                 
                                                                                
                                                                                       
                                                                                  
  
                                                                                              
		                      <table class="table">
		                          <thead>
		                          <tr style="color : navy"> 
		                              <th style="text-align: center;font-weight: bold"><s:message code="label.nv.manv"  /></th>
		                              <th style="text-align: center;font-weight: bold"><s:message code="label.nv.hoten"  /></th>
		                              <th style="text-align: center;font-weight: bold"><s:message code="label.pb.sonv"  /></th>

                                             
		                          </tr>
		                          </thead>
                                         
		                          <tbody> 
                                            
                                              
                                                  <c:forEach var="item" items="${pbnv}" varStatus="abc">
                                                      <tr class="trr" style="color: black;">
                                                  <input type="text" hidden="" name="thanhtich[${abc.index}].nhanvien.manv" value="${item.manv}" >
                                                      <td><strong><img src="${pageContext.servletContext.contextPath}/assets/core/img/friends/${item.tenhinh}" class="img-circle" width="70"></strong></td>
                                                      <td style="text-align: center; vertical-align: middle"><c:out value="${item.hoten}"/></td>
                                                      <c:set var="phog" value="${item.phongban.getMaphong()}"/>
                                                      <td style="text-align: center; vertical-align: middle">
                                                          <label class="custom-control custom-checkbox">
                                                       <input type="checkbox"  class="custom-control-input" name="thanhtich[${abc.index}].loai" checked="" value="1">
                                                           <span class="custom-control-indicator"></span>
                                                       <input type="hidden" class="custom-control-input" name="thanhtich[${abc.index}].loai"  value="-1">
                                                          </label>
                                                             </td>
                                                             <input type="text" hidden=""  name="thanhtich[${abc.index}].phongban.maphong" value="${item.phongban.getMaphong()}" >
                                                  </tr>
                                              </c:forEach>
		                      
                                                     
                                                  </tbody>   
                                          
                                                                               
                                      </table>
                                              
                                           
                                                    </section>
                                           
                                               
                                              
                                                          <input type="submit" value="Điểm danh" class="btn btn-primary">  
                                                      
                                                    
                                                      
                                                   
                                              
                                    
                                              
                                                                            </f:form><hr>
									
                                                                        </div>
							</div>
						</div><!-- /col-md-4 -->
                                                </div></div></div></div>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
<div id="clock" class="light">
			<div class="display">
				<div class="weekdays">  <span style="color: black;font-weight: bold; font-size: 40px; font-family: 'Orbitron', sans-serif;" id="abcd"></span></div>
				
		</div>
</div>
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
