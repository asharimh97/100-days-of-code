import React from "react";
import logo from "./logo.svg";
import "./App.css";

import Sidebar from "./components/Sidebar";
import ProjectHeading from "./components/ProjectHeading";
import Container from "./components/Container";

function App() {
  return (
    <>
      <Sidebar />
      <Container>
        <ProjectHeading />
      </Container>
    </>
  );
}

export default App;
