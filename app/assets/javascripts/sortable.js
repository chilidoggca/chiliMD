document.addEventListener("DOMContentLoaded", function() {
  $("#reviewlists-sortable").sortable({
    placeholder: "ui-state-highlight",
    update: function(e, ui) {
      // console.log($(this).sortable('serialize'));
      // console.log($(this).data("url"));
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });
  $(".fa-calendar.sortable-start").on('click', event => {
    event.preventDefault();
  });

  // $(".fa-calendar.sortable-start").datepicker({
  //     dateFormat: 'mm\/dd\/yy',
  //     closeText: "Close",
  //     dayNamesMin: ['Su','Mo','Tu','We','Th','Fr','Sa']
  // }); //DatePickers

});
