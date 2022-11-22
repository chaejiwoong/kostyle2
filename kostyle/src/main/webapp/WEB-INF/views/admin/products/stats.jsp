<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/productModify.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<c:forEach items = "${stats}" var = "list">
	<c:set var= "total" value="${total + list.amount}"/>
	<c:set var = "scno" value ="${list.scno}"/>
	</c:forEach>
<!-- /////////////////////////////////////////////////// -->	
	<c:forEach items = "${stats2}" var = "list2">
	<c:set var= "total2" value="${total2 + list2.amount}"/>	
	</c:forEach>
	<!-- /////////////////////////////////////////////////// -->	
	<c:forEach items = "${stats3}" var = "list3">
	<c:set var= "total3" value="${total3 + list3.amount}"/>	
	</c:forEach>
	<!-- /////////////////////////////////////////////////// -->	
	<c:forEach items = "${stats4}" var = "list4">
	<c:set var= "total4" value="${total4 + list4.amount}"/>	
	</c:forEach>
	
	<c:forEach items = "${statsScno}" var = "scnoList1">
	<c:set var= "scno1" value="${scno1+scnoList1.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno2}" var = "scnoList2">
	<c:set var= "scno2" value="${scno2+scnoList2.amount}"/>	
	</c:forEach>
	 	<c:forEach items = "${statsScno3}" var = "scnoList3">
	<c:set var= "scno3" value="${scno3+scnoList3.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno4}" var = "scnoList4">
	<c:set var= "scno4" value="${scno4+scnoList4.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno5}" var = "scnoList5">
	<c:set var= "scno5" value="${scno5+scnoList5.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno6}" var = "scnoList6">
	<c:set var= "scno6" value="${scno6+scnoList6.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno7}" var = "scnoList7">
	<c:set var= "scno7" value="${scno7+scnoList7.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno8}" var = "scnoList8">
	<c:set var= "scno8" value="${scno8+scnoList8.amount}"/>	
	<c:forEach items = "${statsScno9}" var = "scnoList9">
	<c:set var= "scno9" value="${scno9+scnoList9.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno10}" var = "scnoList10">
	<c:set var= "scno10" value="${scno10+scnoList10.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno11}" var = "scnoList11">
	<c:set var= "scno11" value="${scno11+scnoList11.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno12}" var = "scnoList12">
	<c:set var= "scno12" value="${scno12+scnoList12.amount}"/>	
	</c:forEach> 
	</c:forEach> 
		<c:forEach items = "${statsScno13}" var = "scnoList13">
	<c:set var= "scno13" value="${scno13+scnoList13.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno14}" var = "scnoList14">
	<c:set var= "scno14" value="${scno14+scnoList14.amount}"/>	
	</c:forEach>
	 	<c:forEach items = "${statsScno15}" var = "scnoList15">
	<c:set var= "scno15" value="${scno15+scnoList15.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno16}" var = "scnoList16">
	<c:set var= "scno16" value="${scno16+scnoList16.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno17}" var = "scnoList17">
	<c:set var= "scno17" value="${scno17+scnoList17.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno18}" var = "scnoList18">
	<c:set var= "scno18" value="${scno18+scnoList18.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno19}" var = "scnoList19">
	<c:set var= "scno19" value="${scno19+scnoList19.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno20}" var = "scnoList20">
	<c:set var= "scno20" value="${scno20+scnoList20.amount}"/>	
	</c:forEach> 
		<c:forEach items = "${statsScno21}" var = "scnoList21">
	<c:set var= "scno21" value="${scno21+scnoList21.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno22}" var = "scnoList22">
	<c:set var= "scno22" value="${scno22+scnoList22.amount}"/>	
	</c:forEach>
	 	<c:forEach items = "${statsScno23}" var = "scnoList23">
	<c:set var= "scno32" value="${scno23+scnoList23.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno24}" var = "scnoList24">
	<c:set var= "scno24" value="${scno24+scnoList24.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno25}" var = "scnoList25">
	<c:set var= "scno25" value="${scno25+scnoList25.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno26}" var = "scnoList26">
	<c:set var= "scno26" value="${scno26+scnoList26.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno27}" var = "scnoList27">
	<c:set var= "scno27" value="${scno27+scnoList27.amount}"/>	
	</c:forEach>
		<c:forEach items = "${statsScno28}" var = "scnoList28">
	<c:set var= "scno28" value="${scno28+scnoLis28.amount}"/>	
	</c:forEach> 
	

	 <!--Div that will hold the pie chart-->
    <div id="chart_div" ></div>
    <div id="chart2_div" name = "chart2_div"></div>
	<div id="chart3_div" name = "chart3_div"></div>
	<div id="chart4_div" name = "chart4_div"></div>
	<div id="chart5_div" name = "chart5_div"></div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

        

     <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      
      function drawChart() {
    
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['상의', ${total}],
          ['아우터', ${total2}],
          ['바지', ${total3}],
          ['원피스/스커트', ${total4}]
        ]);

        // Set chart options
        var options = {'title':'전체 상품판매 현황',
                       'width':700,
                       'height':500};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
        
        
       
        
      }
      google.charts.load('current2', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart2);
      
      
      function drawChart2() {
    	    
          // Create the data table.
          var data2 = new google.visualization.DataTable();
          data2.addColumn('string', 'Topping');
          data2.addColumn('number', 'Slices');
          data2.addRows([
            ['긴팔티셔츠', ${scno1}],
       		['반팔티셔츠', ${scno2}],
            ['블라우스', ${scno3}],
            ['셔츠/남방', ${scno4}],
            ['맨투맨', ${scno5}],
            ['후드/니트', ${scno6}],
            ['스웨터', ${scno7}],
            ['슬리브리스(민소매)', ${scno8}] 
          ]);

          // Set chart options
          var options2 = {'title':'상의 상세 판매 현황',
                         'width':500,
                         'height':400};

          // Instantiate and draw our chart, passing in some options.
          var chart2 = new google.visualization.PieChart(document.getElementById('chart2_div'));
          chart2.draw(data2, options2);
          
          
         
          
        }
      
      google.charts.load('current3', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart3);
      
      
      function drawChart3() {
    	    
          // Create the data table.
          var data3 = new google.visualization.DataTable();
          data3.addColumn('string', 'Topping');
          data3.addColumn('number', 'Slices');
          data3.addRows([
            ['긴팔티셔츠', 3],
       		['반팔티셔츠', 4],
            ['블라우스', 5],
            ['셔츠/남방', 1],
            ['맨투맨', 2],
            ['후드/니트', 3],
            ['스웨터', 4]
          ]);

          // Set chart options
          var options3 = {'title':'상의 상세 판매 현황',
                         'width':500,
                         'height':400};

          // Instantiate and draw our chart, passing in some options.
          var chart3 = new google.visualization.PieChart(document.getElementById('chart3_div'));
          chart3.draw(data3, options3);
          
          
         
          
        }
      
      google.charts.load('current4', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart4);
      
      
      function drawChart4() {
    	    
          // Create the data table.
          var data4 = new google.visualization.DataTable();
          data4.addColumn('string', 'Topping');
          data4.addColumn('number', 'Slices');
          data4.addRows([
            ['긴팔티셔츠', 5],
       		['반팔티셔츠', 8],
            ['블라우스', 3],
            ['셔츠/남방', 2],
            ['맨투맨', 5],
            ['후드/니트', 4],
            ['스웨터', 3]
          ]);

          // Set chart options
          var options4 = {'title':'상의 상세 판매 현황',
                         'width':500,
                         'height':400};

          // Instantiate and draw our chart, passing in some options.
          var chart4 = new google.visualization.PieChart(document.getElementById('chart4_div'));
          chart4.draw(data4, options4);
          
          
         
          
        }
      
      google.charts.load('current5', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart5);
      
      
      function drawChart5() {
    	    
          // Create the data table.
          var data5 = new google.visualization.DataTable();
          data5.addColumn('string', 'Topping');
          data5.addColumn('number', 'Slices');
          data5.addRows([
            ['긴팔티셔츠', 3],
       		['반팔티셔츠', 4],
            ['블라우스', 6],
            ['셔츠/남방', 5],
            ['맨투맨', 2],
            ['후드/니트', 5]
          ]);

          // Set chart options
          var options5 = {'title':'상의 상세 판매 현황',
                         'width':500,
                         'height':400};

          // Instantiate and draw our chart, passing in some options.
          var chart5 = new google.visualization.PieChart(document.getElementById('chart5_div'));
          chart5.draw(data5, options5);
          
          
         
          
        }
      
     
     
      
      
      
    </script>



	
</body>
</html>