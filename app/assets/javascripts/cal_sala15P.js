

$(document).ready(function() {
    $('#calendar').fullCalendar({
                        
                        header:  {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      weekends: false,
        height : 750,
        width  : 300,

         events:"/reservacions/get_reservacion",
      
    });
});