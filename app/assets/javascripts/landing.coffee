$(document).on 'ready page:load', ->

  $('#calendar').fullCalendar {
    events: api_events_path()
    dayClick: (date, jsEvent, view) ->
      API.onDayClicked(date, jsEvent, view)
    eventClick: (event, jsEvent, view) ->
      API.onEventClicked(event, jsEvent, view)
  }

API=
  onDayClicked: (date, jsEvent, view) ->
    $.ajax({
      type: 'get'
      url: new_event_path()
      data: { date: date.format() }
    })

  onEventClicked: (event, jsEvent, view) ->
    debugger
    console.log('clicked an event')
