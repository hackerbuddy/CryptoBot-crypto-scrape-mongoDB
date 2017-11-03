<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<spring:eval expression="@applicationProperties['application.version']" var="applicationVersion" />
<spring:eval expression="@environmentProperties['websitebuilder.common_assets_base_url']" var="commonAssetsBaseUrl" />

<spring:url value="/web-resources-{applicationVersion}" var="resourceUrl">
    <spring:param name="applicationVersion" value="${applicationVersion}" />
</spring:url>

<c:set var="logoUrl" value="${resourceUrl}/ugafinance/img/logo.png" />

<div id="navbar" class="navbar navbar-default">
    <div class="navbar-container container" id="navbar-container" style="background:url('${resourceUrl}/ugafinance/img/uga-header-bkgd.jpg'); background-size: cover;">
        <div class="navbar-header pull-left" style="padding:10px;">
            <a href="${pageContext.request.contextPath}/login" class="navbar-brand"> <small><img class="navbar-logo" src="${logoUrl}" alt="UGA Finance" /></small></a>
        </div>
    </div>
</div>
