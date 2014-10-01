<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>


<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-sm-3">
			  
		  <div id="MainMenu">
			  <div class="list-group panel">
			    <a href="<c:url value='view_profile'/>" class="list-group-item list-group-item-success active" data-parent="#MainMenu">Profile</a>
			    <a href="<c:url value='credit'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Credit</a>
			    <a href="<c:url value='bookings'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Bookings</a>
			    <a href="<c:url value='onlineshop'/>" class="list-group-item list-group-item-success" data-parent="#MainMenu">Online Shop</a>
			  </div>
		  </div>


	  
		</div>
		<div class="col-sm-9">
		  <h2 class="headline first-child text-color">
              <span class="border-color">Profile</span>
          </h2>
          
          <div class="col-sm-3">
            <div class="team-member user-avatar text-center">
              <img class="img-responsive center-block" src="${pageContext.request.contextPath}/static/images/profile-picture.jpg" alt="Profile Picture">
            </div>
          </div>
          <div class="col-sm-9">
                <h2 class="primary-font">Usain Bolt</h2>
                <p>User name: 
                  <span class="text-muted">usainbolt@gmail.com</span>
                </p>
                <p>Age: 
                  <span class="text-muted">28</span>
                </p>
                <p>
                  Gender:
                  <span class="text-muted">Male</span>
                </p>
                <p>
                  Phone: 
                  <span class="text-muted">01234 123123</span>
                </p>
                <p>
                  Bio:
                  <span class="text-muted">Usain St. Leo Bolt OJ CD is a Jamaican sprinter. Widely regarded as the fastest person ever, he is the first man to hold both the 100 metres and 200 metres world records since fully automatic time measurements became mandatory in 1977</span>
                </p>
                <hr>
                <a href="edit_profile" class="btn btn-color">Edit</a>
          </div>
          
          
		</div>
	</div><!-- / .row -->
</div><!-- / .container -->



	

	