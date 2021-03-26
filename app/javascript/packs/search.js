document.addEventListener('turbolinks:load', function() {
  $input = $("[data-behaviour='autocomplete']")

  var options = {
    getValue: 'name',
    url: function(phrase) {
      return '/search.json?q=' + phrase;
    },
    categories: [
      {
        listLocation: 'projects',
        header: '<strong>'+document.getElementById('q').dataset.header1+'</strong>',
      },
      {
        listLocation: 'tickets',
        header: '<strong>'+document.getElementById('q').dataset.header2+'</strong>',
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val('')
        Turbolinks.visit(url)
      },
      match: {
        enabled: true
      }
    } 
  }

  $input.easyAutocomplete(options)
});