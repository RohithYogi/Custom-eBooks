<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Custom eBooks</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/myicon.ico" type="image/x-icon"/>

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<%
		String type = null;
		CustomEbookBuilder cb;
		ExistSearchUtil ex;
		int id;
	 // Check if this is new comer on your Webpage.
	 if (session.isNew() ){
			session.setAttribute("type", type);
			cb = new CustomEbookBuilder("Database Systems");
			session.setAttribute("cb", cb);
			ex = new ExistSearchUtil();
			session.setAttribute("ex", ex);
			id = new Integer(0);
			session.setAttribute("id", id);
	 }
	 else {
		 type = (String)session.getAttribute("type");
		 cb = (CustomEbookBuilder)session.getAttribute("cb");
		 ex = (ExistSearchUtil)session.getAttribute("ex");
	 }


	// Check if this is new comer on your Webpage.
	%>

	<!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->

	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/toastr.min.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/finalupload.js"></script>

	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

	<div class="fh5co-loader"></div>

	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-xs-2">
					<div id="fh5co-logo"><a href="index.jsp">Custom-eBooks.</a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="html/about.html">About</a></li>
						<li><a href="html/work.html">eBooks</a></li>
						<li class="has-dropdown">
							<a href="html/services.html">How?</a>
						</li>
						<!-- <li class="has-dropdown">
							<a href="#">Tools</a>
							<ul class="dropdown">
								<li><a href="#">HTML5</a></li>
								<li><a href="#">CSS3</a></li>
								<li><a href="#">Sass</a></li>
								<li><a href="#">jQuery</a></li>
							</ul>
						</li> -->
						<li><a href="html/contact.html">Contact</a></li>
						<li class="btn-cta"><a href="html/login.html"><span>Login</span></a></li>
					</ul>
				</div>
			</div>

		</div>
	</nav>
	<%if(type == null){
		response.sendRedirect("jsp/generic.jsp");
	} else if (type.equals("consumer")){%>
		<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/img_bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<div class="row">
									<form class="form-inline" id="fh5co-header-subscribe">
										<div class="col-md-8 col-md-offset-2">
											<div class="form-group">
												<input type="text" class="form-control" id="email" placeholder="Enter book name">
												<button type="submit" class="btn btn-default">Search</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

	<%-- This creates the section containing the dummy books of the page --%>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
	<div id="fh5co-core-feature">
	  <div class="container">
	    <div class="row">
	      <div class="features">
	        <div class="col-half-image-holder animate-box" data-animate-effect="fadeInRight">
	          <img class="img-responsive" src="images/bookcover.jpg" alt="samsung">
	        </div>
	        <div class="col-half animate-box" data-animate-effect="fadeInLeft">
	          <div class="table-c">
	            <div class="desc">
	              <div class="columns">
	                <ul class="price">
	                  <li class="header">Chapters
	                  <a href="./jsp/search.jsp">
	                  <button id="btnAdd" type="button" class="btn btn-add" data-toggle="tooltip" data-original-title="Add more controls"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add&nbsp;</button></a></li>
	                  <!-- <li>Chapter-1</li>
	                  <li>Chapter-2</li>
	                  <li>Chapter-3</li>
	                  <li>Chapter-4</li>
	                  <li>Chapter-5</li>
	                  <li>Chapter-6</li>
	                  <li>Chapter-7</li> -->


	                  <div id="chapter-list" class="accordions">
											<%@ include file = "jsp/book-list.jsp" %>
	                	</div>

	                  <li id="GeneratePdfButtonId"><a href="DownloadPDFServlet" class="btn btn-lg btn-primary generatePDF">Generate PDF</a></li>
	                </ul>
	              </div>
	            </div>
	          </div>
	        </div>

	      </div>
	    </div>
	  </div>
	</div>
	<%-- <div id="chapter-list"> --%>
			<%-- <%@ include file = "jsp/book-list.jsp" %> --%>

	<%-- </div> --%>
		<%}
		else {%>
			<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(images/img_bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<div class="row">
									<form class="form-inline" id="fh5co-header-subscribe">
										<div class="col-md-8 col-md-offset-2">
											<div class="form-group">
												<input type="text" class="form-control" id="email" placeholder="Enter book name">
												<button type="submit" class="btn btn-default">Search</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		<div id="fh5co-core-feature">
		  <div class="container">
		    <div class="row">
		      <div class="features">
		        <div class="col-half-image-holder animate-box" data-animate-effect="fadeInRight">
		          <img class="img-responsive" src="images/producer.jpg" alt="samsung">
		        </div>
		        <div class="col-half animate-box" data-animate-effect="fadeInLeft">
		          <div class="table-c">
		            <div class="desc">
		              <div class="columns">
		                <ul class="price">
		                  <li class="header">Chapters
		                  <a href="html/info.html">
		                  <button id="btnAdd" type="button" class="btn btn-add" data-toggle="tooltip" data-original-title="Add more controls"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add&nbsp;</button></a></li>
		                  <div id="chapter-list-publisher" class="accordions">
												<%@ include file = "jsp/publisher.jsp" %>
											</div>
			                  <li><button type="button" class="btn btn-lg btn-primary bookupload">Upload PDF</a></button></li>
			                </ul>
			              </div>
			            </div>
			          </div>
			        </div>

			      </div>
			    </div>
			  </div>
			</div>
		<%}%>


	<div id="fh5co-services" class="fh5co-bg-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-eye"></i>
						</span>
						<h3>Retina Ready</h3>
						<p>All the ebooks are available for reading in form of pdfs so that the user will be able to select from the lot for their own ebook</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-command"></i>
						</span>
						<h3>Fully Responsive</h3>
						<p>User friendly interface with fully responsive add and remove buttons for the users to define the structure for their ebook</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-power"></i>
						</span>
						<h3>Secure Web</h3>
						<p>Users data is well protected as they can securely login through email and password and resume their work on the ebook</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <div id="fh5co-project">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<span>Want Some Cool Stuff</span>
					<h2>Our Project</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
				</div>
			</div>
		</div>
		<div class="project-content">
			<div class="col-half">
				<div class="project animate-box" style="background-image:url(images/project-3.jpg);">
					<div class="desc">
						<span>Application</span>
						<h3>Project Name</h3>
					</div>
				</div>
			</div>
			<div class="col-half">
				<div class="project-grid animate-box" style="background-image:url(images/project-5.jpg);">
					<div class="desc">
						<span>Illustration</span>
						<h3>Project Name</h3>
					</div>
				</div>
				<div class="project-grid animate-box" style="background-image:url(images/project-2.jpg);">
					<div class="desc">
						<span>Branding</span>
						<h3>Project Name</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="fh5co-testimonial" class="fh5co-bg-section">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Happy Clients</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="row">
						<div class="col-md-12 animate-box">
							<div class="testimony">
								<div class="inner text-center">
									<img src="images/person3.jpg" alt="testimony">
								</div>
								<blockquote>
									<p>&ldquo;Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.&rdquo;</p>
									<p class="author"><cite>&mdash; John Doe</cite></p>
								</blockquote>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->


	<div id="fh5co-started">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Lets Get Started</h2>
					<p>This application lets you create an ebook having chapters and sections with your say in it. Enjoy the user friendly interface for customizing your ebook</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<form class="form-inline">
						<div class="col-md-6 col-md-offset-3 col-sm-6">
							<button type="submit" class="btn btn-default btn-block">Get In Touch</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- <footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<h3>King.</h3>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
					<p><a href="#">Learn More</a></p>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">About</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Meetups</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Shop</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Testimonials</a></li>
						<li><a href="#">Handbook</a></li>
						<li><a href="#">Held Desk</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Find Designers</a></li>
						<li><a href="#">Find Developers</a></li>
						<li><a href="#">Teams</a></li>
						<li><a href="#">Advertise</a></li>
						<li><a href="#">API</a></li>
					</ul>
				</div>
			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small>
						<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small>
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer> -->
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	<script src="js/toastr.min.js"></script>
	</body>
</html>
