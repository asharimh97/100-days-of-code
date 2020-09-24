import React, { useEffect } from "react";
import styled, { withTheme } from "styled-components";
import theme from "./theme";

const Heading = styled.h1`
  margin-top: 0;
  margin-bottom: 24px;
`;

const Description = styled.p`
  color: ${theme.colors.softerBlack};
  margin-bottom: 32px;
`;

const ProjectHeading = ({ title, description, ...props }) => {
  useEffect(() => {
    console.log("Current theme: " + props.theme);
  });

  return (
    <>
      <Heading data-test="project-title">{title}</Heading>
      <Description>{description}</Description>
    </>
  );
};

ProjectHeading.defaultProps = {
  title: "Sample Title",
  description: `Lorem ipsum dolor sit amet, 
  consectetur adipiscing elit, sed do eiusmod tempor 
  incididunt ut labore et dolore magna aliqua.`
};

export default withTheme(ProjectHeading);
