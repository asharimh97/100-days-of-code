export const Projects = (projectTitle, projectDescription) => {
  let title = projectTitle;
  let description = projectDescription;
  let todos = [];

  const getTitle = () => title;
  const getDescription = () => description;
  const getTodos = () => todos;

  const addTodo = todo => {
    todos.push(todo);
  };

  const updateTodo = (todoId, newTodo) => {
    const todo = todos.find(todo => todo.id === todoId);
    todo.setTodo(newTodo);
  };

  const removeTodo = todoId => {
    const idx = todos.findIndex(todo => todo.id === todoId);
    todos.splice(idx, 1);
  };

  return {
    getTitle,
    getDescription,
    getTodos,
    addTodo,
    updateTodo,
    removeTodo
  };
};
