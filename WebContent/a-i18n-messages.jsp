<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Locale = language code + country code en + US = en_US --> 

<!-- Sets the locale for resource bundle. It's important that this line is before the fmt:setBundle. -->

<!-- 
	Initializes the resource bundle by its base name (that is, the full qualified package name 
	until with the sole name without the _en_US specifier). 
-->


<html>
<body>
	
	<a href="a-i18n-messages.jsp?myLocale=en_US">English (US)</a>
	<a href="a-i18n-messages.jsp?myLocale=es_ES">Spanish (ES)</a>
	<a href="a-i18n-messages.jsp?myLocale=de_DE">German (DE)</a>
	
	
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

	<br/>
	<hr>
	<br/>
	
	<!-- Retrieves the message value by the specified bundle key. -->
	
	<fmt:message key="label.greeting" /> <br/>
	<fmt:message key="label.firstname"/> John <br/>
	<fmt:message key="label.lastname"/> Doe <br/>
	<fmt:message key="label.welcome"/> <br/>
												
</body>
</html>

