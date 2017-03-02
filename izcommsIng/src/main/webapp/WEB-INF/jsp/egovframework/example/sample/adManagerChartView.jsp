<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link class="include" rel="stylesheet" type="text/css" href="./resources/js/jquery.jqplot.min.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqplot.min.js"></script>
<script language="javascript" type="text/javascript" src="./resources/js/plugins/jqplot.pieRenderer.min.js"></script>
</head>
<body>
	<div id="chart1" style="height:300px; width:500px;"></div>
	<script type="text/javascript">

$(document).ready(function(){

        var url="/adChartCount.do";
        var array = [];
        $.ajax({
            async: false,
            url: url,
            dataType:'json',
            success: function(data) {
            	$.each(data, function(key, value){
					array.push([key, value]);
   				});
            }
        });


    plo1 = $.jqplot('chart1', [array],{
        title: 'AJAX JSON Data Renderer',
        seriesDefaults: {
            renderer: jQuery.jqplot.PieRenderer,
            rendererOptions: {
                showDataLabels: true
            }
        },
        legend: { show: true, location: 'e' }
    });
});


</script>
</body>
</html>