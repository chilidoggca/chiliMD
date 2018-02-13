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


  $('.reviewable-date').on('click', event => {
    event.preventDefault();
    $(this).datepicker({
      // format: 'mm/dd/yyyy',
      //     closeText: "Close",
      //     dayNamesMin: ['Su','Mo','Tu','We','Th','Fr','Sa']
    });
  });

  // return fetch(
  //     `/reviewlists`,
  //     {
  //       method: 'PATCH',
  //       headers: {
  //         'Authorization': API_KEY,
  //         'Content-Type': 'application/json'
  //       },
  //       body: JSON.stringify(params)
  //     }
  //   )

  document.querySelectorAll('.reviewable-input-field').forEach(
    node => {
      node.addEventListener('focusout', e => {
        console.log(e.currentTarget.value);
        console.log(e);
      });
  });

});
