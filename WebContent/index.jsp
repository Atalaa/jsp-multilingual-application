<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Locale = language code + country code en + US = en_US --> 

<!-- Sets the locale for resource bundle. It's important that this line is before the fmt:setBundle. -->

<!-- 
	Initializes the resource bundle by its base name (that is, the full qualified package name 
	until with the sole name without the _en_US specifier). 
-->


<!-- 
	Reads links and set the values accordingly for the locale.
	param.myLocale: reads myLocale parameter sent by links
	We check the value is not empty, then we'll use param.myLocale that came from that href link.
	If that value is empty or not available, then we use pageContext.request.locale,
	the web browser will send the default locale based on the user's operating system.
	
 -->
<c:set var="myLocale" value="${not empty param.myLocale ? param.myLocale : pageContext.request.locale}" scope="session" />


<!-- Set the locale and give it a value -->
<fmt:setLocale value="${param.myLocale}"/> 

<!-- package/directory name then JSP will append locale-->
<fmt:setBundle basename="com.i18nDemo.mylabels" />

<html>
<body>

	<div align="center">
		<a href="index.jsp?myLocale=en_US">English (US)</a>
		|
		<a href="index.jsp?myLocale=fr_FR">French (FR)</a>
		|
		<a href="index.jsp?myLocale=es_ES">Spanish (ES)</a>
		|
		<a href="index.jsp?myLocale=de_DE">German (DE)</a>
		|
		<a href="index.jsp?myLocale=it_IT">Italian (IT)</a>
	</div>
	
	<hr><br/>
	
	<table border="1">
	
		<tr>
			<th><fmt:message key="label.matrix" /></th>
			<th><fmt:message key="label.mario" /></th>
			<th><fmt:message key="label.guardians" /></th>
		</tr>
		
		<tr>
			<th><img src="<c:url value="/resources/img/matrix4.jpg" />" /></th>
			<th><img src="<c:url value="/resources/img/mario.jpg" />" /></th>
			<th><img src="<c:url value="/resources/img/gardien.jpeg" />" /></th>
		</tr>

		<tr>
			<th> <!-- Retrieves the message value by the specified bundle key. -->
				<fmt:message key="label.synopsis" /> <br/><br/>
				<fmt:message key="label.rating"/> <br/><br/>
				<fmt:message key="label.year"/> <br/>
			</th>
			
			<th> <!-- Retrieves the message value by the specified bundle key. -->
				<fmt:message key="label.mario.synopsis" /> <br/><br/>
				<fmt:message key="label.mario.rating"/> <br/><br/>
				<fmt:message key="label.mario.year"/> <br/>
			</th>
			
			<th> <!-- Retrieves the message value by the specified bundle key. -->
				<fmt:message key="label.guardians.synopsis" /> <br/><br/>
				<fmt:message key="label.guardians.rating"/> <br/><br/>
				<fmt:message key="label.guardians.year"/> <br/>
			</th>
		</tr>
	
	</table>
	
	Selected locale: ${myLocale}
												
</body>
</html>

