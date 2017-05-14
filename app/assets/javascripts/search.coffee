# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search-button').on 'click', (e) ->
    e.preventDefault()
    clean_search()
    search_location()

#search location using API service
search_location = () ->
  location_id = $('#location-id').val() || 0
  $.ajax
    url: "/api/location_status/"+location_id+".json"
    type: "GET"
    beforeSend: ->
      # Loading
      $('#search-button').button('loading')
    complete: ->
      # Loading
      $('#search-button').button('reset')
      $('.results').removeClass('hide')
    error: ->
      $('#location-not-found').removeClass('hide')
    success: (response) ->
      if response.location_status == 'close'
        $('#location-closed').removeClass('hide')
        # Add Message to alert
        $('#close').html("The location "+response.location_name+" is CLOSE right now")
      else if response.location_status == 'open'
        $('#location-opened').removeClass('hide')
        # Add Message to alert
        $('#open').html("The location "+response.location_name+" is OPEN right now")
      else
        #error
        $('#location-not-found').removeClass('hide')

# Clean Alerts
clean_search = () ->
  $('#location-not-found').addClass('hide')
  $('#location-closed').addClass('hide')
  $('#location-opened').addClass('hide')
  $('.results').addClass('hide')
