<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link class="include" rel="stylesheet" type="text/css" href="./resources/js/jquery.jqplot.min.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqplot.min.js"></script>
<script language="javascript" type="text/javascript" src="./resources/js/plugins/jqplot.pieRenderer.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
      from = $( "#from" ).datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2,
          dateFormat : "yymmdd"
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2,
        dateFormat : "yymmdd"
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });

    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( "yymmdd", element.value );
      } catch( error ) {
        date = null;
      }
      return date;
    }
  } );
  </script>
</head>
<body>
	<div>
		<label for="from">From</label>
		<input type="text" id="from" name="from">
		<label for="to">to</label>
		<input type="text" id="to" name="to">
		<button onclick="goSubmit(from, to);">전송.!!!!</button>
	</div>
	
	
	<div id="chart1" style="height:300px; width:500px;"></div>
	<script type="text/javascript">
		function goSubmit(from, to){
			from = $('#from').val();
			to = $('#to').val();
			
			var url="/adChartCount.do";
	        var array = [];
	        var params="?fromDate="+from+"&toDate="+to;
	        $.ajax({
	            async: false,
	            url: url,
	            dataType:'json',
	            data : 
				{
	            	fromDate : from,	
	            	toDate : to	
				},
	            success: function(data) {
	            	
	            	const ordered = {};
	            	Object.keys(data).sort().forEach(function(key) {
	            	  ordered[key] = data[key];
	            	});
	            	$.each(ordered, function(key, value){
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
		}
		
	</script>
</body>
</html>