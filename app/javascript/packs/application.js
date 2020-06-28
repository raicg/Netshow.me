require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require.context('../images', true)

require('bootstrap');
window.jQuery = window.$ = require("jquery")
window.Popper = require("popper.js")

import "@fortawesome/fontawesome-free/js/all";

import "video.js/dist/video.min";

import '../stylesheets/application'