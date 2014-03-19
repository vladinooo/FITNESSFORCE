<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-users"></i> Users</h1>
</div>

<div class="row">

    <div class="col-lg-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-users"></i></div> 
                <h4>Manage users</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">
                
                <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-hover" id="dataTable">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Registered</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach var="user" items="${users}">
							<tr>
								<td class="center"><c:out value="${user.username}"/></td>
								<td class="center"><c:out value="${user.password}"/></td>
								<td class="center"><c:out value="${user.email}"/></td>
								<td class="center"><c:out value="${user.dateRegistered}"/></td>
								<td class="center"><c:out value="${user.enabled == true ? 'Active' : 'Terminated'}"/></td>
							</tr>
						</c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Registered</th>
                            <th>Status</th>
                        </tr>
                    </tfoot>
                </table>
            </div><!-- End .panel-body -->
        </div><!-- End .widget -->
                            
    </div><!-- End .col-lg-12  -->                     
                        
</div><!-- End .row-fluid  -->