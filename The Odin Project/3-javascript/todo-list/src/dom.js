const { format } = require("date-fns");

const buttonAdd = document.querySelector(".button__todo--add");
const modalAdd = document.querySelector("#modal__todo--add");
const modalClosers = document.querySelectorAll(".modal__closer");
const buttonCancel = document.querySelectorAll(".button__modal--cancel");

buttonAdd.addEventListener("click", () => {
  modalAdd.classList.add("modal--show");
});

export function closeModal(modalTarget) {
  const target = modalTarget ? modalTarget : this.dataset.target;
  const modal = document.querySelector(`#${target}`);

  if (modal.classList.contains("modal--show")) {
    modal.classList.remove("modal--show");
  }
}

modalClosers.forEach(closer => {
  closer.addEventListener("click", closeModal);
});

buttonCancel.forEach(btn => {
  btn.addEventListener("click", closeModal);
});

const sidebar = document.querySelector("#sidebar__navs");
const list = document.querySelector("#todo-list");

export const DOMManipulator = {
  // todo dom
  addTodoToPage: todo => {
    const todoContent = `
      <div class="todo-item__body">
        <input
          type="checkbox"
          name=""
          id=""
          class="todo-item__checkbox"
        />
        <div class="todo-item__content">
          <p class="todo-item__title">${todo.title}</p>
          <p class="todo-item__date">${format(
            todo.dueDate,
            "EEEE, d MMM YYY"
          )}</p>
        </div>
      </div>
      <ion-icon name="flag" class="todo-item__flag ${
        todo.priority && `todo-item__flag--${todo.priority}`
      }"></ion-icon>
    `;

    const todoItem = document.createElement("div");
    todoItem.className = "todo-item";
    todoItem.innerHTML = todoContent;

    const checkbox = todoItem.querySelector("input");
    todoItem.addEventListener(
      "click",
      function (e) {
        if (e.target != checkbox) {
          // buka modal edit
          console.log(todo);
          return;
        }
      },
      true
    );
    checkbox.addEventListener("change", e => {
      e.cancelBubble = true;
      todoItem.classList.toggle("todo-item--complete");
      todo.setTodo({ ...todo, complete: !todo.complete });
      console.log("click checkbox");
    });

    list.appendChild(todoItem);
  },
  removeTodoFromPage: () => {},
  updateTodoToPage: () => {},
  resetTodoInPage: () => {
    list.innerHTML = "";
  },

  // sidebar project dom
  addProjectToSidebar: function (project) {
    let navContent = `
      <div class="nav-item">
        <ion-icon name="list-outline" class="nav-item__icon"></ion-icon>
        ${project}
      </div>
    `;

    const link = document.createElement("a");
    link.href = "#";
    link.className = "sidebar__nav";
    link.innerHTML = navContent;

    const _this = this;

    link.addEventListener("click", function () {
      _this.clearSidebarActive();
      this.classList.add("sidebar__nav--active");
    });

    sidebar.appendChild(link);
  },
  clearSidebarActive: () => {
    const navs = sidebar.querySelectorAll("a.sidebar__nav");
    navs.forEach(nav => {
      if (nav.classList.contains("sidebar__nav--active")) {
        nav.classList.remove("sidebar__nav--active");
      }
    });
  }
  // render sidebar projects
  // remove project from sidebar
  // add project to sidebar
};
