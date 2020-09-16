const dom = require("./dom");
const storage = require("./storage");
const Project = require("./projects");
const Todo = require("./todo");

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
  dom.DOMManipulator.addProjectToSidebar(project);
});
// add sidebar event listener

// if user click project
// get project data by project name
// render project title, description, and all todos

// view detail project

// add project...

// edit project
