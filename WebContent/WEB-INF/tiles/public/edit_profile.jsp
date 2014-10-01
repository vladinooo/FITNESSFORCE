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
              <span class="border-color">Edit Profile</span>
          </h2>
          
          
          <div class="col-sm-3">
          	<div class="form-group">
              	<div class="profile-picture">
                    <img src="${pageContext.request.contextPath}/static/images/profile-picture.jpg" alt="Profile picture">
                </div>
                
                <span id="pp-upload" class="btn btn-default btn-file">
				    Browse... <input type="file">
				</span>
				<span class="pp-filename"></span>
             </div>
          </div>
          
          <div class="col-sm-9">
          	<h4>Personal Information</h4>
          	
          	<hr>
          	
          	<form role="form">
              <div class="form-group">
                <label for="firstname">First Name</label>
                <input type="text" class="form-control" id="firstname">
              </div>
              <div class="form-group">
                <label for="surname">Surname</label>
                <input type="text" class="form-control" id="surname">
              </div>
              
              <div class="row">
			  <div class="col-lg-6">
			    <div class="form-group">
              		<label for="age">Age</label>
              		<select class="form-control">
					  <option>10</option>
					  <option>11</option>
					  <option>12</option>
					  <option>13</option>
					  <option>14</option>
					  <option>15</option>
					  <option>16</option>
					  <option>17</option>
					  <option>18</option>
					  <option>19</option>
					  <option>20</option>
					  <option>21</option>
					  <option>22</option>
					  <option>23</option>
					  <option>24</option>
					  <option>25</option>
					  <option>26</option>
					  <option>27</option>
					  <option>28</option>
					  <option>29</option>
					  <option>30</option>
					  <option>31</option>
					  <option>32</option>
					  <option>33</option>
					  <option>34</option>
					  <option>35</option>
					  <option>36</option>
					  <option>37</option>
					  <option>38</option>
					  <option>39</option>
					  <option>40</option>
					</select> 
              	</div>
			  </div>
				  <div class="col-lg-6">
				  	<div class="form-group">
	              		<label for="gender">Gender</label>
	              		<select class="form-control">
					  		<option>Male</option>
					  		<option>Female</option>
						</select> 
	              	</div>
				  </div>
			  </div>
              
              <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone">
              </div>
              
              <div class="form-group">
                <label for="bio">Bio</label>
                <textarea class="form-control" rows="3" id="bio"></textarea>
              </div>
              
              <h4 style="padding-top:20px">Login Information</h4>
              
              <hr>
              
              <div class="form-group">
                <label for="username">User Name</label>
                <input type="text" class="form-control" id="username">
              </div>
              
              <div class="form-group">
                <label for="password">Password</label>
                <input type="text" class="form-control" id="password">
              </div>
              
              <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="text" class="form-control" id="confirm-password">
              </div>
              
              <hr>
              
              <a href="view_profile" class="btn btn-color">Save</a>
            </form>
            
          </div>
          
          
          
            
            
		</div>
	</div><!-- / .row -->
</div><!-- / .container -->


<script>

$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
});

$(document).ready( function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        console.log(numFiles);
        console.log(label);
        $(".pp-filename").text(label);
    });
});

</script>

	