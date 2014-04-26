<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com"%>

                                               

<div id="heading" class="page-header">
	<h1>
		<i class="icon20 i-cloud-upload"></i> FILE MANAGER & UPLOAD
	</h1>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="icon">
					<i class="icon20 i-upload-2"></i>
				</div>
				<h4>File manager</h4>
				<a href="#" class="minimize"></a>
			</div><!-- End .panel-heading -->
			
			<div class="panel-body noPadding">

            	<%
            		org.aarboard.ckeditor.CKEditor editor1= new org.aarboard.ckeditor.CKEditor("editor1", "editor1");
			        editor1.setValue("Test text");
			        editor1.setRows(10);
			        editor1.setCols(60);
			        editor1.setFilebrowserBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserBrowseUrl());
			        editor1.setFilebrowserImageBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserImageBrowseUrl());
			        editor1.setFilebrowserFlashBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserFlashBrowseUrl());
			        editor1.setFilebrowserLinkBrowseUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserLinkBrowseUrl());
			        editor1.setFilebrowserUploadUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserUploadUrl());
			        editor1.setFilebrowserImageUploadUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserImageUploadUrl());
			        editor1.setFilebrowserFlashUploadUrl(org.aarboard.ckeditor.connector.VaadinBrowser.getFilebrowserFlashUploadUrl());
		        %>
		        <%= editor1.renderField() %>

        
            </div><!-- End .panel-body -->
            
            
		</div>
		<!-- End .widget -->
	</div>
	<!-- End .col-lg-12  -->
</div>
<!-- End .row-fluid  -->


           

