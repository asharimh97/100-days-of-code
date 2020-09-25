import React, { useContext } from "react";
import styled, { withTheme } from "styled-components";
import theme from "./theme";
import AppContext from "../context/appContext";

const Heading = styled.h1`
  font-size: 2em;
  margin-top: 8px;
  margin-bottom: 16px;
`;

const Description = styled.p`
  color: ${theme.colors.softerBlack};
  font-size: 0.9em;
  line-height: 175%;
  margin-bottom: 32px;
`;

const ProjectHeading = () => {
  const { currentProject } = useContext(AppContext);
  return (
    <>
      <Heading data-test="project-title">
        {currentProject?.name || "Select Todo Project"}
      </Heading>
      <Description>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus
        malesuada tellus, dictum porta magna posuere nec. Nulla et porta ipsum.
      </Description>
    </>
  );
};

export default withTheme(ProjectHeading);
