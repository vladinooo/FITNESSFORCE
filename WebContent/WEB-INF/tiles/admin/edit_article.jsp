<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="heading" class="page-header">
	<h1>
		<i class="icon20 i-stack-list"></i> Articles
	</h1>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="icon">
					<i class="icon20 i-pencil"></i>
				</div>
				<h4>Edit profile</h4>
				<a href="#" class="minimize"></a>
			</div>
			<!-- End .panel-heading -->

			<div class="panel-body">

				<form:form class="form-horizontal" id="edit-article-form"
					action="${pageContext.request.contextPath}/do_edit_article"
					commandName="article" method="POST" role="form">

					<form:input type="text" hidden="hidden" name="articleId" path="articleId"
						value="${selectedArticle.articleId}" />
						
					<form:input type="text" hidden="hidden" name="slug" path="slug"
						value="${selectedArticle.slug}" />
					
					<div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Title</label>
                        <div class="col-lg-4">
                            <form:input class="form-control" type="text" name="title"
								path="title" value="${selectedArticle.title}"/>
							<form:errors path="title" cssClass="fieldValidationError"></form:errors>
                        </div>
                    </div><!-- End .control-group  -->

					<div class="form-group">
						<label class="col-lg-2 control-label" for="elastic">Content</label>
						<textarea id="articleTextareaOutput" hidden="true">
							<c:out value="${selectedArticle.content}" />
						</textarea>
						<div id="articleTextareaInput" class="col-lg-8">
							<form:textarea id='text-editor' name='text-editor' class='form-control' rows='10' path='content'/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-offset-2">
							<div class="pad-left15">
								<button type="submit" class="btn btn-primary" onclick="convertToJstlTextarea()">Save</button>
								<a href="<c:url value='articles'/>">
									<button type="button" class="btn">Cancel</button>
								</a>
							</div>
						</div>
					</div>
					<!-- End .form-group  -->

				</form:form>
			</div>
			<!-- End .panel-body -->
		</div>
		<!-- End .widget -->
	</div>
	<!-- End .col-lg-12  -->
</div>
<!-- End .row-fluid  -->
