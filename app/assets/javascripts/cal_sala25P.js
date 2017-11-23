
$(document).ready(function() {
    $('#calendar').fullCalendar({

                        header:  {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
        height : 750,
        width  : 300,
        weekends: false,

        events : [
        {
            title  : 'Encuentro',
            start  : '2017-11-09'
        },
        {
            title  : 'Mesa redonda',
            start  : '2017-10-05',
            end    : '2017-10-07'
        },
        {
            title  : 'Jornada',
            start  : '2017-10-09 12:30:00',
            allDay : false // will make the time show
        }
      ]
    });
});