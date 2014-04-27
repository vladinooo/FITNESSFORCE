<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script>
	$(".topic").show();
</script>

<!-- Main Content -->
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <h2 class="headline first-child text-color">
        <span class="border-color"><c:out value="${selectedArticle.title}"/></span>
      </h2>
      
      ${selectedArticle.content}
      
      <br />
      
      <a href="<c:url value='/news' />"><i class="fa fa-chevron-left"></i> Back to news</a>
      
    </div>
  </div>  <!-- / .row -->
</div> <!-- / .container -->