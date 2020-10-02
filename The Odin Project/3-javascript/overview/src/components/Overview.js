import React from "react";
import { IoIosCreate, IoIosTrash } from "react-icons/io";

const Overview = ({ tasks, onDelete }) => {
  return (
    <div className="w-64 mx-auto pt-4">
      <h1 className="text-large font-bold text-gray-700 mb-2">
        Tasks should be done
      </h1>
      <ol className="list-disc ml-4">
        {tasks.map(task => (
          <li key={task.id} className="flex justify-between items-center mb-1">
            <p>{task.task}</p>
            <div className="flex">
              <button
                data-test="button-delete"
                className="button bg-red-700 text-white rounded p-1"
                onClick={() => onDelete(task)}
              >
                <IoIosTrash style={{ fontSize: "12px" }} />
              </button>
            </div>
          </li>
        ))}
      </ol>
    </div>
  );
};

Overview.defaultProps = {
  tasks: [],
  onDelete: () => {}
};

export default Overview;
