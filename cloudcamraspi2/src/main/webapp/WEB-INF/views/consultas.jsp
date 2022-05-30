<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="partials/header.jsp" />

<section>
	<c:url value="/consultar" var="consultar"></c:url>
	<div class="container">
		<h1 class="center grey-text text-darken-1">Consultas</h1>
		<form method="post" id="statistics-form" action="${consultar}">
			<div class="row">
				<div class="col s12">
					<div class="row">
						<div class="input-field col s12 m4 l4">
							<select name="countries" id="countries-select" required>
								<option value="todos" selected>Todos</option>
								<c:forEach var="country" items="${lsPaises}">
									<option value="${country.countryCode}" />${country.shortName}</option>
								</c:forEach>
							</select> <label>Países</label>
						</div>
						<div class=" input-field col s12 m4 l5">
							<select name="series" id="serie-select" required>
								<option value="todos" selected disabled>Seleccionar</option>
								<c:forEach var="serie" items="${lsConsultas}">
									<option value="${serie.seriesCode}">${serie.indicatorName}</option>
								</c:forEach>
								<option value="SH.DYN.AIDS">Personas mayores de 15
									años, viviendo con VIH</option>

							</select> <label>Tipos</label>
						</div>
						<div class="input-field col s12 m4 l3" required>
							<select name="anios" id="anio-select">
								<option value="todos" selected>Todos</option>
								<c:forEach var="anio" items="${lsAnios}">
									<option value="${anio.codAnio}">${anio.descAnio}</option>
								</c:forEach>
							</select> <label>Años</label>
						</div>
						<div class="input-field col s12 m4 l3"></div>
						<div class="input-field col s12 m4 l3"></div>
						<div class="input-field col s12 m4 l3"></div>
						<!-- <div class="input-field col s12 m4 l3">
							<button id="form-button" name="grafica"
								class="btn yellow darken-2 waves-effect waves-orange"
								type="submit">Ver gráfico</button>
						</div> -->
						<div class="input-field col s12 m4 l3">
							<button id="form-button" name="reporte"
								class="btn yellow darken-2 waves-effect waves-orange"
								type="submit">Ver</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<c:if test="${mostrarSelected == 1}">
			<div class = "row">
				<ul>
					<li>Año: ${anioSelected}</li>
					<li>Pais: ${countryNameSelected}</li>
					<li>Consulta: ${serieNameSelected}</li>
				</ul>
			</div>
		</c:if>
		<div class="row">
			<div class="col s12">
				<ul class="tabs grey lighten-3">
					<li class="tab col s12 m6"><a href="#stat-chart"
						class="blue-grey-text text-darken-2 active">Gráfico de barras</a></li>
					<li class="tab col s12 m6"><a
						class="blue-grey-text text-darken-2" href="#stat-table">Tabla
							de datos</a></li>
				</ul>
			</div>
			<div id="stat-chart" class="col s12">
				<div id="chart-content-material"
					style="width: 1000px; height: 500px;"></div>

			</div>
			<div id="stat-table" class="col s12">
				<!-- <div id="chart-content-material"
					style="width: 900px; height: 500px;">-->
				<table class="striped">
					<thead>
						<tr>
							<th data-field="anio">Año</th>
							<th data-field="pais">Pais</th>
							<th data-field="valor">Valor</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="data" items="${lsData}">
							<tr>
								<td>${data.yearBO.codAnio}</td>
								<td>${data.countryBO.shortName}</td>
								<td>${data.value}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- </div> -->
			</div>
		</div>
	</div>

</section>

<script type="text/javascript"
	src="<c:url value="/static/vendors/underscore/underscore-min.js" />"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/google-chart.js" />"></script>


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'barchart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {
		var data = null;
		
		if("${countrySelected}" == "todos" && "${yearSelected}" == "todos"){
			data = google.visualization.arrayToDataTable([
			                                                  ['Country','2005','2006','2007'],
			                                                  <c:forEach items = "${chartData}" var = "row">
			                                                  ['${row[0]}',${row[1]},${row[2]},${row[3]}],
			                                                  </c:forEach>
			               
			                                                ]);
		}else{
			if("${countrySelected}" == "todos"){
				data = google.visualization.arrayToDataTable([
				                                                  	['Country', 'Valor'],
				                                                  	<c:forEach items="${lsData}" var="data">
				                          								[ '${data.countryBO.shortName}', ${data.value} ],
				                          							</c:forEach>
				                                                ]);
			}else{
				if("${yearSelected}" == "todos"){
					data = google.visualization.arrayToDataTable([
				                                                  	['Anio', 'Valor'],
				                                                  	<c:forEach items="${lsData}" var="data">
				                          								[ '${data.yearBO.codAnio}', ${data.value} ],
				                          							</c:forEach>
				                                                ]);
				}else{
					data = google.visualization.arrayToDataTable([
				                                                  	['Country', 'Valor'],
				                                                  	<c:forEach items="${lsData}" var="data">
				                          								[ '${data.countryBO.shortName}', ${data.value} ],
				                          							</c:forEach>
				                                                ]);
				}
			}
		}
		
		// Create the data table.	
		/*var data = google.visualization.arrayToDataTable([
		                                                  	['Country', 'Valor'],
		                                                  	<c:forEach items="${lsData}" var="data">
		                          								[ '${data.countryBO.shortName}', ${data.value} ],
		                          							</c:forEach>
		                                                ]);*/
		// Set chart options
		var options = {
			'title' : 'Valores',
			tooltip :  {showColorCode: true},
			'width' : 900,
			'height' : 500
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.BarChart(document.getElementById('chart-content-material'));
		chart.draw(data, options);
	}
</script>
<jsp:include page="partials/footer.jsp" />



<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultas</title>
</head>
<body>
	<h1>CONSULTAS :C</h1>
	
</body>
</html>--%>