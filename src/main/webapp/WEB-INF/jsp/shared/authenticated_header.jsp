<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<spring:eval expression="@applicationProperties['application.version']" var="applicationVersion" />
<spring:eval expression="@environmentProperties['websitebuilder.common_assets_base_url']" var="commonAssetsBaseUrl" />

<spring:url value="/web-resources-{applicationVersion}" var="resourceUrl">
    <spring:param name="applicationVersion" value="${applicationVersion}" />
</spring:url>

<c:set var="logoUrl" value="${resourceUrl}/ugafinance/img/logo.png" />

<style type="text/css">
.btn-group div.dropdown {
    display: inline-block;
}

.btn-group {
    font-size: 14px;
}
</style>

<div id="navbar" class="navbar navbar-default" >
    <div class="navbar-container container" id="navbar-container" style="background:url('${resourceUrl}/ugafinance/img/uga-header-bkgd.jpg'); background-size: cover;">
        <button type="button" class="navbar-toggle menu-toggler pull-left display" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="navbar-header pull-left" style="padding:10px;">
            <a href="${pageContext.request.contextPath}/home" class="navbar-brand"> <small><img class="navbar-logo" src="${logoUrl}" /></small></a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <span class="user-info"> <small> Welcome,</small> <c:out value="${SessionDataHolder['contact'].firstName}" /> <c:out value="${SessionDataHolder['contact'].lastName}" /></span> <i class="ace-icon fa fa-caret-down"></i></a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <c:if test="${SessionDataHolder['contact'] != null && SessionDataHolder['contact'].role__c == 'Site Admin'}">
                            <li><a href="${pageContext.request.contextPath}/refreshWebSiteCache"> <i class="ace-icon fa fa-refresh"></i> Refresh Web Site Cache</a></li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/j_spring_security_logout"> <i class="ace-icon fa fa-power-off"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
