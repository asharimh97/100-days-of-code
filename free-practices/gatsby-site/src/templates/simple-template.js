import React from "react";

const SimpleTemplate = ({ pageContext: { data } }) => {
  const { title, description } = data;

  return (
    <div>
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
};

export default SimpleTemplate;
