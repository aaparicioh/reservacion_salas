$(document).ready(function() {
    $('#calendarVideoconf').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      
      height : 750,
      width  : 300,
      weekends : false,
      fixedWeekCount: false,

      eventColor: 'green',
      textColor: '#FFF',

      events: '/videoconferencia.json'
    });
});