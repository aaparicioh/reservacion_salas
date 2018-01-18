
$(document).ready(function() {
    $('#calendar').fullCalendar({
                       
                        header:  {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
        height : 750,
        width  : 300,
        weekends : false,

         events:[
 
            <% for reservacion in @reservacions = Reservacion.all   -%>
              {
               id : '<%= reservacion.id.to_s %>',
               title  : '<%= reservacion.nevento %>' ,
               start : '<%= reservacion.fechainicio.iso8601 %> + <%= reservacion.horainicio %>',
               end : '<%= reservacion.fechafin %> + <%= reservacion.horafin %>',
               allDay : false,
 
              },
 
            <% end %>           
 
              ]
    });
});