const form = document.querySelector("#form-register");
const { email, name, zipcode, password, password_confirmation } = form;

email.addEventListener("input", function () {
  if (this.validity.typeMismatch) {
    email.setCustomValidity("Hmm, I think this email is incorrect");
  } else {
    email.setCustomValidity("");
  }
});

zipcode.addEventListener("input", function (e) {
  if (this.validity.patternMismatch) {
    this.setCustomValidity("Woy, Zipcode yang bener dong");
  } else {
    this.setCustomValidity("");
  }
});

password.addEventListener("input", function (e) {
  if (this.validity.patternMismatch) {
    this.setCustomValidity(
      "Password must be 8 chars length with uppercase, lowercase, and number"
    );
  } else {
    this.setCustomValidity("");
  }
});

password_confirmation.addEventListener("input", function (e) {
  if (this.validity.patternMismatch) {
    this.setCustomValidity(
      "Password must be 8 chars length with uppercase, lowercase, and number"
    );
  } else if (this.value !== password.value) {
    this.setCustomValidity("Password doesn't match");
  } else {
    this.setCustomValidity("");
  }
});
