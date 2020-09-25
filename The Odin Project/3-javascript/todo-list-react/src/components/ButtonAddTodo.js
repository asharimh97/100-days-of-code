import React from "react";
import styled from "styled-components";
import { IoIosAdd } from "react-icons/io";

const Button = styled.button`
  align-items: center;
  background: var(--blue);
  border-radius: 50%;
  border: none;
  bottom: 0;
  box-shadow: 0 3px 32px 0 rgba(10, 31, 68, 0.1),
    0 0 1px 0 rgba(10, 31, 68, 0.08);
  color: var(--white);
  cursor: pointer;
  display: flex;
  font-size: 1.25em;
  height: 50px;
  justify-content: center;
  margin: 24px;
  position: fixed;
  right: 0;
  transition: all 0.3s ease-in-out;
  width: 50px;

  &:hover {
    transform: translateY(-15px);
  }
`;

const ButtonAddTodo = props => {
  return (
    <Button {...props}>
      <IoIosAdd />
    </Button>
  );
};

export default ButtonAddTodo;
