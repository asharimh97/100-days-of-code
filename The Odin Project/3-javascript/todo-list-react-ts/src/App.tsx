import React from "react";
import styled from "styled-components";
import logo from "./logo.svg";
import "./App.css";

import Sidebar from "./components/Sidebar";
import ProjectHeading from "./components/ProjectHeading";

const Main = styled.main`
  margin-left: 250px;
  padding: 32px;
  width: calc(100vw - 250px);
`;

function App() {
  return (
    <>
      <Sidebar title={"lorem ipsum"} />
      <Main>
        <ProjectHeading
          title={"General"}
          description={"Lorem Ipsum dolorsit amet nunc puerta"}
        />
      </Main>
    </>
  );
}

export default App;
