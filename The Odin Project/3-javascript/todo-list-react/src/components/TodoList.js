import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import theme from "./theme";
import TodoItem from "./TodoItem";

const Wrapper = styled.div`
  background: ${theme.colors.white};
  border-radius: 5px;
  box-shadow: 0 3px 32px 0 rgba(10, 31, 68, 0.1),
    0 0 1px 0 rgba(10, 31, 68, 0.08);
  padding: 24px;
`;

const TodoList = ({ children }) => {
  return (
    <Wrapper>
      <TodoItem />
      <TodoItem />
      <TodoItem />
    </Wrapper>
  );
};

export default TodoList;
