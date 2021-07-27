<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="KO">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자율스터디 모집게시판</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/boardStudy.css" rel="stylesheet" />

</script>
</head>
<body>
	<!-- Navigation-->

	<article>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="#!">Ogong</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<!-- 드롭다운 시작 -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">자율스터디</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#!">자율스터디 목록</a></li>
								<li><a class="dropdown-item"
									href="/board/listBoard?boardCategory=5">모집게시판</a></li>
							</ul> <!-- 드롭다운 끝 -->
						<li class="nav-item"><a class="nav-link" href="#!">그룹스터디</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/board/listBoard?boardCategory=1">정보공유게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/board/listBoard?boardCategory=2">Q&A게시판</a></li>
						<!-- 드롭다운 시작 -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">쉼터게시판</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#!">자유게시판</a></li>
								<li><a class="dropdown-item"
									href="/board/listBoard?boardCategory=5">합격후기 게시판</a></li>
							</ul> <!-- 드롭다운 끝 -->
						<li class="nav-item"><a class="nav-link"
							href="/board/listBoard?boardCategory=6">파일공유 게시판</a></li>
						<!-- dropdown -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-MYtoggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#!">신고조회</a></li>
								<li><a class="dropdown-item" href="#!">회원조회</a></li>

							</ul></li>
					</ul>
					<form class="d-flex">

						<button class="btn btn-outline-dark" type="submit">
							<i class="bi-people-fill me-1"></i> My Page
						</button>

					</form>
				</div>
			</div>
		</nav>
		<!-- Header-->
		<header class="bg-dark py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="text-center text-white">
					<h1 class="display-4 fw-bolder">자율스터디 모집게시판</h1>
					<p class="lead fw-normal text-white-50 mb-0">함께 공부할 친구들을 모집 해
						보세요!</p>
					<br /> <a class="btn btn-secondary btn-xl"
						href="/board/addBoard?boardCategory=5">모집 등록</a>
				</div>
			</div>
		</header>
		<!-- Section-->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


					<c:forEach var="board" items="${list}">


						<div class="col mb-5">
							<div class="card h-100">
								<!-- Sale badge-->
								<div class="badge bg-dark text-white position-absolute"
									style="top: 0.5rem; right: 0.5rem">new</div>
								<!-- Product image-->
								<img class="card-img-top" src="/resources/images/studythumb.jpg"
									alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${board.boardTitle}</h5>
									</div>
									<input type="hidden" value="${board.boardNo}" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<td align="center">${board.writer.nickname}</td>
									<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<td align="left">${board.boardRegDate}</td>
								</div>
								<!-- actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="/board/getBoard?boardNo=${board.boardNo}">View
											Study</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</section>
	</article>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; 2021 -
				ogong</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/javascript/scripts.js"></script>

</body>
</html>