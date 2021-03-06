$(document).on 'ready page:load', ->

  $('#calendar').fullCalendar {
    events: api_events_path()
    allDaySlot: true,
    header: {
        left: 'title',
        right: 'month,agendaWeek,agendaDay, today, prev,next'
    }
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
      data: { event: { date: date.format() } }
    })

  onEventClicked: (event, jsEvent, view) ->
    $.ajax({
      type: 'get'
      url: event_path({id: event.id})
      data: { event_position: { top: jsEvent.pageY, left: jsEvent.pageX - 300 }}
    })
