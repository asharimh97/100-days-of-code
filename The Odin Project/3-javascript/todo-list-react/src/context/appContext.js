import { createContext } from "react";

/**
 * Projects will contains data :
 * {
 *    id: "",
 *    name: "",
 *    slug: "",
 *    todos: [
 *      { id, title, description, dueDate, completed, priority }
 *    ]
 * }
 */
const AppContext = createContext({
  projects: [],
  currentProject: null,
  setProjects: () => {},
  setCurrentProject: () => {}
});

export default AppContext;
