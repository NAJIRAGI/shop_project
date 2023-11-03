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
								<c:if test="${principal.user.roles == 'ADMIN'}">
								<li><a href="/admin/adminForm"><i class="fas fa-location-arrow"></i>ADMIN PAGE</a></li>
								</c:if>
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
					<a class="navbar-brand" href="/"><img src="images/logo.png"
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

	<!-- Start Slider -->
	<div id="slides-shop" class="cover-slides">
		<ul class="slides-container">
			<li class="text-center"><img src="images/banner-01.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> Fruits Shop에 오신 걸!<br> 환영합니다!
								</strong>
							</h1>
							<p class="m-b-40">
								항상 신선한 제품만을 취급합니다. <br> 제철 상품부터 과일로 만든 과일청까지 자연의 향기를 느껴보세요!
							</p>
							<p>
								<a class="btn hvr-hover" href="#">Shop New</a>
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-center"><img src="images/banner-02.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> Fruits Shop에 오신 걸!<br> 환영합니다!
								</strong>
							</h1>
							<p class="m-b-40">
								항상 신선한 제품만을 취급합니다. <br> 제철 상품부터 과일로 만든 과일청까지 자연의 향기를 느껴보세요!
							</p>
							<p>
								<a class="btn hvr-hover" href="#">Shop New</a>
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-center"><img src="images/banner-03.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> Fruits Shop에 오신 걸!<br> 환영합니다!
								</strong>
							</h1>
							<p class="m-b-40">
								항상 신선한 제품만을 취급합니다. <br> 제철 상품부터 과일로 만든 과일청까지 자연의 향기를 느껴보세요!
							</p>
							<p>
								<a class="btn hvr-hover" href="#">Shop New</a>
							</p>
						</div>
					</div>
				</div></li>
		</ul>
		<div class="slides-navigation">
			<a href="#" class="next"><i class="fa fa-angle-right"
				aria-hidden="true"></i></a> <a href="#" class="prev"><i
				class="fa fa-angle-left" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- End Slider -->

	<!-- Start Categories  -->
	<div class="categories-shop">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="shop-cat-box">
						<img class="img-fluid" src="images/categories_img_01.jpg" alt="" />
						<a class="btn hvr-hover" href="user/season">제철 과일 보러가기!</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="shop-cat-box">
						<img class="img-fluid" src="images/categories_img_02.jpg" alt="" />
						<a class="btn hvr-hover" href="#">과일로 만든 제품 보러가기!</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="shop-cat-box">
						<img class="img-fluid" src="images/categories_img_03.jpg" alt="" />
						<a class="btn hvr-hover" href="#">EVENT!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Categories -->

	<div class="box-add-products">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12">
					<div class="offer-box-products">
						<img class="img-fluid" src="images/add-img-01.jpg" alt="" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12">
					<div class="offer-box-products">
						<img class="img-fluid" src="images/add-img-02.jpg" alt="" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Start Products  -->
	<div class="products-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>Fruits의 싱싱한 상품들</h1>
						<p>제철 과일부터, 국,수입 상품까지 원하는 제품을 골라보세요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="special-menu text-center">
						<div class="button-group filter-button-group">
							<button data-filter=".top-featured">제철 상품</button>
							<button class="active" data-filter=".best-seller">추천 상품</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row special-list">
				<c:forEach var="prod" items="${products.content}">
					<c:if test="${prod.recommend ge 4}">
						<div class="col-lg-3 col-md-6 special-grid best-seller">
							<div class="products-single fix">
								<div class="box-img-hover">
									<img src="${prod.prodImgPath}" class="img-fluid" alt="Image">
									<div class="mask-icon">
										<a class="cart" href="/cart/${prod.productId}/prodDetail">Add
											to Cart</a>
									</div>
								</div>
								<div class="why-text">
									<h4>${prod.productName}</h4>
									<h5>${prod.price}</h5>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div class="row special-list">
				<c:forEach var="prod" items="${products.content}">
					<c:choose>
						<c:when test="${mon == '03'||'04'||'05'}">
							<c:if test="${prod.season == 0}">
								<div class="col-lg-3 col-md-6 special-grid top-featured">
									<div class="products-single fix">
										<div class="box-img-hover">
											<img src="${prod.prodImgPath}" class="img-fluid" alt="Image">
											<div class="mask-icon">
												<a class="cart" href="/cart/${prod.productId}/prodDetail">Add
													to Cart</a>
											</div>
										</div>
										<div class="why-text">
											<h4>${prod.productName}</h4>
											<h5>${prod.price}</h5>
										</div>
									</div>
								</div>
							</c:if>
						</c:when>
						<c:when test="${mon == '06'||'07'||'08'}">
							<c:if test="${prod.season == 1}">
								<div class="col-lg-3 col-md-6 special-grid top-featured">
									<div class="products-single fix">
										<div class="box-img-hover">
											<img src="${prod.prodImgPath}" class="img-fluid" alt="Image">
											<div class="mask-icon">
												<a class="cart" href="/cart/${prod.productId}/prodDetail">Add
													to Cart</a>
											</div>
										</div>
										<div class="why-text">
											<h4>${prod.productName}</h4>
											<h5>${prod.price}</h5>
										</div>
									</div>
								</div>
							</c:if>
						</c:when>
						<c:when test="${mon == '09'||'10'||'11'}">
							<c:if test="${prod.season == 2}">
								<div class="col-lg-3 col-md-6 special-grid top-featured">
									<div class="products-single fix">
										<div class="box-img-hover">
											<img src="${prod.prodImgPath}" class="img-fluid" alt="Image">
											<div class="mask-icon">
												<a class="cart" href="/cart/${prod.productId}/prodDetail">Add
													to Cart</a>
											</div>
										</div>
										<div class="why-text">
											<h4>${prod.productName}</h4>
											<h5>${prod.price}</h5>
										</div>
									</div>
								</div>
							</c:if>
						</c:when>
						<c:when test="${mon == '12'||'01'||'02'}">
							<c:if test="${prod.season == 3}">
								<div class="col-lg-3 col-md-6 special-grid top-featured">
									<div class="products-single fix">
										<div class="box-img-hover">
											<img src="${prod.prodImgPath}" class="img-fluid" alt="Image">
											<div class="mask-icon">
												<a class="cart" href="/cart/${prod.productId}/prodDetail">Add
													to Cart</a>
											</div>
										</div>
										<div class="why-text">
											<h4>${prod.productName}</h4>
											<h5>${prod.price}</h5>
										</div>
									</div>
								</div>
							</c:if>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>

		</div>
	</div>
	<!-- End Products  -->

	<!-- Start Blog  -->
	<div class="latest-blog">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>과일 정보!</h1>
						<p>모르고 먹는 과일보다 알고 먹는 과일이 훨씬 맛있다!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 col-xl-4">
					<div class="blog-box">
						<div class="blog-img">
							<img class="img-fluid" src="fruits/국산/사과2.jpg" alt="" />
						</div>
						<div class="blog-content">
							<div class="title-blog">
								<h3>아침 사과의 효능</h3>
								<p>아침에 먹는 사과는 '금'이라고 할 만큼 건강에 유익하기로 소문난 사과. 알려진 것과는 다르게 사과는
									저녁에 먹어도 심신을 상쾌하게 하고 위액 분비를 촉진해 소화흡수를 돕고 배변기능에 도움을 준다. 단, 위장 기능이
									좋지 않은 사람은 사과로 인해 위액 분비가 촉진되어 속이 불편할 수 있는데, 이런 사람은 사과뿐 아니라 다른
									과일도 저녁에 먹는 것을 피해야 한다.</p>
							</div>
							<ul class="option-blog">
								<li><a href="#"><i class="far fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-eye"></i></a></li>
								<li><a href="#"><i class="far fa-comments"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-4">
					<div class="blog-box">
						<div class="blog-img">
							<img class="img-fluid" src="fruits/국산/수박.jpg" alt="" />
						</div>
						<div class="blog-content">
							<div class="title-blog">
								<h3>수박의 효능</h3>
								<p>수박에는 베타카로틴, 카로티노이드의 일종인 리코펜이 풍부하게 함유되어 있다. 두 가지 물질 모두
									대표적인 항산화 물질로 알려져 있는데 특히 리코펜은 베타카로틴보다 항산화 효과가 2배 정도 더 뛰어나다고 알려져
									있다. 노화를 일으키는 주요 원인 중 하나인 활성산소를 효과적으로 제거함으로써 노화 예방뿐만 아니라 다양한
									질병으로부터도 우리 몸을 건강하게 지킬 수 있다.</p>
							</div>
							<ul class="option-blog">
								<li><a href="#"><i class="far fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-eye"></i></a></li>
								<li><a href="#"><i class="far fa-comments"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 col-xl-4">
					<div class="blog-box">
						<div class="blog-img">
							<img class="img-fluid" src="fruits/국산/토마토.jpg" alt="" />
						</div>
						<div class="blog-content">
							<div class="title-blog">
								<h3>토마토의 효능</h3>
								<p>생으로 먹는 것은 물론 주스, 케첩, 퓌레, 소스로 만들기도 하고 덜 익은 토마토는 피클을 만들어
									먹기도 한다. 서양 요리에서 이처럼 토마토가 많이 쓰이는 이유는 토마토가 알칼리성 식품이라 고기 요리와 잘
									어울리기 때문이다. 고기나 생선 등 기름기 있는 음식을 먹을 때 토마토를 곁들이면, 산성을 중화하고 소화를 촉진해
									위의 부담을 덜 수 있다. 맛도 일품이다!</p>
							</div>
							<ul class="option-blog">
								<li><a href="#"><i class="far fa-heart"></i></a></li>
								<li><a href="#"><i class="fas fa-eye"></i></a></li>
								<li><a href="#"><i class="far fa-comments"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Blog  -->


	<!-- Start Instagram Feed  -->
	<div class="instagram-box">
		<div class="main-instagram owl-carousel owl-theme">
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-01.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-02.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-03.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-04.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-05.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-06.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-07.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-08.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-09.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/instagram-img-05.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Instagram Feed  -->


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
								<li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
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
			All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By
			: <a href="https://html.design/">html design</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/inewsticker.js"></script>
	<script src="js/bootsnav.js."></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
</body>

</html>