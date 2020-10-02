import React, { useState } from "react";

const Input = ({ onSubmit }) => {
  const [task, setTask] = useState("");

  const handleSubmit = e => {
    e.preventDefault();
    onSubmit(task);
    setTask("");
  };

  const handleChangeInput = e => {
    setTask(e.target.value);
  };

  return (
    <div className="w-64 mx-auto py-6">
      <h1 className="text-xl font-bold mb-3">Tasks todo, guys: </h1>
      <form onSubmit={handleSubmit}>
        <input
          data-test="input-task"
          type="text"
          value={task}
          onChange={handleChangeInput}
          className="bg-gray-200 px-4 py-2 border-1 border-gray-200 rounded w-full"
          placeholder="Input new task here"
        />
      </form>
    </div>
  );
};

Input.defaultProps = {
  onSubmit: () => {}
};

export default Input;
