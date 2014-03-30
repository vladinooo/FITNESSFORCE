<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-stack-list"></i> Articles</h1>
</div>

<div class="row">

    <div class="col-lg-12">

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-stack-list"></i></div> 
                <h4>All articles</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

				<div class="row">
					<div class="col-lg-6">
						<div id="dataTable_length" class="dataTables_length">
							<a href="create_article">
								<button type="submit" class="btn btn-primary">Add new</button>
							</a>
						</div>
					</div>
				</div>
                
                <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-hover" id="dataTable">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Date Created</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach var="article" items="${articles}">
							<tr>
								<td class="center"><c:out value="${article.title}"/></td>
								<td class="center"><c:out value="${article.datetime}"/></td>
								<td class="center"><c:out value="${article.enabled == true ? 'Published' : 'Draft'}"/></td>
								<td class="center ">
									<div class="btn-group">
                                        <a href="#" class="btn btn-success tip" title="" data-original-title="View article"><i class="icon16 i-eye-3"></i></a>
                                        <a href="
                                        	<c:url value='/edit_article'>
											   <c:param name='articleid' value='${article.articleId}'/>
											</c:url>"
											class="btn btn-info tip" title="" data-original-title="Edit article"><i class="icon16 i-pencil"></i></a>
                                        <a href="#"
											class="btn btn-danger tip openModalDialog" title="" data-original-title="Delete article"><i class="icon16 i-remove-4"></i></a>
										
										<span class="deleteUserUrlPlaceholder" hidden="hidden">
											<c:url value='/delete_article'>
												<c:param name='articleid' value='${article.articleId}'/>
											</c:url>
										</span>
										<div title="Delete article" class="dialog">
											<p>Are you sure?</p>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Title</th>
                            <th>Date Created</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                </table>
            </div><!-- End .panel-body -->
        </div><!-- End .widget -->
                            
    </div><!-- End .col-lg-12  -->                     
                        
</div><!-- End .row-fluid  -->


