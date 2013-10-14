
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
