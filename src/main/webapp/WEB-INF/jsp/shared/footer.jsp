<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div style="text-align: center; width: 100%; margin-top: 20px;">
	<span>&copy; UAS ${currentYear}</span>
	<hr style="margin-top: -.75em; margin-bottom: -1.33em; border-width: 0px;" />
	<small style="color: grey; text-align: center;">${version}</small>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        $.ajaxSetup({
            cache : false
        });
        
        $('.button-collapse').sideNav();
        $('.dropdown-button').dropdown({
            inDuration: 300,
            outDuration: 225,
            constrainWidth: false, // Does not change width of dropdown to that of the activator
            hover: true, // Activate on hover
            gutter: 0, // Spacing from edge
            belowOrigin: true, // Displays dropdown below the button
            alignment: 'left', // Displays dropdown with edge aligned to the left of button
            stopPropagation: false // Stops event propagation
          }
        );
        
        
        
        //Nav Button Highlighting :)
        var homeButton = document.getElementById("homeButton");
    	var addLeadButton = document.getElementById("addLeadButton");
        var MarketingMaterial = document.getElementById("marketingMaterial");
        var Reports = document.getElementById("reports");
        var EditProfile = document.getElementById("editProfile");
        var page = window.location.href;
        
        	//set attributes here
        	var colorActive = "#ffffff";
        	var colorInactive = "#000000";
        	var weightActive = "400";
        	var weightInactive = "300";
        

        	if(page.includes("home")){
        		homeButton.className += " active";
            	homeButton.className += " z-depth-3";
            	homeButton.getElementsByTagName("A")[0].style.color = colorActive;
            	homeButton.getElementsByTagName("A")[0].style.fontWeight = weightActive;
            
       		}else if($("homeButton").hasClass("active")){
        		homeButton.removeClass("active");
        		homeButton.getElementsByTagName("A")[0].style.color = colorInactive;
        		homeButton.getElementsByTagName("A")[0].style.fontWeight = weightInactive;
        	}
        
        	if(page.includes("addLead")){
        		addLeadButton.className += " active";
        		addLeadButton.className += " z-depth-3";
        		addLeadButton.getElementsByTagName("A")[0].style.color = colorActive;
        		addLeadButton.getElementsByTagName("A")[0].style.fontWeight = weightActive;
        	
        	}else if($("addLeadButton").hasClass("active")){
        		addLeadButton.removeClass("active");
        		addLeadButton.getElementsByTagName("A")[0].style.color = colorInactive;
        		addLeadButton.getElementsByTagName("A")[0].style.fontWeight = weightInactive;
        	}
        
        	if(page.includes("marketingMaterial")){
        		MarketingMaterial.className += " active";
        		MarketingMaterial.className += " z-depth-3";
        		MarketingMaterial.getElementsByTagName("A")[0].style.color = colorActive;
        		MarketingMaterial.getElementsByTagName("A")[0].style.fontWeight = weightActive;
        	
        	}else if($("MarketingMaterial").hasClass("active")){
        		MarketingMaterial.removeClass("active");
        		MarketingMaterial.getElementsByTagName("A")[0].style.color = colorInactive;
        		MarketingMaterial.getElementsByTagName("A")[0].style.fontWeight = weightInactive;
        	}
        	
        	if(page.includes("customReport/")){
        		Reports.className += " active";
        		Reports.className += " z-depth-3";
        		Reports.getElementsByTagName("A")[0].style.color = colorActive;
        		Reports.getElementsByTagName("A")[0].style.fontWeight = weightActive;
        		
        	}else if($("reports").hasClass("active")){
        		Reports.removeClass("active");
        		Reports.getElementsByTagName("A")[0].style.color = colorInactive;
        		Reports.getElementsByTagName("A")[0].style.fontWeight = weightInactive;
        	}
        	
        	if(page.includes("editProfile")){
        		EditProfile.className += " active";
        		EditProfile.className += " z-depth-3";
        		EditProfile.getElementsByTagName("A")[0].style.color = colorActive;
        		EditProfile.getElementsByTagName("A")[0].style.fontWeight = weightActive;
        		
        	}else if($("EditProfile").hasClass("active")){
        		EditProfile.removeClass("active");
        		EditProfile.getElementsByTagName("A")[0].style.color = colorInactive;
        		EditProfile.getElementsByTagName("A")[0].style.fontWeight = weightInactive;
        	}
        
        
        
        
        
        

    });
</script>

<!-- Materialize -->
<script src="/web-resources/materialize/js/materialize.js"></script>
<script src="/web-resources/materialize/js/jquery.maskedinput.js" type="text/javascript"></script>

<!-- Local - Required for UI -->
<script src="/web-resources/uas/js/scripts.js" type="text/javascript"></script>
<script src="/web-resources/validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/web-resources/validation/js/additional-methods.js" type="text/javascript"></script>

<!-- DataTables -->
<!-- NOTE - uPortal360 is using 1.11.4 -->
<!-- NOTE - DataTables.Net suggests using - https://code.jquery.com/jquery-1.12.4.js, but that breaks our tables -->
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

