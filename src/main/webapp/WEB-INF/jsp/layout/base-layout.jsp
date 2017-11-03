<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
    	<tiles:insertAttribute name="page_head" />
	</head>
	<body class="no-skin" >
		<div id="non-footer">
			<tiles:insertAttribute name="navbar" ignore="false" />
			<div class="container main-div z-depth-5">
    			<tiles:insertAttribute name="body" ignore="false" />
    		</div>   
    	</div>
    	<div id="footer">
    		<tiles:insertAttribute name="footer" />
    	</div> 
	</body>
</html>