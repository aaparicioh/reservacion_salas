
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
 
            <% for videoconferencia in @videoconferencias = Videoconferencia.all   -%>
              {
               id : '<%= videoconferencia.id.to_s %>',
               title  : '<%= videoconferencia.tituloActividad %>' ,
               start : '<%= videoconferencia.fechainicio.iso8601 %> + <%= videoconferencia.horainicio %>',
               end : '<%= videoconferencia.fechafin %> + <%= videoconferencia.horafin %>',
               allDay : false,
 
              },
 
            <% end %>           
 
              ]
    });
});