<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
	<t:template>
		<jsp:body>
	<form method="POST" modelAttribute="news" class="form-horizontal">
	<h4>Title:</h4>		
       <textarea class="ckeditor" path="title" name="title" cols="80" rows="4">
            ${newlist.title}
       </textarea>
	<h4>Content:</h4>		
       <textarea class="ckeditor" path="Content" name="Content" cols="80" rows="10">
            ${newlist.content}
       </textarea>
<h4>Date post</h4>	
	<input type="date" path="datepost" id="datepost" name ="datepost" value="${newlist.datepost}"class="form-control input-sm"/>
	</br>
<input type="submit" value="commit" class="btn btn-primary"/>
</form>
<div class="alert alert-success lead"data-dismiss="alert" aria-label="Close" >
	    	${success}
		</div>
</jsp:body>
</t:template>