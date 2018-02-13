document.addEventListener("DOMContentLoaded", function() {
  $('#reviewcalendar').fullCalendar({
    // events: '/events.json',
    allDayDefault: true,
    defaultView: 'month',
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'agendaDay,agendaWeek,month',
      },
  });
  $('#showreviewcalendar .btn-primary').on('click', ()=> {
    $('#reviewcalendar').toggleClass('hidecalendar');
    $('#reviewcalendar').fullCalendar('render');
  });
});
