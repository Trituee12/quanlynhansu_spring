<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
    <link href="<c:url value="/assets/core/font-awesome/css/font-awesome.css"/>" rel="stylesheet" >
        
    <!-- Custom styles for this template -->
    <link href="<c:url value="/assets/core/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/core/css/style-responsive.css"/>" rel="stylesheet">

  </head>
  <script>
             
  </script>
  <body>
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  	
                    <form class="form-login" action="login" method="POST" >
		        <h2 class="form-login-heading"> <s:message code="label.login.title" text="ĐĂNG NHẬP" /></h2>
		        <div class="login-wrap">
		            <s:message code="label.login.username" text="Tài Khoản" />: <input  type="text" name="email" class="form-control" placeholder=" <s:message code="label.login.username" text="Tài Khoản" />"  />
		            <br>
		             <s:message code="label.login.password" text="Mật khẩu" />: <input  type="password" name="password" class="form-control" placeholder=" <s:message code="label.login.password" text="Mật khẩu" />"/>
		            <label class="checkbox">
		                <span class="pull-right">
                                    <a data-toggle="modal" href="login.html#myModal"> <s:message code="label.login.quenmk" text="Quên mật khẩu" /></a>
		                </span>
		            </label>
                            <p>${msg}</p>
                            <input class="btn btn-theme btn-block" type="submit" value="<s:message code="label.login.submit" text="Đăng nhập" />" >
                            Language: <a href="?lang=en">English</a> | <a href="?lang=vi">Việt Nam</a>
		        </div>
		</form>
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Quên mật khẩu ?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Nhập mail để khôi phục tài khoản</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">Hủy</button>
		                          <button class="btn btn-theme" type="button">Chấp nhận</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<c:url value="/assets/core/js/jquery.js"/>"></script>
    <script src="<c:url value="/assets/core/js/bootstrap.min.js"/>"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="<c:url value="/assets/core/js/jquery.backstretch.min.js"/>"></script>
    <script>
        $.backstretch("<c:url value="/assets/core/img/VKTPd2M.jpg"/>", {speed: 500});
    </script>


  </body>
</html>
