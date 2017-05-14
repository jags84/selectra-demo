# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('#schedule_edit')
    fill_shedule()

fill_shedule = () ->
  $('select').each ->
    if $(this).attr('data-open-hour')
      $(this).val($(this).attr('data-open-hour'))
    else
      $(this).val($(this).attr('data-close-hour'))
    return
