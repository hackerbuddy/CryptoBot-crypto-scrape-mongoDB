<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="navbar-fixed">
	<nav>
		<div class="nav-wrapper grey lighten-4 z-depth-5" id="nav-wrapper">
				<a href="/home" class="navbar-brand center"> <small><img id="logo-navbar" class="responsive-img" src="/web-resources/uas/img/uga-logo.png"/></small></a>
				<a id="mobile-nav-trigger" href="#" data-activates="mobile-nav" class="button-collapse left nav-item"><i class="material-icons">menu</i></a>
		
			<ul id="standard-nav" class="right hide-on-med-and-down">
        		<li id="homeButton"><a href="/home/" class="nav-item" style="font-weight: 400;">Home<i class=" mdi mdi-home right"></i></a></li>
        		<li id="addLeadButton"><a href="/addLead" class="nav-item" style="font-weight: 400;">Add Lead<i class="material-icons right">playlist_add</i></a></li>
        		<li id="marketingMaterial"><a id="marketingMaterial" href="/marketingMaterial" class="nav-item" style="font-weight: 400;">Marketing Materials</a></li>
        		<li id="reports"><a class="dropdown-button nav-item" href="#!" data-activates="dropdown1">Reports<i class="material-icons right">arrow_drop_down</i></a></li>
        		<li id="editProfile"><a class="dropdown-button nav-item" href="#!" data-activates="profileDropdown">Profile<i class="material-icons right">account_circle</i></a></li>
    		</ul>
    
        
    		<ul id="mobile-nav" class="side-nav darken-1">
    			<li id="homeButton"><a class="nav-item" href="/home/">Home<i class="mdi mdi-home right"></i></a></li>
    			<li><div class="divider"></div></li>
    			<li id="addLeadButton"><a class="nav-item" href="/addLead">Add Lead<i class="material-icons right">playlist_add</i></a></li>
    			<li><div class="divider"></div></li>
    			<li id="marketingMaterial"><a href="/marketingMaterial" class="nav-item" style="font-weight: 400;">Marketing Materials</a></li>
    			<li><div class="divider"></div></li>
    			<li id="reports"><a href="#!" class="nav-item" style="font-weight: 400;">Reports</a></li>
       			<c:if test="${not empty SessionDataHolder['customReports']}">
					<c:forEach items="${SessionDataHolder['customReports']}" var="customReport">
						<li id="reports"><a id="reports"class="nav-item" href="/customReport/${customReport.reportType}/${customReport.id}">${customReport.name}</a></li>
					</c:forEach>
       			</c:if>
       			<li><div class="divider"></div></li>
        		<li id="editProfile"><a href="/editProfile" class="nav-item" style="font-weight: 400;">Edit Profile</a></li>
       			<li><a id="logoutButton" href="/logout" class="nav-item" style="font-weight: 400;">Logout</a></li>
	    	</ul>
	    	
	    	<!-- Reports Dropdown -->
    		<ul id="dropdown1" class="dropdown-content" data-constrainwidth="false">
       			<c:if test="${not empty SessionDataHolder['customReports']}">
					<c:forEach items="${SessionDataHolder['customReports']}" var="customReport">
						<li><a class="nav-item" href="/customReport/${customReport.reportType}/${customReport.id}">${customReport.name}</a></li>
					</c:forEach>
       			</c:if>
       		</ul>
       		
       		<ul id="profileDropdown" class="dropdown-content" data-constrainwidth="false">
       			<li><a id="profileButton" href="/editProfile" class="nav-item" style="font-weight: 400;">Edit Profile</a></li>
       			<li><a id="logoutButton" href="/logout" class="nav-item" style="font-weight: 400;">Logout</a></li>
       		</ul>
		</div>
	</nav>
</div>

<script>
	$(document).ready(function() {
		$(".dropdown-button").dropdown();
	});
</script>

