import React, { useState } from "react";
import "./App.css";

import Sidebar from "./components/Sidebar";
import ProjectHeading from "./components/ProjectHeading";
import Container from "./components/Container";
import TodoList from "./components/TodoList";

import AppContext from "./context/appContext";

function App() {
  const [projects, setProjects] = useState([]);
  const [currentProject, setCurrentProject] = useState(null);

  const contextInitialValue = {
    projects,
    currentProject,
    setProjects,
    setCurrentProject
  };

  return (
    <AppContext.Provider value={contextInitialValue}>
      <Sidebar />
      <Container>
        <ProjectHeading />
        <TodoList />
      </Container>
    </AppContext.Provider>
  );
}

export default App;
