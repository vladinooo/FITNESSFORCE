<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>




<!-- Main Content -->
<div class="container shopping-cart">
	<div class="row">
		<div class="col-sm-12">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th></th>
                  <th></th>
                  <th>Product name</th>
                  <th>Price</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><a href="<c:url value='/cart'/>" class="pull-right"><i class="fa fa-trash-o" style="font-size:20px; padding:5px; color: gray"></i></a></td>
                  <td>
                  	<i class="fa fa-male" style="font-size:40px; padding:10px 20px; color: gray"></i>
                  </td>
                  <td>
                    <div class="item">
                      Product Title #1
                      <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.</p>
                    </div>
                  </td>
                  <td>$339,00</td>
                </tr>
              </tbody>
            </table>
            <ul class="text-right checkout">
              <li><strong>Total Price</strong>: $599</li>
              <li><strong>Shipping</strong>: Free</li>
              <li><a href="#" class="btn btn-color btn">Proceed to checkout</a></li>
            </ul>
          </div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <h1>Your Shopping Cart</h1>
  <c:forEach items="${cart}" var="session">
    Name: ${session.name}, 
    Price: <fmt:formatNumber value="${product.price}" maxFractionDigits="2" />
    <br />
  </c:forEach>
 
  <h1>Add Product</h1>
  <form method="post" action="addProduct">
    Name: <input type="text" name="name" /> Price: <input type="text" name="price" />
    <button>Add Product</button>
  </form>


