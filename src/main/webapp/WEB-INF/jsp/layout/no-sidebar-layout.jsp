<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
    <tiles:insertAttribute name="page_head" />
</head>
<body class="no-skin">
    <tiles:importAttribute name="currentPage" scope="session" ignore="true" />
    <tiles:importAttribute name="currentModule" scope="session" ignore="true" />
    <tiles:insertAttribute name="header" ignore="false" />
    <div class="main-container " id="main-container">
        <tiles:insertAttribute name="body" ignore="false" />
    </div>
    <tiles:insertAttribute name="footer" />
</body>
</html>