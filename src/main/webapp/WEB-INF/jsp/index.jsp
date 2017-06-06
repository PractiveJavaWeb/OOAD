	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
	<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
	<t:template>
		<jsp:body>
		<div class="alert alert-success lead"data-dismiss="alert" aria-label="Close" >
	    	${success}
		</div>			
			<table class="table">
 						<tr>
 							<th>Title News</th>
					        <th></th>
					        <th></th>
 						</tr>
 						<c:forEach items="${news}" var="news">
						<tr>
							<td >${news.title}</td>
							<td ><a href="<c:url value='/edit-news-${news.id}' />" class="btn btn-success">edit</a></td>
							<td ><a href="<c:url value='/delete-news-${news.id}' />" class="btn btn-danger">delete</a></td>
							<td ><a href="<c:url value='/add-document-${news.id}' />"class="btn btn-primary">Manage file</a>	</td>
						</tr>						
					</c:forEach>
			</table>
			<a href="<c:url value='/newscontent' />" class="btn btn-success">News Post</a>
			<a href="<c:url value='/editsidebar' />" class="btn btn-success">Edit Sidebar</a>
		</jsp:body>
	</t:template>