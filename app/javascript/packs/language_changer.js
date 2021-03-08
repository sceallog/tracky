document.addEventListener('turbolinks:load', function() {
  let button_en = document.getElementById('lang_en');
  let button_ja = document.getElementById('lang_ja');

  function changeLanguage(button) {
    document.documentElement.setAttribute('lang', button.dataset.lang);
  };

  button_en.addEventListener('click', function() { changeLanguage(button_en) } );
  button_en.addEventListener('click', function() { window.location.reload(true) });
  button_ja.addEventListener('click', function() { changeLanguage(button_ja) } );
  button_ja.addEventListener('click', function() { window.location.reload(true) });
});
