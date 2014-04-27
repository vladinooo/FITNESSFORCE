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
						
						<input id="articleTextareaInput" value='${selectedArticle.content}' hidden="true"/>
						
						<form:input path='content' id="articleTextareaOutput" hidden="true"/>
						
						<div class="col-lg-9">
							
							<%
		            		org.aarboard.ckeditor.CKEditor articleEditor = new org.aarboard.ckeditor.CKEditor("articleEditor", "articleEditor");
							articleEditor.setRows(10);
							articleEditor.setCols(60);
							articleEditor.setFilebrowserBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserBrowseUrl());
							articleEditor.setFilebrowserImageBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserImageBrowseUrl());
							articleEditor.setFilebrowserFlashBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserFlashBrowseUrl());
							articleEditor.setFilebrowserLinkBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserLinkBrowseUrl());
							articleEditor.setFilebrowserUploadUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserUploadUrl());
							articleEditor.setFilebrowserImageUploadUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserImageUploadUrl());
							articleEditor.setFilebrowserFlashUploadUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserFlashUploadUrl());
				        %>
				        <%= articleEditor.renderField() %>
				        
				        <form:errors path="content" cssClass="fieldValidationError"></form:errors>
				        
						</div>
						
					</div>

					<div class="form-group">
						<div class="col-lg-offset-2">
							<div class="pad-left15">
								<button type="submit" class="btn btn-primary" id="saveArticleBtn">Save</button>
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


<script>

//-------- Article content textarea --------------//

$(document).ready(function() {
	
	function populateArticleTextarea() {
		var content = $("#articleTextareaInput").val();
		CKEDITOR.instances.articleEditor.setData(content); 
	}
	
	populateArticleTextarea();
	
	$('#saveArticleBtn').click(function(e) {
	 	e.preventDefault();
	 	
	 	// escape single and double quotes from href and img src
/* 	 	var elements = $(CKEDITOR.instances.articleEditor.getData());
	 	$(elements).each(function () {
	 		
	 	    $(this).find("a").each(function() {
	 	        var href = $(this).attr('href');
	 	       	href = href.replace(/["']/g, "");
	 	       	$(this).attr('href', href);
	 	    });
	 	    
	 	   $(this).find("img").each(function() {
	 	        var src = $(this).attr('src');
	 	       	src = src.replace(/["']/g, "");
	 	       	$(this).attr('src', src);
	 	    });

	 	});
	 	
		$("#articleTextareaOutput").val($(elements).prop('outerHTML')); */
		
		$("#articleTextareaOutput").val(CKEDITOR.instances.articleEditor.getData());
	  	$("#edit-article-form").submit();
	});
	
});

</script>