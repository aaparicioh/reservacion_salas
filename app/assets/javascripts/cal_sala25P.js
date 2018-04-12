$(document).ready(function() {
    $('#calendar25P').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
      
        height : 750,
        width  : 300,
        weekends: false,

        eventColor: 'green',
        textColor: '#FFF',

        events: '/reservacions.json'
    });
});