<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
		  <t:template>
	<jsp:body>
		  	<div class="panel-heading">
					<span class="lead">List of Documents </span>
				</div>
		  	<div class="tablecontainer">
		  	
				<table class="table table-hover">
		    		<thead>
			      		<tr>
					        <th>No.</th>
					        <th>File Name</th>
					        <th>Type</th>
					        <th>Description</th>
					        <th width="100"></th>
					        <th width="100"></th>
						</tr>
			    	</thead>
		    		<tbody>
					<c:forEach items="${documents}" var="doc" varStatus="counter">
						<tr>
							<td>${counter.index + 1}</td>
							<td>${doc.name}</td>
							<td>${doc.type}</td>
							<td>${doc.description}</td>
							<td><a
								href="<c:url value='/download-document-${newslist.id}-${doc.id}' />"
								class="btn btn-success">download</a></td>
							<td><a
								href="<c:url value='/delete-document-${newslist.id}-${doc.id}' />"
								class="btn btn-danger">delete</a></td>
						</tr>
					</c:forEach>
		    		</tbody>
		    	</table>
		    </div>
		<div class="panel panel-default">
			
			<div class="panel-heading">
					<span class="lead">Upload New Document</span>
				</div>
			<div class="uploadcontainer">
				<form:form method="POST" modelAttribute="fileBucket"
					enctype="multipart/form-data" class="form-horizontal">
			
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Upload a document</label>
							<div class="col-md-9">
								<form:input type="file" path="file" id="file"
									class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="file" class="help-inline" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Description</label>
							<div class="col-md-9">
							    <form:input path="description"
									name="description"  class="form-control input-sm" />

							</div>
							
						</div>
					</div>
			
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Upload"
								class="btn btn-primary btn-sm">
						</div>
					</div>
	
				</form:form>
				</div>
	 	<div class="well">
	 		Go to <a href="<c:url value='/managenews' />">Manage Document</a>
	 	</div>
   	</div>
</jsp:body>
</t:template>