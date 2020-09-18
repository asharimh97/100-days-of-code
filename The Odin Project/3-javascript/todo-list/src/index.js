const { DOMManipulator, closeModal } = require("./dom");
const storage = require("./storage");
const Project = require("./projects");
const Todo = require("./todo");

DOMManipulator.resetTodoInPage();

// first load storage
// if found storage, then ok
// else if no storage, init empty projects called "General"
let projects = storage.getAllProjects();
let todoProjects = [];
let currentProject;

if (!projects) {
  const defaultProject = {
    title: "General",
    description: "General todos"
  };
  projects = [defaultProject.title];

  storage.saveAllProjects(projects);
  storage.saveProject(currentProject.get().title, currentProject.get());
  todoProjects.push(currentProject);
}

// load all projects to sidebar
projects.forEach(project => {
  const projectDetail = storage.getDetailProject(project);
  const projectData = Project(
    projectDetail.title,
    projectDetail.description,
    projectDetail.todos
  );

  todoProjects.push(projectData);

  DOMManipulator.addProjectToSidebar(project);
});

// load default project data
(function loadInitProject() {
  let tempTodo = [];
  currentProject = todoProjects[0];
  DOMManipulator.renderProject(currentProject.get());
  currentProject.get().todos.forEach(todo => {
    const currentTodo = Todo({ ...todo, dueDate: new Date(todo.dueDate) });
    tempTodo.push(currentTodo);
    DOMManipulator.addTodoToPage(currentTodo);
  });
  currentProject.resetTodo(tempTodo);
  addTodoHandler();
})();

function loadProject(projectName) {
  const project = todoProjects.find(proj => proj.get().title === projectName);
  currentProject = project;

  // render title and project description
  DOMManipulator.renderProject(currentProject.get());

  // reset all todo
  DOMManipulator.resetTodoInPage();

  // add todo to page
  currentProject.get().todos.forEach(todo => {
    const currentTodo = Todo({ ...todo, dueDate: new Date(todo.dueDate) });
    DOMManipulator.addTodoToPage(currentTodo);
  });
}

function addTodoHandler() {
  const todosInput = document.querySelectorAll(".todo-item__checkbox");
  const todos = currentProject.get().todos;

  console.log(todos);

  todosInput.forEach(todo => {
    todo.addEventListener("change", () => {
      const { target } = todo.dataset;
      const currentTodo = todos.find(td => td.id == target);
      currentTodo.setComplete();
      currentProject.updateTodo(currentTodo.id, currentTodo.getInfo());
      updateSaveProject();
    });
  });
}

function updateSaveProject() {
  let project = currentProject.get();
  project = {
    ...project,
    todos: project.todos.map(todo => todo.getInfo())
  };

  storage.saveProject(project.title, project);
}

// add sidebar event listener
// if user click project
// get project data by project name
const sidenavs = document.querySelectorAll(".sidebar__nav");
// render project title, description, and all todos
sidenavs.forEach(nav => {
  nav.addEventListener("click", () => {
    const project = nav.dataset.target;
    // switch project
    if (project !== currentProject.get().title) loadProject(project);
  });
});

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

  currentProject.addTodo(todo);
  DOMManipulator.addTodoToPage(todo);

  form.reset();
  closeModal("modal__todo--add");
  updateSaveProject();
});

// edit project
