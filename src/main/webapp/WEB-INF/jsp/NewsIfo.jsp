
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<t:template>
	<jsp:body>	
			<h3 style="color: Red; text-align: center;">${newlist.title}</h3>
			</br>
		</br>
			${newlist.content}
			<c:forEach items="${documents}" var="doc">
			<a href="<c:url value='/download-document-${newslist.id}-${doc.id}' />">${doc.name}</a>
			</br>
		</c:forEach>
			</br>
			<h5 style="color: blue; text-align: right;">Date post: ${newlist.datepost}</h3>			
		
	
	</jsp:body>
</t:template>