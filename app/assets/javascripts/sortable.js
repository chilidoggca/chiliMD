document.addEventListener("DOMContentLoaded", function() {
  $("#reviewlists-sortable").sortable({
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
});
