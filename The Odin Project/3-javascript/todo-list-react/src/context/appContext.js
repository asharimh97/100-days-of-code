import { createContext } from "react";

const appContext = createContext({
  projects: [],
  todos: {}
});

export default appContext;
