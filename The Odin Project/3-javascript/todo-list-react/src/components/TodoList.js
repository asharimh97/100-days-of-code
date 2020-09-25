import React, { useContext, useState } from "react";
import styled from "styled-components";
import theme from "./theme";
import TodoItem from "./TodoItem";
import AppContext from "../context/appContext";
import ButtonAddTodo from "./ButtonAddTodo";
import ModalTodo from "./ModalTodo";
import { generateId } from "../helper/helper";

const Wrapper = styled.div`
  background: ${theme.colors.white};
  border-radius: 5px;
  box-shadow: 0 3px 32px 0 rgba(10, 31, 68, 0.1),
    0 0 1px 0 rgba(10, 31, 68, 0.08);
  padding: 24px;
`;

const TodoList = () => {
  const { currentProject, projects, setCurrentProject } = useContext(
    AppContext
  );
  const [addTodo, showAddTodo] = useState(false);

  const showDetailTodo = () => {
    console.log("Todo");
  };

  const handleAddTodo = async val => {
    const todo = {
      id: generateId(),
      ...val,
      completed: false
    };

    await setCurrentProject({
      ...currentProject,
      todos: [].concat(currentProject.todos, todo)
    });
    console.log(currentProject, projects);
    showAddTodo(false);
  };

  const handleEditTodo = val => {
    console.log(val);
  };

  return (
    <div>
      {currentProject?.todos?.length > 0 ? (
        <Wrapper>
          {currentProject.todos.map(todo => (
            <TodoItem
              data-test="todo-item"
              key={todo.id}
              todo={todo}
              onClick={showDetailTodo}
            />
          ))}
        </Wrapper>
      ) : (
        <div />
      )}
      {currentProject && (
        <>
          <ButtonAddTodo onClick={() => showAddTodo(true)} />
          <ModalTodo
            title="Add Todo"
            visible={addTodo}
            onSubmit={handleAddTodo}
            onCancel={() => showAddTodo(false)}
          />
        </>
      )}
    </div>
  );
};

export default TodoList;
