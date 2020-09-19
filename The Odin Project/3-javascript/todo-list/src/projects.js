const Project = (projectTitle, projectDescription, todo = null) => {
  let title = projectTitle;
  let description = projectDescription;
  let todos = todo || [];
  let slug = projectTitle.toLowerCase().split(" ").join("-");

  const getTitle = () => title;
  const getDescription = () => description;
  const getTodos = () => todos;
  const get = () => ({
    title,
    description,
    todos,
    slug
  });

  const addTodo = todo => {
    todos.push(todo);
  };

  const updateTodo = (todoId, newTodo) => {
    const todo = todos.find(todo => todo.id == todoId);
    todo.setTodo(newTodo);
  };

  const removeTodo = todoId => {
    const idx = todos.findIndex(todo => todo.id === todoId);
    todos.splice(idx, 1);
  };

  const resetTodo = (list = []) => {
    todos = list;
  };

  return {
    getTitle,
    getDescription,
    getTodos,
    addTodo,
    updateTodo,
    removeTodo,
    resetTodo,
    get
  };
};

module.exports = Project;
