
$(document).ready(function() {
    $('#calendarS6P').fullCalendar({
      header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
      },
      weekends: false,
      height : 750,
      width  : 300,

      eventColor: 'green',
      textColor: '#FFF',

      events: '/reservacions.json'
    });
});