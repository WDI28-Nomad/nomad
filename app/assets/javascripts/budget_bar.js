$(function () {
    var totalExpenses = 0;
    var expensesSeries = [];
    var totalBudget = parseFloat($('#trip-budget').html());

    function calculateTotal() {
      // grab all expense rows (tr)
      var expenseRows = $('.expense-row');
      // iterate over each expense
      for (var i=0; i<expenseRows.length; i++) {
        // add the expense amount to the total
        totalExpenses += parseFloat($(expenseRows[i]).data('expenseAmount'));
        // find the expense name
        var expenseName = $(expenseRows[i]).data('expenseName');
        // add the expense object to the data series
        expensesSeries.push({
          name: $(expenseRows[i]).data('expenseName'),
          data: [parseFloat($(expenseRows[i]).data('expenseAmount'))]
        });
      }

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
            categories: ['Budget Breakdown'],
            labels: {
                enabled: false
            }
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