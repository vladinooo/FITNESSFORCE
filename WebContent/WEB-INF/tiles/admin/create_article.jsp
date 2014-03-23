<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
	$(document).ready(passwordValidation);
</script>

<div id="heading" class="page-header">
    <h1><i class="icon20 i-stack-list"></i> Articles</h1>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="icon"><i class="icon20 i-stack-plus"></i></div> 
                <h4>Add new</h4>
                <a href="#" class="minimize"></a>
            </div><!-- End .panel-heading -->
        
            <div class="panel-body">

                <form:form class="form-horizontal" id="create-article-form"
					action="${pageContext.request.contextPath}/do_create_article"
					commandName="article" method="POST" role="form">
             
                    <div class="form-group">
                        <label class="col-lg-2 control-label" for="required">Title</label>
                        <div class="col-lg-10">
                            <form:input class="form-control" type="text" name="title"
								path="title" />
							<form:errors path="title" cssClass="fieldValidationError"></form:errors>
                        </div>
                    </div><!-- End .control-group  -->
					
					<div class="form-group">
						<label class="col-lg-2 control-label" for="elastic">Content</label>
						<div class="col-lg-10">
							<form:textarea id="text-editor" name="text-editor" class="form-control" path="content" rows="10" />
							<form:errors path="content" cssClass="fieldValidationError"></form:errors>
						</div>
					</div>

					<div class="form-group">
                        <div class="col-lg-offset-2">
                            <div class="pad-left15">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <a href='articles'>
									<button type="button" class="btn">Cancel</button>
								</a>
                            </div>
                        </div>
                    </div><!-- End .form-group  -->
                    
                </form:form>
            </div><!-- End .panel-body -->            
        </div><!-- End .widget -->
    </div><!-- End .col-lg-12  --> 
</div><!-- End .row-fluid  -->
