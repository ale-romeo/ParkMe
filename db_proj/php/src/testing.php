<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- Custom CSS -->
	<style>
		/* Add your custom CSS here */
		body {
			background-color: #f5f5f5;
			font-family: 'Roboto', sans-serif;
		}

		.navbar {
			background-color: #00b8d4;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		}

		.navbar .navbar-brand {
			color: white;
			font-weight: 600;
		}

		.navbar .nav-item .nav-link {
			color: white;
			font-weight: 500;
		}

		.navbar .nav-item .nav-link:hover,
		.navbar .nav-item .nav-link.active {
			background-color: rgba(0, 0, 0, 0.1);
		}

		.btn-primary {
			background-color: #00b8d4;
			border-color: #00b8d4;
		}

		.btn-primary:hover {
			background-color: #0097a7;
			border-color: #0097a7;
		}

		.card {
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		}

		.card .card-title {
			font-size: 18px;
			font-weight: 500;
		}

		.card .card-text {
			font-size: 14px;
			color: #666;
		}

		.card .card-footer {
			background-color: #f5f5f5;
			border-top: none;
		}

		.card .card-footer .btn {
			font-size: 14px;
			font-weight: 500;
		}
	</style>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet'>

	<title>My Parking App</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">MyParking App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Find Parking</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Add Parking</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">My Reservations</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-4">
					<img src="https://images.unsplash.com/photo-1548199710-0adf9ea622e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Parking Spot 1</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod
							orci at elit lobortis, eget fermentum nisi suscipit.</p>
					</div>
					<div class="card-footer d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-primary">Reserve</button>
						<p class="m-0">$10/hr</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4">
					<img src="https://images.unsplash.com/photo-1548199710-0adf9ea622e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Parking Spot 2</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod
							orci at elit lobortis, eget fermentum nisi suscipit.</p>
					</div>
					<div class="card-footer d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-primary">Reserve</button>
						<p class="m-0">$15/hr</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mb-4">
					<img src="https://images.unsplash.com/photo-1548199710-0adf9ea622e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Parking Spot 3</h5>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod
							orci at elit lobortis, eget fermentum nisi suscipit.</p>
					</div>
					<div class="card-footer d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-primary">Reserve</button>
						<p class="m-0">$20/hr</p>
					</div>
				</div>
			</div>

			<!-- Optional JavaScript -->
			<!-- jQuery first, then Popper.js, then Bootstrap JS -->
			<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
				integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
				crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.16.0/dist/umd/popper.min.js"
				integrity="sha384-QDjw/GnJhGg/nx/xds8HZ+0X7VfKsTpT7Vu8I6oT0AuLKjJ02deC8zWZUY1rRzA"
				crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
				integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
				crossorigin="anonymous"></script>
</body>

</html>