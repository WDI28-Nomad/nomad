$(function () {
  var currentTotal = 0;
  var totalExpensesSeries = [];
  var totalBudget = parseFloat($('#trip-budget').html());


  function calculateTotal() {
    // grab all expense rows (tr)
    var expenseRows = document.querySelectorAll('.expense-row');
    
    expenseRows.forEach(function(row){
      currentTotal += parseFloat($(row).data('expenseAmount'));
      var expenseName = $(row).data('expenseName');
      totalExpensesSeries.push({
        name: $(row).data('expenseName'),
        data: [parseFloat($(row).data('expenseAmount'))]
      });
    })
    console.info('after calculateTotal', currentTotal);
    console.info(totalExpensesSeries);
  }
  calculateTotal();

  //@todo: Figure out how to draw a marker along y-values for totalBudget amt.
  var chartUpdateConfig = {
    yAxis: { // controls the total width of the graph
      max: currentTotal
    },
    series: totalExpensesSeries
  };

  var chartStaticConfig = {
      chart: {
          type: 'bar'
      },
      title: {
          text: 'Budget Breakdown'
      },
      xAxis: {
          categories: ['Budget Breakdown','Total Budget']
      },
      yAxis: {
          min: 0,
          title: {
              text: 'Total Cost'
          }
      },
      legend: {
          reversed: true
      },
      plotOptions: {
          series: {
              stacking: 'normal'
          }
      },
      credits: {
      enabled: false
      }
  };

  var finalConfig = _.extend({}, chartStaticConfig, chartUpdateConfig);
  
  function putChartOnPage (chartConfig){
    // put highcharts onto the DOM
    $('#budget-bar').highcharts(chartConfig);  
  }
  putChartOnPage(finalConfig);
  
});