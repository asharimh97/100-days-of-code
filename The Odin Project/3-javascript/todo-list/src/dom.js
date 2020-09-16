const buttonAdd = document.querySelector(".button__todo--add");
const modalAdd = document.querySelector("#modal__todo--add");
const modalClosers = document.querySelectorAll(".modal__closer");

buttonAdd.addEventListener("click", () => {
  modalAdd.classList.add("modal--show");
});

modalClosers.forEach(closer => {
  closer.addEventListener("click", function () {
    const { target } = this.dataset;
    const modal = document.querySelector(`#${target}`);

    if (modal.classList.contains("modal--show")) {
      modal.classList.remove("modal--show");
    }
  });
});

const sidebar = document.querySelector("#sidebar__navs");

export const DOMManipulator = {
  // todo dom
  addTodoToPage: () => {},
  removeTodoFromPage: () => {},
  updateTodoToPage: () => {},

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
