<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>


<!-- Main Content -->
<div class="container">
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
				<div class="col-sm-4">
					<div class="shop-product">
						<a href="<c:url value='shop_item'/>"><img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="..."></a>
						<a href="<c:url value='shop_item'/>"><h5 class="primary-font">Product #1</h5></a>
						<p class="text-muted">Nunc in neque nec arcu vulputate ullamcorper.</p>
						<p>£2.00</p>
						<a href="#" class="btn btn-sm btn-color"><i class="fa fa-shopping-cart"></i> Add to cart</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="shop-product">
						<a href="<c:url value='shop_item'/>"><img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="..."></a>
						<a href="<c:url value='shop_item'/>"><h5 class="primary-font">Product #2</h5></a>
						<p class="text-muted">Nunc in neque nec arcu vulputate ullamcorper.</p>
						<p>£2.00</p>
						<a href="#" class="btn btn-sm btn-color"><i class="fa fa-shopping-cart"></i> Add to cart</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="shop-product">
						<a href="<c:url value='shop_item'/>"><img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="..."></a> <a
							href="<c:url value='shop_item'/>"><h5 class="primary-font">Product #3</h5></a>
						<p class="text-muted">Nunc in neque nec arcu vulputate ullamcorper.</p>
						<p>£2.00</p>
						<a href="#" class="btn btn-sm btn-color"><i class="fa fa-shopping-cart"></i> Add to cart</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="shop-product">
						<a href="<c:url value='shop_item'/>"><img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="..."></a> <a
							href="<c:url value='shop_item'/>"><h5 class="primary-font">Product #1</h5></a>
						<p class="text-muted">Nunc in neque nec arcu vulputate ullamcorper.</p>
						<p>£2.00</p>
						<a href="#" class="btn btn-sm btn-color"><i class="fa fa-shopping-cart"></i> Add to cart</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="shop-product">
						<a href="<c:url value='shop_item'/>"><img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="..."></a> <a
							href="<c:url value='shop_item'/>"><h5 class="primary-font">Product #2</h5></a>
						<p class="text-muted">Nunc in neque nec arcu vulputate ullamcorper.</p>
						<p>£2.00</p>
						<a href="#" class="btn btn-sm btn-color"><i class="fa fa-shopping-cart"></i> Add to cart</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="shop-product">
						<a href="<c:url value='shop_item'/>"><img src="${pageContext.request.contextPath}/static/images/product-1.jpg" class="img-responsive" alt="..."></a> <a
							href="<c:url value='shop_item'/>"><h5 class="primary-font">Product #3</h5></a>
						<p class="text-muted">Nunc in neque nec arcu vulputate ullamcorper.</p>
						<p>£2.00</p>
						<a href="#" class="btn btn-sm btn-color"><i class="fa fa-shopping-cart"></i> Add to cart</a>
					</div>
				</div>
			</div>
		</div>
		<!-- / .row -->

		<!-- Pagination -->
		<div class="row">
			<div class="col-sm-12">
				<ul class="pagination pull-right">
					<li class="disabled"><a href="#">«</a></li>
					<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">»</a></li>
				</ul>
			</div>
		</div>
		<!-- / .row -->

	</div>
	<!-- / .row -->
</div>

</div>
<!-- / .row -->
</div>
<!-- / .container -->