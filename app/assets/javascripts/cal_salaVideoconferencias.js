
$(document).ready(function() {
    $('#calendar').fullCalendar({
      header: 
      {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      
      height : 750,
      width  : 300,
      weekends : false,

      events: '/videoconferencia.json',

      eventColor: '#378006',
      textColor: '#f00'
    });
});