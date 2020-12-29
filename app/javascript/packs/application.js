// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@nathanvda/cocoon")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { clickBtn } from '../channels/form.js';
import { navbar } from '../channels/navbar.js';
import { chart } from '../channels/stats.js';

document.addEventListener('turbolinks:load', () => {
  // Button which simultaneously click on two buttons
  // clickBtn();
  
  // Sidebar toggle behavior function
  navbar();
  
  // Stats for Company (test js library for now)
  chart('company-quotes-stats');
  chart('company-bills-stats');

});
