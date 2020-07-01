// validations
const validator = {
  telephone: /^\d{10,13}$/,
  name: /^[a-z\d]{5,12}$/i,
  password: /^[\w@_-]{8,20}$/i,
  slug: /^[a-z\d-]{8,20}$/,
  email: /^([\w\.-]+)@([a-z\d-]+)\.([a-z]{2,8})(\.[a-z]{2,8})?$/i,
};

const fields = document.querySelectorAll("input");

function validate(field, regex) {
  const { value } = field;
  if (regex.test(value)) {
    field.classList.add("form__input--valid");
    field.classList.remove("form__input--invalid");
  } else {
    field.classList.add("form__input--invalid");
    field.classList.remove("form__input--valid");
  }
}

fields.forEach((field) => {
  field.addEventListener("keyup", (e) => {
    const { name, value } = e.target;
    validate(e.target, validator[name]);
  });
});
