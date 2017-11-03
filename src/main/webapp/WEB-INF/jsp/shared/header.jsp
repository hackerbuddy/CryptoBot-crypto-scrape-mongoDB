<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.btn-group div.dropdown {
    display: inline-block;
}

.btn-group {
    font-size: 14px;
}
</style>

<c:set var="numberOfTasksToComplete" value="0" scope="request"/>
<c:set var="numberOfTasksCompleted" value="0" scope="request"/>



<script type="text/javascript">
$(document).ready(function() {
    $.ajaxSetup({
        cache : false
    });
    
    $('#refreshContent').on('click', function(event) {
    	event.preventDefault();
    	$.get("/admin/refreshWebSiteCache").done(function() {
    		location.reload();
    	});
    });
    
});
</script>

<div id="navbar" class="navbar navbar-default" >
    <div class="navbar-container container" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left display" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="navbar-header pull-left" style="padding:10px;">
            <a href="/home" class="navbar-brand"> <small><img class="navbar-logo" src="/web-resources/uas/img/uga-logo.png" style="margin-left:20px;"/></small></a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <span class="user-info"> <small> Welcome,</small> UGA Partner</span> <i class="material-icons">turned_in</i></a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a href="/j_spring_security_logout"> <i class="ace-icon fa fa-power-off"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
 
	



