
var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next,today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      weekends : false,
      
      events:[

              {
            title  : 'event1',
            start  : '2018-01-01'
        },
        {
            title  : 'event2',
            start  : '2018-01-05',
            end    : '2018-01-07'
        },
        {
            title  : 'event3',
            start  : '2018-01-09T12:30:00',
            allDay : false // will make the time show
        }
 

              ]

      select: function(start, end) {
        $.getScript('/reservacions/new', function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(reservacion, delta, revertFunc) {
        event_data = { 
          event: {
            title: reservacion.nevento,
            id: reservacion.id,
            start: reservacion.start.format(),
            end: reservacion.end.format()
          }
        };
        $.ajax({
            url: reservacion.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function(reservacion, jsReservacion, view) {
        $.getScript(reservacion.edit_url, function() {});
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);