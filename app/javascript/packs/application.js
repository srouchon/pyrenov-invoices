//= require_tree .
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
