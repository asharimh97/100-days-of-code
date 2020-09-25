import { createContext } from "react";

/**
 * Projects will contains data :
 * {
 *    id: "",
 *    name: "",
 *    slug: "",
 * }
 *
 * Todos will contain data: {
 *  "project-slug": [
 *    { id, title, description, dueDate, completed, priority }
 *  ]
 * }
 */
const AppContext = createContext({
  projects: [],
  currentProject: null,
  todos: {},
  setProjects: () => {},
  setCurrentProject: () => {},
  setTodos: () => {}
});

export default AppContext;
