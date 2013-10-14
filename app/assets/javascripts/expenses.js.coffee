
$ ->

  formattedDate = (date) ->
    dd = date.getDate()
    mm = date.getMonth()+1
    yyyy = date.getFullYear()
    
    return "#{dd}/#{mm}/#{yyyy}" 


  today = new Date()
  console.log formattedDate(today)
  $('#expense_purchase_date').val(formattedDate(today))

  $('.purchase_date').datepicker(
    format: "dd/mm/yyyy"
    )
    .on('changeDate', (ev) ->
      newDate = ev.date
      console.log formattedDate(newDate)
      $('#expense_purchase_date').val(formattedDate(newDate))
    )

  $('#expense_merchant_id').select2(
    placeholder: "Merchant"
  )

  $('#expense_category_id').select2(
    placeholder: "Category"
  )



  # Chart

  $('#expenses_chart').highcharts({
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
    },
    title: {
        text: 'Expenses by category'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
      pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
              enabled: true,
              color: '#000000',
              connectorColor: '#000000',
              format: '<b>{point.name}</b>: {point.percentage:.1f} %'
          }
      }
    },
    series: [{
      type: 'pie',
      name: 'Category',
      data: gon.chart_data
    }]
  });
