document.addEventListener('DOMContentLoaded', function() {
  $('.chosen-select').chosen({
    // width: '500px',
    // allow_single_deselect: true,
    // no_results_text: 'No results matched',
    create_option: true,
    // persistent_create_option decides if you can add any term, even if part
    // of the term is also found, or only unique, not overlapping terms
    persistent_create_option: true,
    // with the skip_no_results option you can disable the 'No results match..'
    // message, which is somewhat redundant when option adding is enabled
    skip_no_results: true
  })
});
