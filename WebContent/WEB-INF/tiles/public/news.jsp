<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
	$(".topic").show();
</script>


<script>

$(document).ready(function() {

	$(".articleWrapper").dotdotdot({
	
		/*	The HTML to add as ellipsis. */
		ellipsis	: '... ',
 
		/*	How to cut off the text/html: 'word'/'letter'/'children' */
		wrap		: 'word',
 
		/*	Wrap-option fallback to 'letter' for long words */
		fallbackToLetter: true,
 
		/*	jQuery-selector for the element to keep and put after the ellipsis. */
		after		: "a.readMoreLink",
 
		/*	Whether to update the ellipsis: true/'window' */
		watch		: false,
	
		/*	Optionally set a max-height, if null, the height will be measured. */
		height		: 150,
 
		/*	Deviation for the height-option. */
		tolerance	: 0,
 
		/*	Callback function that is fired after the ellipsis is added,
			receives two parameters: isTruncated(boolean), orgContent(string). */
		callback	: function( isTruncated, orgContent ) {},
 
		lastCharacter	: {
 
			/*	Remove these characters from the end of the truncated text. */
			remove		: [ ' ', ',', ';', '.', '!', '?' ],
 
			/*	Don't add an ellipsis if this array contains 
				the last character of the truncated text. */
			noEllipsis	: []
		}
		
	});
});

</script>


<!-- Main Content -->
<div class="container">
	<div class="row">
		
		<c:choose>
		    <c:when test="${empty articles}">
		    	<div class="col-sm-12 text-center">
					<h4>No news available.</h4>
		        </div>
		    </c:when>
		    <c:otherwise>
				<div class="col-sm-12">
		            <table class="table news-list">
		              	<c:forEach items="${articles}" var="article">
			                <tr>
			                  <td><i class="fa fa-file-text-o" style="font-size:80px; padding: 25px; color: gray"></i></td>
			                  <td>
			                    <div class="item">
			                      <h4><c:out value="${article.title}"/></h4>
			                      <div class="articleWrapper">
			                      	<p class="text-muted"><c:out value="${article.content}" escapeXml="false"/></p>
			                      	<a href="<c:url value='/view_article'>
												<c:param name='articleid' value='${article.articleId}'/>
								 	 		 </c:url>" class="readMoreLink">Read more</a>
			                      </div>
			                    </div>
			                  </td>
			                </tr>
		              	</c:forEach>
		            </table>
		    	</div> 
		    </c:otherwise>
		</c:choose>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->
