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
          type: 'bar',
          name: $(expenseRows[i]).data('expenseName'),
          data: [parseFloat($(expenseRows[i]).data('expenseAmount'))]
        });

      }

      // // Checks for totalExpenses amount and the array of expenses
      // console.info('final calculateTotal', totalExpenses);
      // console.info(expensesSeries);
    }

    calculateTotal();

    var totalBudgetSeries = {
        type: 'bar',
        name: 'Total Budget',
        data: [0, totalBudget],
        color: '#FF0000',
        marker: {
          symbol: 'square',
        }

    }

    expensesSeries.push(totalBudgetSeries);

    var chartDataConfig = {
        series: expensesSeries
    }


    // these attributes shouldn't change when expense/trip values update
    var chartStaticConfig = {
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
            max: totalExpenses,
            title: {
                text: ''
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

    var finalConfig = _.extend({}, chartStaticConfig, chartDataConfig);

    function putChartOnPage (chartConfig){
      // put highcharts onto the DOM
      $('#budget-bar').highcharts(chartConfig);  
    }
    putChartOnPage(finalConfig);
    
  });