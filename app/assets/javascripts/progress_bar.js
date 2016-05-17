$(function () {
  var totalExpenses = 0;
  var expensesSeries = [];
  var totalBudget = parseFloat($('#trip-budget').html());

  function calculateTotal() {
    // grab all expense rows (tr)
    var expenseRows = document.querySelectorAll('.expense-row');
    // iterate over each expense
    expenseRows.forEach(function(row){
      // add the expense amount to the total
      totalExpenses += parseFloat($(row).data('expenseAmount'));
      // find the expense name
      var expenseName = $(row).data('expenseName');
      // add the expense object to the data series
      expensesSeries.push({
        name: $(row).data('expenseName'),
        data: [parseFloat($(row).data('expenseAmount'))]
      });
    })

    // // Checks for totalExpenses amount and the array of expenses
    // console.info('final calculateTotal', totalExpenses);
    // console.info(expensesSeries);
  }

  calculateTotal();

  //@todo: Figure out how to draw a marker along y-values for trip budget amount.
  var chartUpdateConfig = {
    // controls the total width of the graph
    yAxis: { 
      max: totalExpenses
    },
    // data fed into the graph
    series: expensesSeries
  };

  // these attributes shouldn't change when expense/trip values update
  var chartStaticConfig = {
      chart: {
          type: 'bar'
      },
      title: {
          text: ''
      },
      xAxis: {
          categories: ['Budget Breakdown']
      },
      yAxis: {
          min: 0,
          title: {
              text: 'Total Cost'
          },
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