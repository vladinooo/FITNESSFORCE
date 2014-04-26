<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>

<%-- 
<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-sm-12">
		
			<li class="dropdown">
	              <a href="#" class="dropdown-toggle bg-hover-color" data-toggle="dropdown">News <b class="caret"></b></a>
	              <ul class="dropdown-menu">
	              	<c:forEach var="article" items="${articles}">
	              		<li><a href="<c:url value='/view_article'>
										<c:param name='articleid' value='${article.articleId}'/>
								 	 </c:url>" class="bg-hover-color"><c:out value="${article.title}"/></a></li>
					</c:forEach>
	              </ul>
	            </li>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container --> --%>


<!-- Main Content -->
<div class="container shopping-cart">
	<div class="row">
		
		<c:choose>
		    <c:when test="${empty articles}">
		    	<div class="col-sm-12 text-center">
					<h4>No news available.</h4>
		        </div>
		    </c:when>
		    <c:otherwise>
				<div class="col-sm-12">
		            <table class="table table-bordered cartTable">
		              	<c:forEach items="${articles}" var="article">
			                <tr>
			                  <td><i class="fa fa-male" style="font-size:30px; padding:10px 25px; color: gray"></i></td>
			                  <td>
			                    <div class="item">
			                      <c:out value="${article.title}"/>
			                      <p class="text-muted"><c:out value="${article.content}" escapeXml="false"/></p>
			                    </div>
			                  </td>
			                </tr>
		              	</c:forEach>
		            </table>
		    	</div> 
		    </c:otherwise>
		</c:choose>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->