import React from "react";
import logo from "./logo.svg";
import "./App.css";

import Sidebar from "./components/Sidebar";
import ProjectHeading from "./components/ProjectHeading";
import Container from "./components/Container";
import TodoList from "./components/TodoList";
import ModalTodo from "./components/ModalTodo";

function App() {
  return (
    <>
      <Sidebar />
      <Container>
        <ProjectHeading />
        <TodoList />
      </Container>
      <ModalTodo />
    </>
  );
}

export default App;
