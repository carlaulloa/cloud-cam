

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<jsp:include page="partials/header.jsp" />

<section>
		

	<div  class="container">
		<h1>CloudCam</h1>
		<br/>
		<br/>
		
		<div>
			Tema <input type='text' id='topic' disabled /> 
		</div>
		
		<div id ="captura" class="captura">
			<img class="foto" id="imgCaptura" alt="x" src="">
		</div>
		<div id="botonera">
		<ul>
			<li><div id="izq">Izquierda</div></li>
			<li><div id="der">Derecha</div></li>
		</ul>							
		</div>
		<ul id='ws' style="font-family: 'Courier New', Courier, monospace;"></ul>
	</div>
   
    <div class="container">
  
    <div id="fecha">
      
      <ul>
        <li id="hora"></li>
        <li id="min"></li>
        <li id="seg"></li>
      </ul>
      <p align="center" id="fecha_dias"></p>
    </div><!--fecha-->
</div>
    
</section>



<script src="<c:url value="/resources/js/jQuery-2.1.4.min.js"/>"></script>
<script src="<c:url value="/resources/js/config.js"/>"></script>
<script src="<c:url value="/resources/js/mqttws31.js"/>"></script>

<script type="text/javascript">



	
	// Create a client instance
	var id = "web_" + parseInt(Math.random() * 100, 10)
	client = new Paho.MQTT.Client(host, port, id);
	//Example client = new Paho.MQTT.Client("m11.cloudmqtt.com", 32903, "web_" + parseInt(Math.random() * 100, 10));

	// set callback handlers
	client.onConnectionLost = onConnectionLost;
	client.onMessageArrived = onMessageArrived;
	var options = {
		useSSL : true,
		userName : "web",
		password : "web",
		onSuccess : onConnect,
		onFailure : doFail
	}

	// connect the client
	client.connect(options);

	// called when the client connects
	function onConnect() {
		//	 $('#status').val('Connected to ' + host + ':' + port + path);
		// Once a connection has been made, make a subscription and send a message.
		console.log("onConnect");
		client.subscribe("testeo");
		$('#topic').val(topic);
		var data = {type:2,detail:"Conectado"};
		message = new Paho.MQTT.Message(JSON.stringify(data));
		message.destinationName = "testeo";
		client.send(message);
	}

	function doFail(e) {
		console.log(e);
	}

	function onConnectionLost(responseObject) {
		if (responseObject.errorCode !== 0) {
			console.log("onConnectionLost:" + responseObject.errorMessage);
		}
	}

/*
 * obj : id, detail, type , value 
 
 */
	
	function onMessageArrived(message) {
		console.log("onMessageArrived:" + message.payloadString);
		var topic = message.destinationName;
		var payload = message.payloadString;
		var obj = JSON.parse(payload);
		// imagen
		if (obj.type == 1) {
			// actualizar imagen 
			
			var img = $('<img id = "dynamic" >');
			img.attr('src', 'data:image/jpg;base64,' + obj.value);
			$('#captura').empty();
			$('#captura').append(img);
			
			//enviar para guardar
		//	requestSaveAJAX(obj);
			//var div = document.getElementById('captura')

		} 

		$('#ws').prepend('<li>' + topic + ' = ' + obj.type + " " + obj.detail + '</li>');
	}


	// metodos para enviar mensjes de mover servo
	$("#izq").click(function() {
		 // alert( "Handler for .click() called." );
		var data = {type:3,value:"izq"};
		message = new Paho.MQTT.Message(JSON.stringify(data));
		message.destinationName = "testeo";
		client.send(message);
	});

	$("#der").click(function() {
		 // alert( "Handler for .click() called." );
		var data = {type:3,value:"der"};
		message = new Paho.MQTT.Message(JSON.stringify(data));
		message.destinationName = "testeo";
		client.send(message);
	});

	function sendMQTTMoveServo(){
		var data = {type:2,value:"izq"};
		message = new Paho.MQTT.Message("Holi CloudMQTT");
		message.destinationName = "testeo";
		client.send(message);
	}
	
	function requestSaveAJAX(datos) {
		$.ajax({
			type : "POST",
			// .../web-security/admin_config/{}
			// u obtener el contexto + update_selector_nivel2
			url : "save",
			data : JSON.stringify(datos),
			contentType : 'application/json; charset=utf-8',
			dataType : "json",
			success : function(response) {
				console.log("Imagen guardada " + response.texto);
			},
			error : function(e) {
				console.log('Error: ' + e);
			}
		});
	}
</script>

<script>

function reloj(){ 
  //variables
  var fecha = new Date();
  var hora = fecha.getHours();
  var min = fecha.getMinutes();
  var seg = fecha.getSeconds();
  var year = fecha.getFullYear();
  var mes = fecha.getMonth();
  var day = fecha.getDay();
  var day_n = fecha.getDate();
  //array
  var dias = ["Domingo","Lunes","Martes","Miércoles", "Jueves","Viernes","Sábado"];
  var meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre", "Noviembre","Diciembre"];
  //agregar un 0 si los numeros son menores a 10, para que se muerte 01,02,03 etc
  if(hora<10){hora = '0' + hora;}
  if(min<10){min = '0' + min; }
  if(seg<10){seg = '0' + seg; }
  //escribe innerHTML
  document.getElementById("fecha_dias").innerHTML = dias[day] +", " +day_n+ " de "+meses[mes]+" del "+year ;
  document.getElementById("hora").innerHTML = hora;
  document.getElementById("min").innerHTML = min;
  document.getElementById("seg").innerHTML = seg;
}//reloj
setInterval(reloj, 1000);//refresca el reloj cada 1 seg

</script>

</html>