import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';

if (document.querySelector(".home-banner")) {
  initUpdateNavbarOnScroll();
} else {
  document.querySelector('.navbar-lewagon').classList.add('navbar-lewagon-white');
}

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import { initStarRating } from '../plugins/init_star_rating';
initStarRating();
