const Todo = (todo = {}) => {
  let { title, description, dueDate, priority, complete = false } = todo;
  const id = todo.id || Math.floor(Math.random() * 1000);

  const setTodo = newTodo => {
    const {
      title: newTitle,
      description: desc,
      dueDate: newDate,
      priority: newPriority,
      complete: newComplete
    } = newTodo;

    title = newTitle;
    description = desc;
    dueDate = newDate;
    priority = newPriority;
    complete = newComplete;
  };

  const setComplete = () => {
    complete = !complete;
  };

  const getInfo = () => ({
    id,
    complete,
    description,
    dueDate,
    priority,
    title
  });

  return {
    id,
    complete,
    ...todo,
    setTodo,
    setComplete,
    getInfo
  };
};

module.exports = Todo;
