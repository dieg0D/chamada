# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#att_lists-datatable').dataTable
    processing: true
    serverSide: true
    ajax: $('#att_lists-datatable').data('source')
    pagingType: 'simple_numbers'
    columns: [
      {data: 'data'}
      {data: 'type'}
    ]