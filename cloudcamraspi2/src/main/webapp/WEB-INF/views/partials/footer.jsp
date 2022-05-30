<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="page-footer  grey darken-4">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Proyecto</h5>
                <p class="grey-text text-lighten-4">
                    Este proyecto consiste en tomar datos del Banco Mundial, crear una aplicacion en GAE
                    y una base de datos en DataNucleus como parte del curso de Sistemas Distribuidos 
                    en la EAP de Ingeniría de Sistemas de la 
                    Universidad Nacional Mayor de San Marcos.
                    <%--We are a team of college students working on this project like it's our full time job. Any amount would help support and continue development on this project and is greatly appreciated.--%>
                </p>


            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Grupo 3</h5>
                <ul>
                    <li><a class="white-text" href="https://www.facebook.com/krlaulloa" target="_blank" rel="author">Carla Contreras</a></li>
                    <li><a class="white-text" href="https://www.facebook.com/urbinatolentino" target="_blank" rel="author">Jhonatan Urbina</a></li>
                    <li><a class="white-text" href="https://www.facebook.com/favio.vasquez.casana" target="_blank" rel="author">Favio Vasquez</a></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <h5 class="white-text">Otros enlaces</h5>
                <ul>
                    <li><a class="white-text" href="http://jguerra91.wix.com/sistdistfisi" target="_blank">Sistemas distribuidos 2016-2</a></li>
                    <li><a class="white-text" href="http://www.bancomundial.org" target="_blank">Banco Mundial</a></li>
                    <li><a class="white-text" href="http://datatopics.worldbank.org/hnp/" target="_blank">Banco Mundial Estadisticas</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            Facultad de Ingeniería de Sistemas e Informática 2016-2
        </div>
    </div>
</footer>


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="<c:url value="static/vendors/materialize/js/materialize.min.js"/>"></script>
 <script src="<c:url value="static/js/app.js"/>"></script>

</body>
</html>

