<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="applicationName" value="UGA Finance - Referral Agent Portal" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta name="description" content="UGA Finance - Referral Agent Portal">
<meta name="author" content="UGA Finance - Referral Agent Portal" />
<title><c:out value="${applicationName}" /> - <tiles:getAsString name="title" ignore="false" /></title>
<%@ include file="/WEB-INF/jsp/includes/header_includes.jsp"%>
</head>
<body class="no-skin">
    <tiles:insertAttribute name="header" ignore="false" />
    <div class="main-container container" id="main-container">
    <tiles:insertAttribute name="sidebar" ignore="false" />
    <tiles:insertAttribute name="body" ignore="false" />
    </div>
    <tiles:insertAttribute name="footer" ignore="false" />
    <%@ include file="/WEB-INF/jsp/includes/footer_includes.jsp"%>
<!--     <script> -->
//         $(document).ready(function() {
//             <c:forEach items="${SessionDataHolder['messages']}" var="message">
//                 $.gritter.add({
//                     title: "${message.formattedTitle}",
//                     text: "${message.formattedText}",
//                     class_name: <c:choose><c:when test="${message.type == 'success'}">'gritter-success'</c:when><c:otherwise>'gritter-error'</c:otherwise></c:choose>
//                 });
//             </c:forEach>
//             <c:if test="${fn:length(SessionDataHolder['messages']) > 0}">
//                 ${SessionDataHolder.clearMessages}
//             </c:if>
//         });
<!--     </script> -->
</body>
</html>

