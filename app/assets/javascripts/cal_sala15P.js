

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

        events : [
        {
            title  : 'Reunión',
            start  : '2017-10-05'
        },
        {
            title  : 'Coloquio',
            start  : '2017-10-20',
            end    : '2017-10-30'
        },
        {
            title  : 'Mesa de trabajo',
            start  : '2017-10-17 12:30:00',
            allDay : false // will make the time show
        }
      ]
    });
});