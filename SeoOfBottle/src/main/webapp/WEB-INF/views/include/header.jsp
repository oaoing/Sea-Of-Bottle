<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<meta name ="google-signin-client_id" content="854655733822-odgivq9t2i7nj64vo28sot38ugttg42c.apps.googleusercontent.com">
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
     <script>
     
    function signOut(link) {
    
    	if(!'${uvo.googleid}'){
    		console.log('User signed out.');
    	}else{
    		var auth2 = gapi.auth2.getAuthInstance();
    	      auth2.signOut().then(function () {
    	        console.log('User signed out.');
    	      });
    	}
      location.replace(link);
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
    
  </script>
	<link rel="icon" href="/resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="/resources/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">
  <link rel="stylesheet" href="/resources/css/animation.css">
  <link rel="stylesheet" href="/resources/css/style.css">
  
</head>


<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="main"><img src="/resources/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item"><a class="nav-link" href="main">Home</a></li>		
              <li class="nav-item"><a class="nav-link" href="boast">Boasting Board</a></li>
              <li class="nav-item"><a class="nav-link" href="myboast">My Page</a></li> 
            </ul>

            <ul class="nav-shop">
              <li class="nav-item">${uvo.nick }</li>
              <li class="nav-item"><a class="button button-header" href="javascript:signOut('/logout');">Log Out</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->