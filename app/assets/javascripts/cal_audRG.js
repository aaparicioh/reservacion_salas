


$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: '<6vGGUvxW7D9RGL1YoVog_RZ7>',
        header: { 
                                        left: 'prev,next,today',
                                        center: 'title',     
                                        right: 'month,agendaWeek,agendaDay'
                                    }, 
        weekends: false, 
        events: {
            googleCalendarId: 'keogms5sp1mfkkjlt3ntb3qo48@group.calendar.google.com'
        }

    });
});