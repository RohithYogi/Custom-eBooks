<%@ page import="com.ebooks.XMLExist_1, java.util.*,java.util.Map ,java.util.List, org.w3c.dom.Document" %>


<%
    XMLExist_1 ex;

    if (session.isNew() ){
       ex = new XMLExist_1();
       session.setAttribute("ex", ex);
    }
    else {
      ex = (XMLExist_1)session.getAttribute("ex");
    }

  	String recevied_keywords;
  	if(request.getParameter("keywords") == null)
  		recevied_keywords = "base";
  	else
  		recevied_keywords = request.getParameter("keywords");

      List<String> keys = new ArrayList<String>();

      String[] tmp = recevied_keywords.split(" ");

      for (int i=0; i < tmp.length; i++){
        keys.add(tmp[i]);
      }


      List<Document> chapter_doms =  new ArrayList<Document>();
      List<Document> ret = ex.searchByChapter(keys);
      chapter_doms.addAll(ret);
      int NoOfChapters = 0;
      if(chapter_doms.size()!=0)
        NoOfChapters =chapter_doms.size();

      Map<Integer,String> chapternameIndexs = ex.returnChapterNames(chapter_doms);

%>


  <!DOCTYPE HTML>
  <html>
  	<head>
  	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<title>Custom eBooks</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="icon" href="../images/myicon.ico" type="image/x-icon"/>

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

  	<!-- <link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700' rel='stylesheet' type='text/css'> -->

  	<!-- Animate.css -->
  	<link rel="stylesheet" href="../css/animate.css">
  	<!-- Icomoon Icon Fonts-->
  	<link rel="stylesheet" href="../css/icomoon.css">
  	<!-- Bootstrap  -->
  	<link rel="stylesheet" href="../css/bootstrap.css">
  	<!-- Theme style  -->
  	<link rel="stylesheet" href="../css/style.css">

  	<!-- Modernizr JS -->
  	<script src="../js/modernizr-2.6.2.min.js"></script>
  	<!-- FOR IE9 below -->
  	<!--[if lt IE 9]>
  	<script src="js/respond.min.js"></script>
  	<![endif]-->


     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
      $(document).ready(function() {
          $(".bookblock").click(function() {
              var chap_id = $(this).attr("id");
              servletCall(chap_id);

          });
      });
      function servletCall(chap_id) {
        // console.log(chap_id);
          $.post(
              "AddBookServelt",
              {name : chap_id}, //meaasge you want to send
              function(result) {
                console.log(result);
              // $('#somediv').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
          });
      };

  </script>

    </head>
  	<body>
  	<div class="fh5co-loader"></div>

  	<div id="page">
  		<nav class="fh5co-nav" role="navigation">
  		<div class="container">
  			<div class="row">
  				<div class="col-xs-2">
  					<div id="fh5co-logo"><a href="../index.jsp">Custom-eBooks.</a></div>
  				</div>
  				<div class="col-xs-10 text-right menu-1">
  					<ul>
  						<li><a href="../index.jsp">Home</a></li>
  						<li><a href="about.html">About</a></li>
  						<li class="active"><a href="work.html">eBooks</a></li>
  						<li class="has-dropdown">
  							<a href="services.html">How?</a>
  						</li>
  						<li><a href="contact.html">Contact</a></li>
  						<li class="btn-cta"><a href="#"><span>Login</span></a></li>
  					</ul>
  				</div>
  			</div>

  		</div>
  	</nav>

  	<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(../images/img_bg_2.jpg);">
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
  											<input type="text" name="keywords" class="form-control" id="email" placeholder=<%=recevied_keywords %>>
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


     <div id="fh5co-project">
  		<div class="container">
  			<div class="row">
          <% for(int i = 0; i < NoOfChapters; i+=1) { %>
          <div class="col-md-4 animate-box bookblock" id = "<%= i %>" >
          <%-- <div class="col-md-4 animate-box"> --%>
  					<div class="project-grid" style="background-image:url(../images/bk-1.png);">
  						<div class="desc">
  							<span>Application</span>
                <h3><%=chapternameIndexs.get(i)%></h3>

  							<%-- <h3><a href="#">hai</a></h3> --%>
              </div>
  					</div>
  				</div>
        <% } %>
  			</div>
  		</div>
  	</div>


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

  <!-- 	<footer id="fh5co-footer" role="contentinfo">
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
  	<script src="../js/jquery.min.js"></script>
  	<!-- jQuery Easing -->
  	<script src="../js/jquery.easing.1.3.js"></script>
  	<!-- Bootstrap -->
  	<script src="../js/bootstrap.min.js"></script>
  	<!-- Waypoints -->
  	<script src="../js/jquery.waypoints.min.js"></script>
  	<!-- Main -->
  	<script src="../js/main.js"></script>

  	</body>
  </html>
