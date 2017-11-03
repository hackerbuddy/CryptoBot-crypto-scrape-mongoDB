<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<spring:eval expression="@applicationProperties['application.version']" var="applicationVersion" />
<spring:eval expression="@environmentProperties['websitebuilder.common_assets_base_url']" var="commonAssetsBaseUrl" />

<spring:url value="/web-resources-{applicationVersion}" var="resourceUrl">
    <spring:param name="applicationVersion" value="${applicationVersion}" />
</spring:url>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<link href='//fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>


<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/bootstrap.css" />
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/font-awesome.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/colorbox.css" />
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/jquery-ui.custom.css" />
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/jquery.gritter.css" />
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/chosen.min.css" />

<!-- text fonts -->
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${resourceUrl}/ace/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
            <link rel="stylesheet" href="${resourceUrl}/ace/assets/css/ace-part2.css" class="ace-main-stylesheet" />
        <![endif]-->

<!--[if lte IE 9]>
          <link rel="stylesheet" href="${resourceUrl}/ace/assets/css/ace-ie.css" />
        <![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="${resourceUrl}/ace/assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="${resourceUrl}/ace/assets/js/html5shiv.js"></script>
<script src="${resourceUrl}/ace/assets/js/respond.js"></script>
<![endif]-->

<link href="${resourceUrl}/ugafinance/css/styles.css" type="text/css" rel="stylesheet">
<script src="${resourceUrl}/jquery/js/jquery.min.js"></script>

<c:set var="favIconUrl" value="${resourceUrl}/ugafinance/ico/favicon.png" />
<link rel="shortcut icon" href="${favIconUrl}">
