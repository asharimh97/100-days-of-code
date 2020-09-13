export const Todo = todo => {
  let { title, description, dueDate, priority } = todo;
  const id = Math.floor(Math.random() * 1000);

  const setTodo = newTodo => {
    const {
      title: newTitle,
      description: desc,
      dueDate: newDate,
      priority: newPriority
    } = newTodo;

    title = newTitle;
    description = desc;
    dueDate = newDate;
    priority = newPriority;
  };

  return {
    id,
    ...todo,
    setTodo
  };
};
