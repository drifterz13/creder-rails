import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="drawer"
export default class extends Controller {
  static targets = ["checkbox"];

  connect() {
    this.close();
  }

  open = () => {
    this.checkboxTarget.checked = true;
  };

  close = () => {
    this.checkboxTarget.checked = false;
  };
}
