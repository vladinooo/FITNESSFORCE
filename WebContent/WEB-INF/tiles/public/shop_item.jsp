<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>


<!-- Main Content -->
<div class="container shop-item">
	<div class="row">

		<div class="col-sm-3">

			<!-- Categories -->
			<div class="shop-category first-child">Categories</div>
			<div id="MainMenu">
			  <div class="list-group panel">
			    <a href="#" class="list-group-item list-group-item-success active" data-parent="#MainMenu">Category #1</a>
			    <a href="#" class="list-group-item list-group-item-success" data-parent="#MainMenu">Category #2</a>
			    <a href="#" class="list-group-item list-group-item-success" data-parent="#MainMenu">Category #3</a>
			    <a href="#" class="list-group-item list-group-item-success" data-parent="#MainMenu">Category #4</a>
			  </div>
		  </div>

			<!-- Search -->
			<div class="shop-category">Search</div>
			<form role="form" class="shop-search">
				<div class="form-group">
					<label for="query" class="sr-only">Search</label> <input type="text" class="form-control"
						placeholder="Looking for..." id="query">
				</div>
				<button class="btn btn-color">Search</button>
			</form>

		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-6">
					<div class="product-img">
						<a href="#" data-lightbox="products">
							<img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive main" alt="...">
						</a>
						<div class="row">
							<div class="col-xs-4">
								<a href="#" data-lightbox="products">
									<img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="...">
								</a>
							</div>
							<div class="col-xs-4">
								<a href="#" data-lightbox="products">
									<img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="...">
								</a>
							</div>
							<div class="col-xs-4">
								<a href="#" data-lightbox="products">
									<img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="...">
								</a>
							</div>
						</div>
						<!-- / .row -->
					</div>
				</div>
				<div class="col-sm-6">
					<h3 class="primary-font first-child">Product Title</h3>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum
						varius, tincidunt odio nec, placerat enim.</p>
					<div class="price-block">
						<span class="price">£ 2.00 x</span> <input type="number" name="pcs" value="1" class="form-control">
					</div>
					<br> <a class="btn btn-color" href="#"><i class="fa fa-shopping-cart"></i> Add to cart</a>
				</div>
			</div><!-- / .row -->

			<div class="row">
				<div class="col-sm-12">
					<h3 class="headline text-color">
						<span class="border-color">Product Details</span>
					</h3>
					<p>Nunc in neque nec arcu vulputate ullamcorper. Ut id orci ac arcu consectetur fringilla. Class
						aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis hendrerit
						enim id arcu lacinia, id commodo ante semper. Sed vel ante nec nisi vestibulum congue. Pellentesque non
						lacus in tortor rutrum tristique.</p>
				</div>
			</div><!-- / .row -->
		</div>
	</div><!-- / .row -->
</div>

</div>
<!-- / .row -->
</div>
<!-- / .container -->