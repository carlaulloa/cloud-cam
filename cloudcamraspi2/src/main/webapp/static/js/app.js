(function($){
    $(function(){

        // materialize config
        $('.button-collapse').sideNav();
        $('.parallax').parallax();
        $('select').material_select();

/*
        var data = null;  // Data


        // statistic request        
        $("#statistics-form").on("submit", function (event) {
            console.info("Enviar");

            var request = $.ajax({
                url: '/consultas',
                method: 'POST',
                contentType: "application/json",
                data: JSON.stringify({
                    serie: $('#serie-select').val(),
                    countries: $('#countries-select').val()
                })
            });

            request.success(function (response) {
                var stats = response['stats'];
                data = response['stats'];
                //console.log("success");
                drawChartOnTab(data);  // draw chart or table
            });
            
            request.fail(function (data) {
                console.log("No data F");
            });

            event.preventDefault();
        });


        // events
        $(".tabs").on('click', function () {
            drawChartOnTab(data);
        });

        $('#country-select').on('change', function () {
            drawChartTable(data, this.value);
        });

        $('#serie-select').on('change', function () {
            $("#statistics-form").trigger('submit');
        });


        // draw on chart or table
        function drawChartOnTab(data){  // draw in the current active tab
            if(data !== null){
                resizeContent();  // adjust size: chart content and table content
                var href = $(".tabs").find("a.active").attr("href");
                if(href === '#stat-chart'){
                    drawChartBar(data);  // bar
                }else if(href === '#stat-table'){
                    drawChartTable(data);  // table
                }
            }
        }
*/
        function resizeContent() {
            var width = conatainer.outerWidth();
            $('#chart-content-material').css({'width':width, 'height':_.min([670,(width-140)*(4/5)])});
            $('#table-content-material').css({'width':width, 'height':350});
        }

/*
        function drawChartBar(data) {
            if(data !== null){
                var countries =_.union(['Años'], _.unique(_.pluck(data, 'countryName'))); // first row

                data = _.groupBy(data, function(item){return item.anio; });  // group by year

                var stats_keys = _.keys(data);  // key's stats

                var chart_data = [];  // all data

                chart_data.push(countries);  // add first row
                stats_keys.forEach(function (item) {
                    var row = [item];
                    row = row.concat(_.pluck(data[item], 'value'));

                    chart_data.push(row);
                });

                // google chart
                google.charts.setOnLoadCallback(function () {
                    var dataTable = google.visualization.arrayToDataTable(chart_data);
                    var chart = new google.charts.Bar(document.getElementById('chart-content-material'));

                    chart.draw(dataTable);
                });
            }
        }

        function drawChartTable(data, year) {
            year = year || $('#country-select').val();
            if(data !== null){

                data = _.filter(data, function (item) {
                    return item['anio'] == year;
                } );

                data =_.map(data, function (item) {
                    return _.values( _.omit(item,'countryCode','serieCode','serieName') );
                });


                // google chart
                google.charts.setOnLoadCallback(function () {
                    var dataTable = new google.visualization.DataTable();
                    dataTable.addColumn('string', 'País');
                    dataTable.addColumn('number', 'Año');
                    dataTable.addColumn('number', 'Valor');
                    dataTable.addRows(data);

                    var table = new google.visualization.Table(document.getElementById('table-content-material'));

                    table.draw(dataTable, {showRowNumber: true, width: '100%', height: '100%'});
                });
            }
        }


        // container
        var conatainer = $('.container');


        // when resize ...
        var last = undefined;
        var delta = 1750;

        $(window).resize(function() {
            var now = new Date().getTime();
            last = last || now;

            if(now - last > delta){
                last = undefined;
            }else if(last === now){
                setTimeout(function () {
                   drawChartOnTab(data);  // draw chart or table
                }, delta);
            }

        });
*/


    }); // end of document ready
})(jQuery); // end of jQuery name space