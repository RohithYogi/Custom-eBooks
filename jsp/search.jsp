<%@ page import="com.ebooks.ExistSearchUtil, java.util.*,java.util.Map ,java.util.List, org.w3c.dom.Document" %>


<%
    ExistSearchUtil ex;
    String recevied_keywords;
    int NoOfChapters = 0;

    if (session.isNew() ){
       ex = new ExistSearchUtil();
       session.setAttribute("ex", ex);
    }
    else {
      ex = (ExistSearchUtil)session.getAttribute("ex");
    }

  	if(request.getParameter("keywords") == null)
  		recevied_keywords = " ";
  	else
  		recevied_keywords = request.getParameter("keywords");


      List<String> keys = Arrays.asList(recevied_keywords.split(" "));;

      List<Document> chapter_doms = ex.searchByChapter(keys);

      if(chapter_doms.size()!=0)
        NoOfChapters =chapter_doms.size();

    List<String> chapternameIndexs = ex.returnChapterNames(chapter_doms);

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

    <%-- click index returning --%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../js/indexreturn.js"></script>

  	<!-- FOR IE9 below -->
  	<!--[if lt IE 9]>
  	<script src="js/respond.min.js"></script>
  	<![endif]-->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">


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
  						<li><a href="../html/about.html">About</a></li>
  						<li class="active"><a href="../html/work.html">eBooks</a></li>
  						<li class="has-dropdown">
  							<a href="../html/services.html">How?</a>
  						</li>
  						<li><a href="../html/contact.html">Contact</a></li>
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
  											<input type="text" name="keywords" class="form-control" id="email" placeholder="Enter Chapter Name">
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
      <div class="stripe" style="padding-left: 5%;padding-right: 5%;padding-bottom: 2%;">
        <div class="row">
          <div class="col-md-4">
          <div class="col-half animate-box" data-animate-effect="fadeInLeft">
          <div class="table-c">
            <div class="desc">
              <div class="columns">
                <ul class="price">
                  <li class="header">Chapters
                    <!-- <button id="btnAdd" type="button" class="btn btn-add" data-toggle="tooltip" data-original-title="Add more controls"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add&nbsp;</button> -->
                  </li>
                  <div class="accordions">
                    <div class="accordion-item">
                      <div class="accordion-title" data-tab="item1">
                          <h2>Chapter-1
                            <button type="button" class="btn btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button>
                          </h2>
                      </div>
                      <div class="accordion-content" id="item1">

                      </div>
                    </div>
                    <div class="accordion-item">
                      <div class="accordion-title" data-tab="item2">
                          <h2>Chapter-2
                            <button type="button" class="btn btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button>
                          </h2>
                      </div>
                      <div class="accordion-content" id="item2">

                      </div>
                    </div>
                    <div class="accordion-item">
                      <div class="accordion-title" data-tab="item3">
                          <h2>Chapter-3
                            <button type="button" class="btn btn-danger remove"><i class="glyphicon glyphicon-remove-sign"></i></button>
                          </h2>
                      </div>
                      <div class="accordion-content" id="item3">

                      </div>
                    </div>
                  </div>

                 

                  <li><a href="#" class="btn btn-lg btn-primary">Finish</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
          </div>
          <div class="col-md-8">
            <!-- <embed src="" width="600px" height="500px" /> -->
            <iframe src="../Projectproposal.pdf" style="width:100%; height:500px;"></iframe>
            <button id="btnAdd" type="button" class="btn btn-add" style="position:absolute;z-index:10000;margin-left:-12%;margin-top:4px;">
              <i class="glyphicon glyphicon-plus-sign"></i>&nbsp; Add&nbsp;
            </button>
          </div>
          
        </div>
      </div>      


  		<div class="container">
  			<div class="row">
          <% for(int i = 0; i < NoOfChapters; i+=1) { %>
          <div class="col-md-4 animate-box bookblock" id = "<%= i %>" >
          <%-- <div class="col-md-4 animate-box"> --%>
  					<div class="project-grid" style="background-image:url(../images/bk-1.png);">
  						<div class="desc">
  							<%-- <span>Application</span> --%>
  							<h3><a href="#"><%=chapternameIndexs.get(i)%></a></h3>
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
