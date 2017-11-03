<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:eval expression="@applicationProperties['application.version']" var="applicationVersion"/>
<spring:eval expression="@environmentProperties['websitebuilder.common_assets_base_url']" var="commonAssetsBaseUrl"/>

<spring:url value="/web-resources-{applicationVersion}" var="resourceUrl">
    <spring:param name="applicationVersion" value="${applicationVersion}"/>
</spring:url>

<c:set var="logoUrl" value="${resourceUrl}/ugafinance/img/logo.png" />

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="${pageContext.request.contextPath}/login"><img src="${logoUrl}"></a>
        </div>
    </div>
</div>

