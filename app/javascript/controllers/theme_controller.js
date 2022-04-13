import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  toggle() {
    let html = document.documentElement;

    if (html.classList.contains('theme-light')) {
      html.classList.remove('theme-light');
      html.classList.add('theme-dark');
    } else if (html.classList.contains('theme-dark')) {
      html.classList.remove('theme-dark');
      html.classList.add('theme-light');
    }
  }
}
