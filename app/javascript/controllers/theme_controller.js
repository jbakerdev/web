import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  toggle() {
    let html = document.documentElement;
    let theme = null;

    if (html.classList.contains('theme-light')) {
      html.classList.remove('theme-light');
      html.classList.add('theme-dark');
      theme = "dark";
    } else if (html.classList.contains('theme-dark')) {
      html.classList.remove('theme-dark');
      html.classList.add('theme-light');
      theme = "light";
    }

    this.set_cookie(theme);
  }

  set_cookie(theme) {
    document.cookie = "user_theme=" + theme + "; path=/"
  }
}
