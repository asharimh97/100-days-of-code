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
  const { currentProject, todos, setTodos } = useContext(AppContext);
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

    const projectTodos = todos[currentProject.id];
    setTodos({ ...todos, [currentProject.id]: [].concat(projectTodos, todo) });
    showAddTodo(false);
  };

  const handleEditTodo = val => {
    console.log(val);
  };

  const handleCompleteTodo = todo => {
    const newTodo = {
      ...todo,
      completed: !todo.completed
    };

    const currentTodos = todos[currentProject.id];
    const idx = currentTodos.findIndex(td => td.id === todo.id);
    currentTodos.splice(idx, 1, newTodo);

    setTodos({ ...todos, [currentProject.id]: currentTodos });
  };

  const currentTodos = todos[currentProject?.id] || [];

  return (
    <div>
      {currentTodos?.length > 0 ? (
        <Wrapper>
          {todos[currentProject.id].map(todo => (
            <TodoItem
              data-test="todo-item"
              key={todo.id}
              todo={todo}
              onClick={showDetailTodo}
              onComplete={handleCompleteTodo}
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
