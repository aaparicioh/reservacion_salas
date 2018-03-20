
$(document).ready(function() {
    $('#calendarS6P').fullCalendar({

                        header:  {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
        height : 750,
        width  : 300,
        weekends : false,

        // events:"/reservacions/get_reservacion",
        //events: <%= @events.to_json.html_safe %>
    });
});