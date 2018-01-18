
var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      weekends : false,
      
      events:[
 
            <% for reservacion in @reservacions = Reservacion.all   -%>
              {
               id : '<%= reservacion.id.to_s %>',
               title  : '<%= reservacion.nevento %>' ,
               start : '<%= reservacion.fechainicio.iso8601 %>',
               end : '<%= reservacion.fechafin %>',
               allDay : false,
              
 
              },
 
            <% end %>           
 
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