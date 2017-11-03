<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="sidebar" class="sidebar responsive">
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>

    <ul class="nav nav-list">
        <li class="<c:if test="${SessionDataHolder['activeModule'] == 'Home'}">active</c:if>"><a href="${pageContext.request.contextPath}/home"> <i class="menu-icon fa fa-home"></i> <span class="menu-text"> Home </span></a> <b class="arrow"></b></li>
        <li class="<c:if test="${SessionDataHolder['activeModule'] == 'Reports'}">active open</c:if>">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-user"></i>
                <span class="menu-text">Reports</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="<c:if test="${SessionDataHolder['activeSubModule'] == 'Leads Report'}">active</c:if>">
                    <a href="${pageContext.request.contextPath}/viewLeadsReport">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Leads
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="<c:if test="${SessionDataHolder['activeSubModule'] == 'Opportunities Report'}">active</c:if>">
                    <a href="${pageContext.request.contextPath}/viewOpportunitiesReport">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Opportunities
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
        <li class="<c:if test="${SessionDataHolder['activeModule'] == 'Marketing Material'}">active</c:if>"><a href="${pageContext.request.contextPath}/viewMarketingMaterial"> <i class="menu-icon fa fa-home"></i> <span class="menu-text"> Marketing Material </span></a> <b class="arrow"></b></li>
    </ul>

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>
