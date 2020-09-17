const { DOMManipulator, closeModal } = require("./dom");
const storage = require("./storage");
const Project = require("./projects");
const Todo = require("./todo");

DOMManipulator.resetTodoInPage();

// first load storage
// if found storage, then ok
// else if no storage, init empty projects called "General"
let projects = storage.getAllProjects();

if (!projects) {
  const defaultProject = "General";
  projects = [defaultProject];
  storage.saveAllProjects(projects);
}

// load all projects to sidebar
projects.forEach(project => {
  DOMManipulator.addProjectToSidebar(project);
});
// add sidebar event listener

// if user click project
// get project data by project name
// render project title, description, and all todos
// reset all todos first

// view detail project

// add project...
// form
const form = document.querySelector("#form__todo");

form.addEventListener("submit", e => {
  e.preventDefault();
  let data = new FormData(form);
  data = Object.fromEntries(data);
  data.dueDate = new Date(data.date);
  const todo = Todo(data);

  DOMManipulator.addTodoToPage(todo);

  form.reset();
  closeModal("modal__todo--add");
});

// edit project
