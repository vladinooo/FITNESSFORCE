<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-users"></i> Users</h1>
</div>

<div class="row">

    <div class="col-lg-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-users"></i></div> 
                <h4>All users</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

				<div class="row">
					<div class="col-lg-6">
						<div id="dataTable_length" class="dataTables_length">
							<a href="admin_create_user">
								<button type="submit" class="btn btn-primary">Add new</button>
							</a>
						</div>
					</div>
				</div>
                
                <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-hover" id="dataTable">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Registered</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach var="user" items="${users}">
							<tr>
								<td class="center"><c:out value="${user.username}"/></td>
								<td class="center"><c:out value="${user.password}"/></td>
								<td class="center"><c:out value="${user.email}"/></td>
								<td class="center"><c:out value="${user.datetimeRegistered}"/></td>
								<td class="center">
								    <c:choose>
								        <c:when test="${user.rolename == 'ROLE_ADMIN'}">Administrator</c:when>
								        <c:when test="${user.rolename == 'ROLE_USER'}">User</c:when>
								    </c:choose>
								</td>
								<td class="center"><c:out value="${user.enabled == true ? 'Active' : 'Terminated'}"/></td>
								<td class="center ">
									<div class="btn-group">
                                        <a href="#" class="btn btn-success tip" title="" data-original-title="View user"><i class="icon16 i-eye-3"></i></a>
                                        <a href="
                                        	<c:url value='/admin_edit_user'>
											   <c:param name='userid' value='${user.userId}'/>
											</c:url>"
											class="btn btn-info tip" title="" data-original-title="Edit user"><i class="icon16 i-pencil"></i></a>
                                        <a href="#"
											class="btn btn-danger tip openModalDialog" title="" data-original-title="Delete user"><i class="icon16 i-remove-4"></i></a>
										
										<span class="deleteUserUrlPlaceholder" hidden="hidden">
											<c:url value='/delete_user'>
												<c:param name='userid' value='${user.userId}'/>
											</c:url>
										</span>
										<div title="DELETE USER" class="dialog">
											<p>This action will delete all user's data. Are you sure?</p>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Registered</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div><!-- End .panel-body -->
        </div><!-- End .widget -->
                            
    </div><!-- End .col-lg-12  -->                     
                        
</div><!-- End .row-fluid  -->


<script>

//create unique ids
$(".openModalDialog").each(function(i){
	$(this).attr("id", "openModal" + i);
});

// create unique ids
$(".dialog").each(function(i){
	$(this).attr("id", "modal" + i);
});

// create unique ids
$(".deleteUserUrlPlaceholder").each(function(i){
	$(this).attr("id", "deleteUserUrl" + i);
});


$(".openModalDialog").each(function(i){
	var openModalId = $(this).attr("id");
	$("#" + openModalId).click(function(){
		$('#modal' + i).dialog('open');
		return false;
	});
	
	// JQuery UI Modal Dialog	
	$('#modal' + i).dialog({
		autoOpen: false,
		modal: true,
		dialogClass: 'dialog modalDialogWarning',
		buttons: [
		          {
		              text: "Delete",
		              "class": "btn btn-danger",
		              click: function() {
		            	  var url = $("#deleteUserUrl" + i).text();
		            	  window.location = url;
		            	  $(this).dialog("close");
		              }
		          },
		          {
		        	  text: "Cancel",
		              click: function() {
		            	  $(this).dialog("close");
		              }
		          }
		      ]
	});
	
});


$("div.dialog button").addClass("btn");

</script>

