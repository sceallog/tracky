const ready = function () {
  $(document.body).on("click", "tr[data-href]", function () {
    window.location.href = this.dataset.href;
  })
}

$(document).ready(ready);
$(document).on('turbolinks:load', ready);