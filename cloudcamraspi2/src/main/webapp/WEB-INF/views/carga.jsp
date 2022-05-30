<%@ taglib uri="http://www.springframework.org/tags" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carga de datos</title>
</head>
<body>
	<h1>Carga de Datos</h1>

	<c:url value="/ejecutarCargaSimple" var="cargaSimple"></c:url>
	<c:url value="/ejecutarCargaRel" var="cargaRel"></c:url>
	
	<form action="${cargaSimple}" method="get">
		<label>1. Cargar Series, Countries, Years</label> 
		<input type="submit" value="Cargar">
	</form>
	
	<br> <p>${salida}</p> <br>
	
	<s:if test="${primeraCarga == 1}" >
		<form action="${cargaRel}" method="get">
			<label>2. Cargar Data. </label> 
			<input type="submit" id="parte1" name = "parte1" value="Parte 1">
			<input type="submit" id="parte2" name = "parte2" value="Parte 2"> 
			<input type="submit" id="parte3" name = "parte3" value="Parte 3"> 
			<input type="submit" id="parte4" name = "parte4" value="Parte 4">			
		</form>
		<br><p>${salida2}</p>
	</s:if>

</body>
</html>