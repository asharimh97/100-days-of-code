const Todo = (todo = {}) => {
  let { title, description, dueDate, priority } = todo;
  const id = Math.floor(Math.random() * 1000);
  let complete = false;

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

  return {
    id,
    complete,
    ...todo,
    setTodo,
    setComplete
  };
};

// const t = Todo({
//   title: "asd",
//   description: "asd",
//   dueDate: new Date(),
//   priority: ""
// });

// console.log(t);

// t.setComplete();

// console.log(t);

module.exports = Todo;
