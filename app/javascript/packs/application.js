import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';

if (document.querySelector(".home-banner")) {
  initUpdateNavbarOnScroll();
} else {
  document.querySelector('.navbar-lewagon').classList.add('navbar-lewagon-white')
}
