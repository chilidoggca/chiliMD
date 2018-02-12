document.addEventListener('DOMContentLoaded', function() {
  $('.chosen-select').chosen({
    // width: '500px',
    // allow_single_deselect: true,
    // no_results_text: 'No results matched',
    // create_option: true,
    // persistent_create_option decides if you can add any term, even if part
    // of the term is also found, or only unique, not overlapping terms
    // persistent_create_option: true,
    // with the skip_no_results option you can disable the 'No results match..'
    // message, which is somewhat redundant when option adding is enabled
    // skip_no_results: true,

    // copy and pasted following from online.
  //   evt.preventDefault();
  //   if (this.results_showing) {
  //  if (!this.is_multiple || this.result_highlight) {
  //    return this.result_select(evt);
  //  }
  //  $(this.form_field).append('<option>' + $(evt.target).val() + '</option>');
  //  $(this.form_field).trigger('chosen:updated');
  //  this.result_highlight = this.search_results.find('li.active-result').lasteturn this.result_select(evt);
  // }
  // break;
  });
});
