<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="User_Home" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <title>HOME</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/f299e4c7c4.js"></script>
	  <link href="../css/stylehome.css" rel="stylesheet" type="text/css"/>
	   <link href="../css/nav_footer.css" rel="stylesheet" type="text/css"/>
	<style>
	    .main_img {
	        background-image: url("../image/hero_img.png") !important;
	        background-size: contain;
	        background-repeat: no-repeat;
	        width: 106%;
	    }

	    @media (min-width: 700px) and (max-width: 990px) {
	        .main_img {
	            width: 122%;
	        }
	    }

	    @media (min-width: 500px)(max-width: 700px) {
	        .main_img {
	            width: 122%;
	        }
	    }

	    @media (max-width: 500px) {
	        .main_img {
	            width: 106%;
	        }
	    }
	</style>
	</head>
	<body>
        <form id="form1" runat="server">
	<!-- Above navigation bar -->   

	 <nav class="[ navbar navbar-fixed-top ][ navbar-bootsnipp animate ]" role="navigation">
    	<div class="[container-fluid ]">
			
				<!-- Brand and toggle get grouped for better mobile display -->
			<div class="[ navbar-header ]">
				<button type="button" class="[ navbar-toggle ]" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="[ sr-only ]">Toggle navigation</span>
					<span class="[ icon-bar ]"></span>
					<span class="[ icon-bar ]"></span>
					<span class="[ icon-bar ]"></span>
				</button>
				<div class="[ animbrand ]">
					<a class="[ navbar-brand ][ animate ]" href="home.html"><img src="../image/nav_logo.png" class="img-responsive"  alt="Responsive image"></a>
				</div>
			</div>
			
					
			
			

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="[ collapse navbar-collapse ]" id="bs-example-navbar-collapse-1">
				<ul class="[ nav navbar-nav navbar-right ]">
					<li class="[ visible-xs ]">
						<form role="search">
							<div class="[ input-group ]">
								<input type="text" class="[ form-control ]" name="q" placeholder="Search for snippets">
								<span class="[ input-group-btn ]">
									<button class="[ btn btn-primary ]" type="submit"><span class="[ glyphicon glyphicon-search ]"></span></button>
									<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
								</span>
							</div>
						</form>
					</li>
					
					<li><a href="#about-barter" class="[ animate ]">ABOUT</a></li>
                    <li><a href="Query.aspx" class="[ animate ]">QUERY US</a></li>
                    <li><a href="Login.aspx" class="[ animate ]">LOGIN</a></li>
                    <li><a href="Registration.aspx" class="[ animate ]">SIGNUP</a></li>
					<li>
						<%--<a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">GENRES <span class="[ caret ]"></span></a>--%>
						<%--<ul class="[ dropdown-menu ]" role="menu">
							<li><a href="#" class="[ animate ]">Blog</a></li>
							<li><a href="#" class="[ animate ]">List of resources </a></li>
							<li><a href="#" class="[ animate ]">Download Bootstrap </a></li>
							
							<li><a href="#" class="[ animate ]">Browse Templates </a></li>
							
							<li><a href="#" class="[ animate ]">Form Builder </a></li>
							<li><a href="#" class="[ animate ]">Button Builder </a></li>
						</ul>--%>
					</li>
					
				
					<%--<li><a class="animate" href="#myModal_login"data-toggle="modal" data-target="#myModal_login">SIGNUP/LOGIN</a></li>--%>
								
				
		
                    <%--<li class="[ hidden-xs ]"><a href="#toggle-search" class="[ animate ]"><span class="[ glyphicon glyphicon-search ]"></span></a></li>
				</ul>
			</div>
		</div>
		<div class="[ bootsnipp-search animate ]">
			<div class="[ container-fluid ]">
				<form >
					<div class="[ input-group ]">
						<input type="text" class="[ form-control ]"  placeholder="Search by enter">
						<span class="[ input-group-btn ]">
							<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
						</span>
					</div>
				</form>
			</div>
		</div>--%>
	</nav>

	<%--<script>
	$(function() { 

    $('a[href="#toggle-search"], .navbar-bootsnipp .bootsnipp-search .input-group-btn > .btn[type="reset"]').on('click', function(event) {
		event.preventDefault();
		$('.navbar-bootsnipp .bootsnipp-search .input-group > input').val('');
		$('.navbar-bootsnipp .bootsnipp-search').toggleClass('open');
		$('a[href="#toggle-search"]').closest('li').toggleClass('active');

		if ($('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
			/* I think .focus dosen't like css animations, set timeout to make sure input gets focus */
			setTimeout(function() { 
				$('.navbar-bootsnipp .bootsnipp-search .form-control').focus();
			}, 100);
		}			
	});

	$(document).on('keyup', function(event) {
		if (event.which == 27 && $('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
			$('a[href="#toggle-search"]').trigger('click');
		}
	});
    
});
	</script>--%>
	
			
					
         
			<div class="container-fluid">
			<div class="main_img">
				<div class="head">
					BARTER SYSTEM
				</div>
				<div class="text">
					PRACTICAL AND EASY!
				</div>
				<div class="get-started-button">
							<a class="ghost-button" href="Registration.aspx">Get Started</a>
				</div>
			
			</div>
			 </div>
			<!-- carousel_user --> 
  <div class="container-fluid">
	 <div class="carosal_item">
	 <div class="carousel_head">
			Here we can scroll through a couple of services cluster
	 </div>
	 <div class="carosal_subhead">
			New Services
	 </div>
	 
		<div id="myCarouselWrapper" class="container-fluid">

					 <div id="myCarousel" class="carousel slide">
				  <div class="carosal-services">
			  <div class="carousel-inner" role="listbox">
			
				<div class="item active">
					  <div class="item-item col-md-3 col-sm-3  ">
						  <div class="item_content">
							  <div class="display_item_image">
							  <a href="#"><img src="../image/java.png" class="img-responsive"></a>
							  </div>
							  <div class="display_item_text1">
							  JAVA
							  </div>
								<div class="display_item_text2">
								Technical
							  </div>
						</div>
					</div>
				
				</div>
				<div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
					  <div class="item_content">
							<div class="display_item_image">
								<a href="#"><img src="../image/images.jpg" class="img-responsive"></a>
							</div>
								 
							<div class="display_item_text1">
							CSS
							</div>
							<div class="display_item_text2">
							Designing
							</div>
					</div>
				</div>  
				</div>
				<div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
				   <div class="item_content">
						<div class="display_item_image">
							<a href="#"><img src="../image/python-logo.png" class="img-responsive" class="carousal_image"></a>
						</div>
							 
						<div class="display_item_text1">
						PYTHON
						</div>
						<div class="display_item_text2">
							Technical
						</div>
					</div>
				  </div>
				</div>
				<div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
						 <div class="item_content">
						<div class="display_item_image">
							<a href="#"><img src="../image/php.jpeg" class="img-responsive"></a>
						</div>
							 
						<div class="display_item_text1">
						PHP
						</div>
						<div class="display_item_text2">
							Technical
						</div>
					</div>
				  
				 </div>
				</div>
				<div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
						 <div class="item_content">
						<div class="display_item_image">
							<a href="#"><img src="../image/aspnet.png" class="img-responsive"></a>
						</div>
							 
						<div class="display_item_text1">
						ASP.NET
						</div>
						<div class="display_item_text2">
							Technical
						</div>
					</div>
				  </div>
				</div>
				<div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
						 <div class="item_content">
						<div class="display_item_image">
							<a href="#"><img src="../image/ae.jpg" class="img-responsive"></a>
						</div>
							 
						<div class="display_item_text1">
						AFTER EFFECTS
						</div>
						<div class="display_item_text2">
							Designing
						</div>
						</div>
				  </div>
				</div>
				 <div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
						 <div class="item_content">
						<div class="display_item_image">
							<a href="#"><img src="../image/photoshop.jpeg" class="img-responsive"></a>
						</div>
							 
						<div class="display_item_text1">
						ADOBE PHOTOSHOP
						</div>
						<div class="display_item_text2">
						Designing
						</div>
					</div>
				 
				  </div>
				</div>
				 <div class="item">
				  <div class="item-item col-md-3 col-sm-3 ">
							 <div class="item_content">
						<div class="display_item_image">
							<a href="#"><img src="../image/ai.png" class="img-responsive"></a>
						</div>
							 
						<div class="display_item_text1">
						ADOBE ILLUSTRATOR
						</div>
						<div class="display_item_text2">
							Designing
						</div>
					</div>
				  </div>
		</div>
	</div>
	</div>

		  <!-- Controls -->
		  <a class="left carousel-control" class="gyp_carosal_img_left"href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"  aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		  </a>
		</div>   

		</div>
</div>
</div>
			  <script>
			      $('#myCarousel').carousel({
			          interval: 4000
			      });

			      $('.carousel .item').each(function () {
			          var next = $(this).next();
			          if (!next.length) {
			              next = $(this).siblings(':first');
			          }
			          next.children(':first-child').clone().appendTo($(this));

			          for (var i = 0; i < 2; i++) {
			              next = next.next();
			              if (!next.length) {
			                  next = $(this).siblings(':first');
			              }

			              next.children(':first-child').clone().appendTo($(this));
			          }
			      });
	  </script>
    
  <!--  <!-- about-barter --> 
 <div class="container-fluid">
	
	<div id="about-barter">
	 <div id="animated-example" class="animated fadeInDown">
		<div class="about-barter-head">
		ABOUT BARTER
		</div>
		<div class="row">
			<div class="col-sm-12 col-lg-12 col-xs-12 ">
				<div class="about-barter-text">
				<span>
				Barter means direct exchange of goods and services. This project deals with the exchange of services among two different users based upon their needs. If user 1 has Service A needs Need B and user 2 has the Service B and requires Need A, they can interact with each other and exchange their needs and services accordingly.</span>
				<span>Check information provided by registered users.</span>
				<span>Divide the services that users provided into different genres.</span>
				<span>Verify the exchange of services among the users.</span>
				<span>Handle the queries of the users.</span>
				<span>Admin will act as the complaint manager. He can also deactivate the account of the user against whom the complaint is made.</span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>  

<!-- addvertisement --> 
 <div class="container-fluid">
 <div class="domain">
<div class="domain_head">
	DOMAINS
</div>
<div class="row">
	<div class="col-sm-4  col-lg-4  col-xs-4">
		<div class="domain_items">
			<div class="domain_content">
				
					<img src="../image/domain_sample_cultural.png" class="img-circle" class="domain_image">
				
				<div class=elementToFadeInAndOut>
				<div class="domain_text">
					CULTURAL
				</div>
				</div>
				
			</div>
			
		</div>
	</div>
	
	<div class="col-sm-4  col-lg-4  col-xs-4">
	<div class="domain_items">
		<div class="domain_content">
			<div class="domain_image">
				<img src="../image/domain_sample_technical.png" class="img-circle">
			</div>
			<div class=elementToFadeInAndOut>
			<div class="domain_text">
				TECHNICAL
			</div>
			</div>
		</div>
		
	</div>
</div>

	<div class="col-sm-4  col-lg-4  col-xs-4">
	<div class="domain_items">
		<div class="domain_content">
			<div class="domain_image">
				<img src="../image/domain_sample_communication.png" class="img-circle">
			</div>
			<div class=elementToFadeInAndOut>
			<div class="domain_text">
				COMMUNICATION
			</div>
			</div>
		</div>
		
	</div>
</div>
</div>
</div>
</div>
 <!-- user-views --> 
	<div class="user-views">
	<h2 class="title"> WHY  WE ARE LOVED</h2>
<div id="myCarousel2" class="carousel slide text-center" >
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
	  <li data-target="#myCarousel2" data-slide-to="3"></li>
    </ol>
	<div class="people-views">
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <p>"I'm happy to inform you that I have cleared both IBPS PO and IBPS SO. I owe a major part of this success to Testbook.com. The site really helped me in several ways. It helped me to experiment the way I answer each section and how 
		</p>
		<div class="user-details">
			<div class="user-img">
			<img src="../image/pratik.jpg" alt="HTML5 Icon" style="width:50px;height:50px;">
			</div>
			<h5 class="user-name">PRATEEK AGGARWAL</h5>
			
		</div>
      </div>
      <div class="item">
        <p>"Awesome app! Love it! The interface is good. And amount of information which is short-listed, is pretty good and very easy to go through them quickly. And the quiz part is best. It is very informative and useful to remember all the news I read."</p>
		<div class="user-details">
			<div class="user-img">
			<img src="../image/pratik.jpg" alt="HTML5 Icon" style="width:50px;height:50px;">
			</div>
			<h5 class="user-name">PRATEEK AGGARWAL</h5>
			
		</div>
      </div>
      <div class="item">
        <p>"Testbook is as an effective coaching forum for aspirants like me who seek a flexible schedule and up to date material. The live tests gave me an actual test experience and helped me fight nervous breakdown. And the All India Ranking helped to gauge my position in the competition. Overall, it is a good replacement for even the best coaching centers."</p>
		<div class="user-details">
			<div class="user-img">
			<img src="../image/pratik.jpg" alt="pratik" style="width:50px;height:50px;">
			</div>
			<h5 class="user-name">PRATEEK AGGARWAL</h5>
			
		</div>
      </div>
	  <div class="item">
        <p>"There is no other site like Testbook.com to provide a perfect Test series with ranking and all the right answers to know where we go wrong. And most important is the immediate results that are provided to you. And also, when exams were nearing</p>
		<div class="user-details">
			<div class="user-img">
			<img src="../image/pratik.jpg"class="img-rounded" alt="HTML5 Icon" style="width:50px;height:50px;">
			</div>
			<h5 class="user-name">PRATEEK AGGARWAL</h5>
			
		</div>
      </div>
    </div>
	</div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color:black"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color:black"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>			
<!-- <div class="space" style="height:67px;">
</div -->
				
		
     
	
  
 <!-- footer --><!-- footer -->
	 <div class="container-fluid">
	 <div class="footer">
	   <div class="ft-followus-and-contact">
		 <div class="row">
				
					  <div class="col-sm-4 col-lg-4 col-xs-4">
					  
						<li class="contact-us"><a href="Query.aspx">CONTACT US</a></li>
					
					  </div>
					  
					    <div class="col-sm-4 col-lg-4 col-xs-4">
							<div class="footer-logo">
								<img src="../image/bartar_logo_footer.png" class="img-responsive"  alt="Responsive image">
							</div>
						</div>
						
					<div class="col-sm-4 col-lg-4 col-xs-4">
					
						<div class="ft-follow-us">
							 <div class="ft-title">FOLLOW US</div>
								 <div class="ft-glypicon2">
									 <ul class="ft-social">
									 <li>
									 <a href="https://www.facebook.com/" target="_blank" class="tb-fb"><i class="fa fa-facebook-official"></i>
									 </a>
									 </li>
									 <li>
									 <a href="https://www.twitter.com/" target="_blank" class="tb-tw "><i class="fa fa-twitter-square"></i></a>
									 </li>
									 <li>
									 <a href="https://mail.google.com/" target="_blank" class="tb-tw "> <i class="fa fa-google-plus-square"></i></a>
									 </li>
									  <li>
									 <a href="https://www.instagram.com/" target="_blank" class="tb-tw "> <i class="fa fa-instagram"></i></a>
									 </li>
									 </ul>
								</div>	
						</div>
					
					</div>
					
					</div>
				  </div>
			  </div>
		
	
		
			
	  </div>

					<!-- Modal -->
  <div class="modal fade" id="myModal_login" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
       
        <div class="modal-body">
		  <button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="row">
				<div class="col-sm-6 col-xs-6">
					<div class="modal-part-1">
						<div class="modal-logo">
								<img src="../image/barter_logo_modal.png" class="img-responsive" style="width:30vmin" alt="Responsive image">
						</div>
						<div class="modal-text">
							<h3> BARTER SYSTEM</h3>
							<span>Share your knowledge</span>
							<span>Connect with people</span>
						</div>
					</div>
				</div>
				 <div class="col-sm-6 col-xs-6">
					 <div class="modal-part-2">
							<div class="modal-part-2-text">
									<h2>LOGIN</h2>
							</div>
							
						<div class="container">
								
							  <form class="form-horizontal">
								<div class="form-group">
								 
								  <div class="col-sm-3">
									<asp:TextBox ID="tbxEmail" class="form-control" input type="email" placeholder="Enter Email" runat="server"></asp:TextBox>
                                    <asp:Label ID="lblIncorrectEmail" runat="server" display="Dynamic" ForeColor="Red"></asp:Label>
                                      <%--<asp:RequiredFieldValidator ID="RequiredEmail" runat="server" Display="Dynamic" ControlToValidate="tbxEmail" ErrorMessage="Enter Email"></asp:RequiredFieldValidator>--%>
                                   </div>
								</div>
								<div class="form-group">
								
								  <div class="col-sm-3">
									<asp:TextBox ID="tbxPassword" class="form-control" input type="password" placeholder="Enter Password" runat="server"></asp:TextBox>
                                      <asp:Label ID="lblIncorrectPassword" runat="server" Text="Incorrect Password" display="Dynamic" ForeColor="Red"></asp:Label>
								  </div>
								</div>
								<div class="forget-password-link">
									<a href="ForgotPassword.aspx">Forgot Password</a>
								</div>
							   
   
								<div class="form-group">
								  <div class="col-sm-3">
									<div class="modal-btn">
									
									<asp:Button ID="btnLogin" class="btn btn-primary btn-block" runat="server" style="width:85%;background-color:#1fbad6;" Text="Login" OnClick="btnLogin_Click" />

									</div>
								  </div>
								</div>
							
								<div class="not-register-yet-link">
									 NOT REGISTERED? <a href="Registration.aspx">SIGN UP</a>
								</div>
								
							  </form>
					 </div>
				 </div>
			</div>
        </div>
       
      </div>
      
    </div>
  </div>
  </div>	  
            </form>
        </body>

	</html>
<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HOME</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">VERBENDEN</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="Query.aspx"><span class="glyphicon glyphicon-eye-pencil"></span>Query Us</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Registration.aspx"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
      <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
    </ul>
  </div>
</nav>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>
