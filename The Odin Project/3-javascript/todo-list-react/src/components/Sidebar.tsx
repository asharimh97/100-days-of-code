import React from "react";
import styled, { css } from "styled-components";

const Aside = styled.aside`
  background: #fff;
  height: 100vh;
  left: 0;
  padding: 16px;
  position: fixed;
  top: 0;
  width: 250px;
`;

const Brand = styled.h4`
  color: #333;
  font-size: 1.35em;
  text-align: center;
`;

const Sidenav = styled.a`
  color: #8e8e93;
  display: flex;
  font-size: 1em;
  font-weight: 500;
  margin-bottom: 4px;
  padding: 8px 0;
  text-decoration: none;
  transition: all 0.3s ease;

  &:hover {
    color: #333;
  }

  &:last-child {
    margin-bottom: none;
  }
`;

type Props = {
  title?: string;
};

const Sidebar: React.FC<Props> = props => {
  const navs = [
    { id: 1, slug: "lorem", title: "Lorem Ipsum" },
    { id: 2, slug: "ipsum", title: "Dolorsit Amet" },
    { id: 3, slug: "dolor", title: "Amet Nuenca" }
  ];
  return (
    <Aside>
      <a href="./index.html" style={{ textDecoration: "none" }}>
        <Brand>Todo List</Brand>
      </a>
      <>
        <input placeholder="Search project" />
      </>
      <h4>Projects</h4>
      {navs.map(nav => (
        <Sidenav key={nav.id} href="#" onClick={() => console.log(nav)}>
          {nav.title}
        </Sidenav>
      ))}
    </Aside>
  );
};

export default Sidebar;
