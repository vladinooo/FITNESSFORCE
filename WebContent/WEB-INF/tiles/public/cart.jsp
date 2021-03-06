<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	$(".topic").show();
</script>




<!-- Main Content -->
<div class="container shopping-cart">
	<div class="row">
		
		<c:choose>
		    <c:when test="${empty cartItems}">
		    	<div class="col-sm-12 text-center">
					<h4>You have no items in your shopping cart.</h4>
		        </div>
		    </c:when>
		    <c:otherwise>
				<div class="col-sm-12">
		            <table class="table table-bordered">
		              <thead>
		                <tr>
		                  <th class="deleteItem"></th>
		                  <th class="itemIcon"></th>
		                  <th>Product name</th>
		                  <th class="itemPrice">Price</th>
		                </tr>
		              </thead>
		              <tbody>
		              	<c:forEach items="${cartItems}" var="item" varStatus="iterator">
			                <tr>
			                  <td><a href="<c:url value='/delete_from_cart'><c:param name='itemid' value='${iterator.index}'/>
			                  			   <c:param name='itemprice' value='${item.product.price}'/></c:url>"
			                  		class="pull-right"><i class="fa fa-trash-o" style="font-size:20px; padding:5px; color: gray"></i></a>
			                  </td>
			                  <td><i class="fa fa-male" style="font-size:30px; padding:10px 25px; color: gray"></i></td>
			                  <td>
			                    <div class="item">
			                      <c:out value="${item.product.title}"/>
			                      <p class="text-muted"><c:out value="${item.product.description}"/></p>
			                    </div>
			                  </td>
			                  <td class="itemPrice">�<c:out value="${item.product.price}"/></td>
			                </tr>
		              	</c:forEach>
		              </tbody>
		            </table>
		            <ul class="text-right checkout">
		              <li><strong>Total Price: �<c:out value="${cartTotal.total}"/></strong></li>
		              <li><a href="#" class="btn btn-color btn">Proceed to checkout</a></li>
		            </ul>
		    	</div> 
		    </c:otherwise>
		</c:choose>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->
