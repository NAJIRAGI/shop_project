<!DOCTYPE html>
<html lang="ko">
<!-- Basic -->

<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/703e936e7e.js"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<c:set var="date" value="<%=new Date()%>" />
<c:set var="mon">
	<fmt:formatDate value="${date}" pattern="MM" />
</c:set>

</head>

<body>
	<!-- Start Main Top -->
	<div class="main-top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="right-phone-box">
						<p>
							Call US : <a href="#"> 031-243-2111</a>
						</p>
					</div>
					<c:if test="${!empty principal}">
						<div class="our-link">
							<ul>
								<li><a href="/user/updateForm"><i
										class="fa fa-user s_color"></i> My Account</a></li>
								<li><a href="#"><i class="fas fa-location-arrow"></i>
										Our location</a></li>
								<li><a href="#"><i class="fas fa-headset"></i> Contact
										Us</a></li>
							</ul>
						</div>
					</c:if>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="login-box">
						<ul>
							<c:choose>
								<c:when test="${!empty principal}">
									<li><p>
											<a class="btn hvr-hover" href="/logout">LOG OUT</a>
										</p></li>
								</c:when>
								<c:otherwise>
									<li><p>
											<a class="btn hvr-hover" href="/auth/loginForm">LOGIN</a>
										</p></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
					<div class="text-slid-box">
						<div id="offer-box" class="carouselTicker">
							<ul class="offer-box">
								<li><i class="fa-solid fa-cart-shopping"></i> 꿀사과 20% 할인 진행
									중!</li>
								<li><i class="fa-solid fa-cart-shopping"></i> 나주 배! 50% 할인
									진행 중!</li>
								<li><i class="fa-solid fa-cart-shopping"></i> 포인트 20% 추가 적립
									진행 중!</li>
								<li><i class="fa-solid fa-cart-shopping"></i> 철 지난 상품 10%
									할인 진행 중!</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Main Top -->

	<!-- Start Main Top -->
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-menu" aria-controls="navbars-rs-food"
						aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="/"><img src="../images/logo.png"
						class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item active"><a class="nav-link" href="/">Home</a></li>
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">MY</a>
							<ul class="dropdown-menu">
								<li><a href="/user/updateForm">My Page</a></li>
								<li><a href="/user/orderlist">Order List</a></li>
								<li><a href="/board">Inquiry History</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">SHOP</a>
							<ul class="dropdown-menu">
								<li><a href="/user/season">Season!</a></li>
								<li><a href="/user/korean">Domestic!</a></li>
								<li><a href="/user/imported">Imported!</a></li>
								<li><a href="/user/good">Recommend!</a></li>
								<li><a href="/user/other">Other!</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="contact-us.html">Contact Us</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="side-menu" style="width: 100px;"><a
							href="/cart/cartlist"> <i class="fa fa-shopping-bag"></i> <span
								class="badge"></span>
								<p>My Cart</p>
						</a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
			</div>
		</nav>
		<!-- End Navigation -->
	</header>
	<!-- End Main Top -->

	<!-- Start Cart  -->
	<div class="cart-box-main" style="margin-left:600px;">
		<div class="container">
			<div class="row new-account-login">
				<div class="col-sm-6 col-lg-6 mb-3">
					<div class="title-left">
						<h3>MY PAGE!</h3>
					</div>
					<h5>Update My Page!</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-lg-6 mb-3">
					<div class="checkout-address">
						<div class="title-left">
							<h3>수정하실 내용을 작성 후 수정 완료 버튼을 눌러주세요!</h3>
						</div>
						<form class="needs-validation" novalidate>
							<input type="hidden" id="id" value="${principal.user.id}" />
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="username">ID</label> <input type="text"
										class="form-control" id="username" placeholder=""
										value="${principal.user.username}" readonly>
									<div class="invalid-feedback">ID를 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="password">Password</label> <input type="text"
										class="form-control" id="password" placeholder=""
										value="${pricipal.user.password}" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="username">User name</label>
								<div class="input-group">
									<input type="text" class="form-control" id="name"
										placeholder="" value="${principal.user.name}" required>
									<div class="invalid-feedback" style="width: 100%;">성함을
										입력해주세요.</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="email">Email Address</label> <input type="email"
									class="form-control" id="email" value="${principal.user.email}"
									placeholder="">
								<div class="invalid-feedback">E-Mail을 입력해주세요.</div>
							</div>
							<div class="mb-3">
								<label for="address">Address </label> <input type="text"
									class="form-control" id="address"
									value="${principal.user.address}" placeholder="" required>
								<div class="invalid-feedback">주소를 입력해주세요.</div>
							</div>
							<div class="mb-3">
								<label for="address">Phone Number</label> <input type="text"
									class="form-control" id="tel" value="${principal.user.tel}"
									placeholder="" required>
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>

							<hr class="mb-4">
						</form>
						<div class="row">
							<div class="col-lg-12">
								<div class="special-menu text-center">
									<div class="button-group filter-button-group">
										<button id="btn-update" class="btn">수정 완료</button>
										<button id="btn-delete" class="btn">회원 탈퇴</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- End Cart -->




		<!-- Start Footer  -->
		<footer>
			<div class="footer-main">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-top-box">
								<h3>Business Time</h3>
								<ul class="list-time">
									<li>Monday - Friday: 08.00am to 05.00pm</li>
									<li>Saturday: 10.00am to 08.00pm</li>
									<li>Sunday: <span>Closed</span></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-top-box">
								<h3>Newsletter</h3>
								<form class="newsletter-box">
									<div class="form-group">
										<input class="" type="email" name="Email"
											placeholder="Email Address*" /> <i class="fa fa-envelope"></i>
									</div>
									<button class="btn hvr-hover" type="submit">Submit</button>
								</form>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-top-box">
								<h3>Social Media</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
								<ul>
									<li><a href="#"><i class="fab fa-facebook"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fab fa-twitter"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fab fa-linkedin"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fab fa-google-plus"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-rss"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fab fa-pinterest-p"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fab fa-whatsapp"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-widget">
								<h4>About Freshshop</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-link">
								<h4>Information</h4>
								<ul>
									<li><a href="#">About Us</a></li>
									<li><a href="#">Customer Service</a></li>
									<li><a href="#">Our Sitemap</a></li>
									<li><a href="#">Terms &amp; Conditions</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Delivery Information</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-link-contact">
								<h4>Contact Us</h4>
								<ul>
									<li>
										<p>
											<i class="fas fa-map-marker-alt"></i>Address: Michael I. Days
											3756 <br>Preston Street Wichita,<br> KS 67213
										</p>
									</li>
									<li>
										<p>
											<i class="fas fa-phone-square"></i>Phone: <a
												href="tel:+1-888705770">+1-888 705 770</a>
										</p>
									</li>
									<li>
										<p>
											<i class="fas fa-envelope"></i>Email: <a
												href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a>
										</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- End Footer  -->

		<!-- Start copyright  -->
		<div class="footer-copyright">
			<p class="footer-company">
				All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design
				By : <a href="https://html.design/">html design</a>
			</p>
		</div>
		<!-- End copyright  -->

		<a href="#" id="back-to-top" title="Back to top"
			style="display: none;">&uarr;</a>

		<!-- ALL JS FILES -->
		<script src="../js/jquery-3.2.1.min.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<!-- ALL PLUGINS -->
		<script src="../js/jquery.superslides.min.js"></script>
		<script src="../js/bootstrap-select.js"></script>
		<script src="../js/inewsticker.js"></script>
		<script src="../js/bootsnav.js."></script>
		<script src="../js/images-loded.min.js"></script>
		<script src="../js/isotope.min.js"></script>
		<script src="../js/owl.carousel.min.js"></script>
		<script src="../js/baguetteBox.min.js"></script>
		<script src="../js/form-validator.min.js"></script>
		<script src="../js/contact-form-script.js"></script>
		<script src="../js/custom.js"></script>
</body>

</html>