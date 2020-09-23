import React from "react";
import styled from "styled-components";
import theme from "./theme";
import { IoIosList } from "react-icons/io";

const Aside = styled.aside`
  background: ${props => props.theme.colors.white};
  height: 100%;
  left: 0;
  padding: 16px;
  position: fixed;
  top: 0;
  width: 250px;
`;

const Brand = styled.h2`
  font-size: 1.3em;
  text-align: center;
`;

const Input = styled.input`
  background: ${theme.colors.shadedWhite};
  border: solid 1px ${theme.colors.softerGrey};
  border-radius: 4px;
  color: ${theme.colors.black};
  margin-bottom: 16px;
  padding: 8px;
  width: 100%;

  &::placeholder {
    color: ${theme.colors.darkerGrey};
  }
`;

const Sidenav = styled.a`
  align-items: center;
  color: ${props => theme.colors[props.active ? "black" : "darkerGrey"]};
  display: flex;
  padding: 8px 0;
  text-decoration: none;
  transition: all 0.3s ease;

  &:hover {
    color: ${theme.colors.black};
  }

  svg {
    margin-right: 8px;
  }
`;

const Sidebar = () => {
  return (
    <Aside data-test="sidebar-component">
      <Brand>Todo List</Brand>
      <Input placeholder="Add Project" />
      <h3 style={{ marginTop: "0px" }}>Projects</h3>
      <Sidenav href="#">
        <IoIosList />
        Lorem ipsum
      </Sidenav>
      <Sidenav href="#">Lorem ipsum</Sidenav>
      <Sidenav href="#">Lorem ipsum</Sidenav>
      <Sidenav href="#">Lorem ipsum</Sidenav>
    </Aside>
  );
};

export default Sidebar;
