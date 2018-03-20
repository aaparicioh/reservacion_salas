$(document).ready(function() {
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
      
        height : 750,
        width  : 300,
        weekends: false,

        //events:[
        //{
        //  title  : 'Cumpleaños',
        //  start  : '2018-03-15'
        //}
        //]

        //events:'/index.json'
        events: <%= @events.to_json.html_safe %>
    });
});