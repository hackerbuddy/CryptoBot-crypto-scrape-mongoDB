<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="sidebar" class="sidebar responsive">
    <script type="text/javascript">
        try {
            materialize.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>
    
    <ul class="side-nav nav fixed" style="margin-top:72px;">
        <li class="active">
        	<a href="/home"> 
        		<i class="material-icons">view_list</i> 
        		<span class="menu-text"> Home </span>
       		</a>
     	</li>
        <li class="<c:if test="${SessionDataHolder['activeModule'] == 'Reports'}">active open</c:if>">
            <a href="#" class="dropdown-toggle">
                <i class="material-icons">view_list</i>
                <span class="menu-text">Reports</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <ul class="submenu">
                <li class="<c:if test="${SessionDataHolder['activeSubModule'] == 'Leads Report'}">active</c:if>">
                    <a href="/leadsReport">
                        <i class="material-icons">label_outline</i>
                        Leads
                    </a>
                </li>
                <li class="<c:if test="${SessionDataHolder['activeSubModule'] == 'Opportunities Report'}">active</c:if>">
                    <a href="/opportunitiesReport">
                        <i class="material-icons">label_outline</i>
                        Opportunities
                    </a>
                </li>
            </ul>
        </li>
<%--         <li class="<c:if test="${SessionDataHolder['activeModule'] == 'Marketing Material'}">active</c:if>"><a href="${pageContext.request.contextPath}/viewMarketingMaterial"> <i class="menu-icon fa fa-home"></i> <span class="menu-text"> Marketing Material </span></a> <b class="arrow"></b></li> --%>
    </ul>

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
        
        $('.loadOnClick').on('click', function(event) {
        	$("#modalLoadingTop").removeClass("aou");
        });
        
        $('#search').submit(function(event) {
        	event.preventDefault();
        	$("#modalLoading").removeClass("aou");
        	window.location = "/search/autoSubmit?search=" + $('#nav-search-input').val();
        });

        
    </script>
</div>
