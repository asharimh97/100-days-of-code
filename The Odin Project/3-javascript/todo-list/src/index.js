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

  DOMManipulator.addProjectToSidebar(project, loadProject);
});

// load default project data
(function loadInitProject() {
  loadProject(projects[0]);
})();

function loadProject(projectName) {
  let tempTodo = [];
  const project = todoProjects.find(proj => proj.get().title === projectName);
  currentProject = project;

  // render title and project description
  DOMManipulator.renderProject(currentProject.get());

  // reset all todo
  DOMManipulator.resetTodoInPage();

  // add todo to page
  currentProject.get().todos.forEach(todo => {
    const currentTodo = Todo({ ...todo, dueDate: new Date(todo.dueDate) });
    tempTodo.push(currentTodo);
    DOMManipulator.addTodoToPage(currentTodo, handleChangeTodo);
  });

  currentProject.resetTodo(tempTodo);
}

function handleChangeTodo(target) {
  const todos = currentProject.get().todos;

  const currentTodo = todos.find(td => td.id == target);

  currentTodo.setComplete();

  currentProject.updateTodo(currentTodo.id, currentTodo.getInfo());
  updateSaveProject();
}

function updateSaveProject() {
  let project = currentProject.get();
  project = {
    ...project,
    todos: project.todos.map(todo => todo.getInfo())
  };

  storage.saveProject(project.title, project);
}

// reset all todos first

// view detail project

// add project...
const inputAddProject = document.querySelector("#input__add-project");
inputAddProject.addEventListener("submit", function (e) {
  const { name } = this;
  e.preventDefault();

  // create project
  const project = Project(name.value, "Another todo project description");
  todoProjects.push(project);
  projects.push(name.value);

  // save project
  storage.saveAllProjects(projects);
  storage.saveProject(project.get().title, project.get());

  // add project to sidebar
  DOMManipulator.addProjectToSidebar(project.get().title, loadProject);

  // reset form
  this.reset();
});

// add todo
// form
const form = document.querySelector("#form__todo");

form.addEventListener("submit", e => {
  e.preventDefault();
  let data = new FormData(form);
  data = Object.fromEntries(data);
  data.dueDate = new Date(data.date);
  const todo = Todo(data);

  currentProject.addTodo(todo);
  DOMManipulator.addTodoToPage(todo, handleChangeTodo);

  form.reset();
  closeModal("modal__todo--add");
  updateSaveProject();
});

// edit project
