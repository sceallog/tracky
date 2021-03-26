// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap")
//require("./jquery.easing.min.js")
//require("./sb-admin-2")
require("./tablesort")
require("./tableclick")
require('noty')
require('chart.js')
require('./jquery.easy-autocomplete')
require('./search')

//import $ from 'jquery';

window.Noty = require('noty');
// var myChart = new Chart(ctx, {...});

// Stylesheets
// require("../../assets/stylesheets/application.scss")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
})
