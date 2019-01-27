# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#att_lists-datatable').dataTable
    processing: true
    serverSide: true
    ajax: 
      url: $('#att_lists-datatable').data('source')
      type: 'POST'
    pagingType: 'simple_numbers'
    rowReorder: true
    columnDefs: [
      { orderable: true, className: 'reorder', targets: [0, 1] },
      { orderable: false, targets: '_all' }
    ]
    columns: [
      {data: 'data'}
      {data: 'type'}
      {data: 'show'}
      {data: 'edit'}
      {data: 'remove'}
    ]