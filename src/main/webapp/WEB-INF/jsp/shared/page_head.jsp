<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<meta name="description" content="Loan origination and management platform">
<meta name="author" content="UGA Finance" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Partner Portal</title>

<link rel="stylesheet" href="/web-resources/materialize/css/materialize.css"/>
<link rel="stylesheet" href="/web-resources/material-design/MaterialDesign-Webfont-master/css/materialdesignicons.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type="text/css">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/af-2.1.3/cr-1.3.2/r-2.1.1/datatables.min.css"/>

<style>	
	html, body, h1, h2, h3, h4, h5, h6, p, div{
		font-family: "Roboto";
	}
	
	html, container{
		height: 100%;
	}
	
	body{
		background-color: #9e9e9e;
		height: 100%;
	}
	
	.main-div{
		background-color: #eeeeee;
		padding: 10px;
		margin-top: 50px;
		min-height: 500px;
	}
	
	
	.input-field label{
		color: #ffffff;
		font-weight: 300;
	}
	
	
	
	input[type=text]{
		color: #000000;
		border-bottom: 1px solid #e0e0e0;
	}
	
	input[type=search]{
		color: #444;
		font-weight: 300;
	}
	
	
	/*state selector CSS */
	.select-wrapper input.select-dropdown{
		color: #000000;
		font-weight: 300;
		border-bottom: 1px solid #e0e0e0;
	}
	
	.dataTables_filter{
		margin-right: 15px;
	}
	
	#nav-wrapper{
		color: #000000;
		font-size: 35px;
		font-weight: 400;
		padding-top: 10px;
		padding-bottom: 10px;
		min-height:140%;
		margin-left: auto;
		margin-right: auto;
		box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2);
	}
	
	#logo-login{
		max-height: 81.25px;
		max-width: 262.5px;
	}
	
	#logo-navbar{
		max-height: 65px;
		max-width: 210px;
		margin-left:30px;
	}
	
	/* for objects with ID of login-container */
	#login-container{
		height: 100%;
		background-color: #9e9e9e;
		padding-left: 10px;
		padding-right: 10px;
		margin-top: 30px;
	}
	
	/*everything except the footer*/
	#non-footer{
		min-height: 100%;
		width: 100%;
		position:relative;
		/* Firefox */
		min-height: -moz-calc(100% - 30px);
		/* WebKit */
		min-height: -webkit-calc(100% - 30px);
		/* Opera */
		min-height: -o-calc(100% - 30px);
		/* Standard */
		min-height: calc(100% - 30px);
	}
	
	#footer{
		height:30px;
		margin: 0;
		clear: both;
		width:100%;
		position: relative;
	}
	
	/*make invalid fields red*/
	div.error, select.error, textarea.error, input.error {
		font-weight: 400;
    	color:#e53935;
	}
	
	/*make select options have black text*/
	option{
		color: #000000;
	}
	
	/*focus underline*/
	.input-field input[type=text]:focus {
     	border-bottom: 1px solid #333333;
     	box-shadow: 0 0px 0 0 #000;
   	}
   	
   	/*label focus color*/
   	.input-field input[type=text]:focus + label {
   		border-bottom: 0px solid #333333;
    	color: #333333;
   	}
   	
   	.input-field textarea[class=materialize-textarea]{
   		color: #333333;
   		border-bottom: 1px solid #e0e0e0;
   	}
   	
   	/*focus underline textareas*/
   	.input-field textarea[class=materialize-textarea]:focus {
   		color: #e0e0e0;
   		font-weight: 300;
		border-bottom: 2px solid #333333;
		box-shadow: 0 0px 0 0 #000;
	}
	
	/*focus underline textarea "on-success"*/
	.input-field textarea[class="has-success"]:focus {
		border-bottom: 2px solid #666666;
		box-shadow: 0 0px 0 0 #000;
	}
	
	/*focus textarea label color*/
	.input-field textarea[class=materialize-textarea]:focus + label{
/* 		border-bottom: 0px solid #f57c00; */
/*     	color: #f57c00;  Old PP orange color*/
	}
   	
   	/*form select option text coloring*/
   	ul.dropdown-content.select-dropdown li span {
    	color: #000; /* no need for !important :) */
	}
   	
   	/*focus underline*/
   	.input-field input[type=password]:focus{
     	border-bottom: 1px solid #222222;
		box-shadow: 0 0px 0 0 #000;
		color: #333333;
   	}
   	
   	/*label focus color*/
   	.input-field input[type=password]:focus + label {
    	color: #333333;
   	}
   	
   	.input-field .prefix.active {s
    	color: #f57c00;
   	} 	
   	
   	.standard-font{
   		font-size: 14px !important;
   		font-weight: 300 !important;
   	}
   	
   	.static-field{
   		border-bottom: 1px solid #ffffff !important; 
   		color: black !important;
   	}
   	
   	.row-prefix-icon{
   		color: black !important; 
   		margin-top: 30px !important; 
   		margin-left: 5px !important;
   		font-size: 30px !important;
   	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>