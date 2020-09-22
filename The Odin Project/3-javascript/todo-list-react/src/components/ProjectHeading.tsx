import React from "react";
import styled from "styled-components";

const Heading = styled.h1`
  margin: 0 0 16px;
`;

const Subheading = styled.p`
  color: #8e8e93;
  font-size: 0.9em;
`;

type Props = {
  title: string;
  description: string;
};

const ProjectHeading: React.FC<Props> = ({ title, description }) => {
  return (
    <>
      <Heading>{title}</Heading>
      <Subheading>{description}</Subheading>
    </>
  );
};

export default ProjectHeading;
