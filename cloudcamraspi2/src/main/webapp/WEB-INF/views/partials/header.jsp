<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="Despliegue de un aplicación web en la nube de openshift.">
   <!--  <link rel="icon" href="<c:url value="/static/images/icon.png"/>"> -->
    <title>UNMSM | Sistemas Distribuidos</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="<c:url value="/static/vendors/materialize/css/materialize.min.css"/>" type="text/css" rel="stylesheet"
          media="screen,projection"/>
    <link href="<c:url value="/static/css/app.css"/>" type="text/css" rel="stylesheet" media="screen,projection"/>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700);
ul, li, h1{
  margin: 0;
  padding: 0;
}

.container ul {
  display: flex;
  align-items: center;
  justify-content: center;
}

.container ul li {
  font-size: 2em;
  display: inline-block;
}

ul li:not(:last-child):after {
  content: ":";
  line-height: 2em;
  padding: 0 10px;
  font-size: 16px !important;
  color: black;
}

.container #botonera ul {
	list-style-type:none;
	margin:0;
	padding:0;
	display:flex;
	flex-direction: row;
}
.container #botonera ul li:not(:last-child):after {
  content: none;
  line-height: 0em;
  padding: 0 px;
  font-size: 16px !important;
  color: black;
}
.container #botonera ul li { flex-grow: 1;}
.container #botonera ul li div {
	display:block;
	padding:0.5em;
	background-color:LightGray ;
	text-align:center;
	margin-right:0.2em;
	text-decoration:none;
	color:#000000;
}
#botonera ul li div:hover {background-color:LightCoral; 
	cursor:pointer;
}

#fecha_dias {
  font-size: 1.2em;
}

</style>
</head>
<body>
<nav class=" grey darken-4" role="navigation">
    <div class="nav-wrapper container">
     <!--    <a id="logo-container" href="/" class="brand-logo">
            <img src="<c:url value="/static/images/logo.png"/>" alt="" height="64px">
        </a> -->
        <ul class="right hide-on-med-and-down">
            <li><a class="white-text" href="/">Inicio</a></li>
           <!--  <li><a class="white-text" href="/consultas">Consultas</a></li>-->
        </ul>

        <ul id="nav-mobile" class="side-nav blue-grey">
            <li>
                <a href="/" class="center">
                    <img src="<c:url value="/static/images/logo.png"/>" alt="" height="64px">
                </a>
            </li>
            <li><a class="white-text" href="/">Inicio</a></li>
           <!--  <li><a class="white-text" href="/consultas">Consultas</a></li> -->
        </ul>
        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons white-text">menu</i></a>
    </div>
</nav>