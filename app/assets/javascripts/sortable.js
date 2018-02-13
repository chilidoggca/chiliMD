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

  function changeDate() {
    return fetch(
      `/reviewlists/${this.currentTarget.value}`,
      {
        method: 'PATCH',
        headers: {
          // 'Authorization': API_KEY,
          'Content-Type': 'application/json'
        },
        body: {
          'id': this.currentTarget.value,
          'start_date': this.currentTarget.value
        }
      }
    )
  }

  document.querySelectorAll('.reviewable-input-field').forEach(
    node => {
      node.addEventListener('focusout', e => {
        const id = e.target.dataset.reviewlistId;
        const startDate = new Date(e.currentTarget.value);
        // console.log(e.currentTarget.value);
        // console.log(e);
        // console.log(startDate);
        $.ajax({
          url: `/reviewlists/${id}`,
          type: "PATCH",
          data: JSON.stringify({
            'id': id,
            'start_date': startDate
          }),
          error: function(e) {
            console.log(e);
          },
          dataType: "json",
          contentType: 'application/json'
        });
        // return fetch(
        //   `/reviewlists/${id}`,
        //   {
        //     method: 'PATCH',
        //     headers: {
        //       // 'Authorization': API_KEY,
        //       'Content-Type': 'application/json'
        //     },
        //     body: {
        //       // 'id': id,
        //       'reviewlist': {
        //         'id': id,
        //         'start_date': startDate
        //       }
        //     }
        //   }
        // )
      });
  });

});
