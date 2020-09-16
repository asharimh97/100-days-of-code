const projectStorage = "todoStorage";
const storage = {
  getAllProjects: () => {
    let projects = localStorage.getItem(projectStorage);
    projects = JSON.parse(projects);

    return projects;
  },
  saveAllProjects: projects => {
    localStorage.setItem(projectStorage, JSON.stringify(projects));
  },
  getDetailProject: title => {
    let project = localStorage.getItem(title);
    project = JSON.parse(project);

    return project;
  },
  saveProject: (title, data) => {
    const projectData = JSON.stringify(data);
    localStorage.setItem(title, projectData);
  }
};

module.exports = storage;
