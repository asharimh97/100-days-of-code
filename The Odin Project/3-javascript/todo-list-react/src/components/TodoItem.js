import React, { useState } from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { IoIosFlag } from "react-icons/io";
import { format } from "date-fns";
import theme from "./theme";

const Wrapper = styled.div`
  align-items: center;
  background: ${props =>
    props.completed ? theme.colors.shadedWhite : theme.colors.white};
  cursor: pointer;
  display: flex;
  justify-content: space-between;
  margin-bottom: 12px;
  padding: 4px;
  transition: all 0.2s ease;

  &:hover {
    background: ${theme.colors.shadedWhite};
  }

  &:last-child {
    margin: 0;
  }
`;

const TodoTitle = styled.p`
  color: ${theme.colors.black};
  margin-bottom: 4px;
  margin-top: 0;
`;

const TodoDate = styled.p`
  color: ${theme.colors.darkerGrey};
  font-size: 0.85em;
  margin: 0;
`;

const TodoBody = styled.div`
  align-items: flex-start;
  display: flex;
  width: 100%;

  ${TodoDate}, ${TodoTitle} {
    text-decoration: ${props => props.completed && "line-through"};
  }
`;

const TodoItem = ({ todo, onClick, onComplete }) => {
  const { title, date, priority, completed } = todo;

  const handleCompleteTodo = e => {
    console.log("Complete this todo", todo);
    onComplete(todo);
  };

  const PRIORITY_COLOR = {
    high: theme.colors.red,
    medium: theme.colors.orange,
    low: theme.colors.green
  };
  return (
    <Wrapper completed={completed}>
      <TodoBody completed={completed}>
        <input
          type="checkbox"
          onChange={handleCompleteTodo}
          style={{ marginRight: "16px" }}
          checked={completed}
        />
        <div onClick={onClick} style={{ width: "100%" }}>
          <TodoTitle>{title}</TodoTitle>
          <TodoDate>{format(new Date(date), "d MMMM yyyy")}</TodoDate>
        </div>
      </TodoBody>
      <IoIosFlag fill={PRIORITY_COLOR[priority] || theme.colors.softerGrey} />
    </Wrapper>
  );
};

TodoItem.propTypes = {
  todo: PropTypes.object,
  onClick: PropTypes.func,
  onComplete: PropTypes.func
};

TodoItem.defaultProps = {
  todo: {
    title: "Sample title",
    date: new Date(),
    priority: ""
  },
  onClick: () => {},
  onComplete: () => {}
};

export default TodoItem;
