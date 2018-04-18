$(document).ready(function() {
    $('#calendarPos').fullCalendar({
      header: 
      {
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

      events: '/reservacions.json',

      eventRender: function(event, element) {
        element.qtip({
          content: event.description
        });
      }
    });
});