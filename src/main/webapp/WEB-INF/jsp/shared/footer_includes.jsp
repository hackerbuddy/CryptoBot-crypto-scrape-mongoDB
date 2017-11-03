<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:eval expression="@applicationProperties['application.version']" var="applicationVersion"/>
<spring:url value="/web-resources-{applicationVersion}" var="resourceUrl">
    <spring:param name="applicationVersion" value="${applicationVersion}"/>
</spring:url>

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='wrap/assets/js/jquery.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='wrap/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='wrap/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${resourceUrl}/ace/assets/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->
<script src="${resourceUrl}/ace/assets/js/jquery.colorbox.js"></script>
<script src="${resourceUrl}/ace/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="${resourceUrl}/ace/assets/js/dataTables/jquery.dataTables.bootstrap.js"></script>
<script src="${resourceUrl}/ace/assets/js/dataTables/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script src="${resourceUrl}/ace/assets/js/dataTables/extensions/ColVis/js/dataTables.colVis.js"></script>

<!--[if lte IE 8]>
  <script src="${resourceUrl}/ace/assets/js/excanvas.js"></script>
<![endif]-->
<script src="${resourceUrl}/ace/assets/js/jquery-ui.custom.js"></script>
<script src="${resourceUrl}/ace/assets/js/jquery.ui.touch-punch.js"></script>
<script src="${resourceUrl}/ace/assets/js/bootbox.js"></script>
<script src="${resourceUrl}/ace/assets/js/jquery.easypiechart.js"></script>
<script src="${resourceUrl}/ace/assets/js/jquery.sparkline.js"></script>
<script src="${resourceUrl}/ace/assets/js/flot/jquery.flot.js"></script>
<script src="${resourceUrl}/ace/assets/js/flot/jquery.flot.pie.js"></script>
<script src="${resourceUrl}/ace/assets/js/flot/jquery.flot.resize.js"></script>
<script src="${resourceUrl}/ace/assets/js/jquery.gritter.js"></script>
<script src="${resourceUrl}/ace/assets/js/chosen.jquery.min.js"></script>
<script src="${resourceUrl}/ace/assets/js/jquery.maskedinput.js"></script>

<!-- ace scripts -->
<script src="${resourceUrl}/ace/assets/js/ace/elements.scroller.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.colorpicker.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.fileinput.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.typeahead.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.spinner.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.treeview.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.wizard.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/elements.aside.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.ajax-content.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.touch-drag.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.sidebar.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.sidebar-scroll-1.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.submenu-hover.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.widget-box.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.settings.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.settings-rtl.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.settings-skin.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.widget-on-reload.js"></script>
<script src="${resourceUrl}/ace/assets/js/ace/ace.searchbox-autocomplete.js"></script>

<!-- additional scripts -->
<script src="${resourceUrl}/validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${resourceUrl}/validation/js/additional-methods.js" type="text/javascript"></script>
<script src="${resourceUrl}/payment/js/jquery.payment.js" type="text/javascript"></script>
<script src="${resourceUrl}/jquery-idletimer/js/idle-timer.min.js" type="text/javascript"></script>
<script src="${resourceUrl}/jSignature/js/jSignature.min.js" type="text/javascript"></script>
<%-- <script src="${resourceUrl}/datatables/js/jquery.dataTables.min.js" type="text/javascript"></script> --%>
<%-- <script src="${resourceUrl}/datatables/js/fnReloadAjax.js" type="text/javascript"></script> --%>
<script src="${resourceUrl}/ckeditor/ckeditor.js" type="text/javascript" ></script>
<script src="${resourceUrl}/ugafinance/js/scripts.js" type="text/javascript"></script>
