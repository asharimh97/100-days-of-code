import React, { Component } from "react";
import uniqid from "uniqid";

import logo from "./logo.svg";
import "./assets/main.css";
import Header from "./components/Header";
import Input from "./components/Input";
import Overview from "./components/Overview";

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      tasks: []
    };
  }

  handleSubmit = val => {
    const task = {
      id: uniqid(),
      task: val
    };
    const tasks = [].concat(this.state.tasks, task);
    this.setState({ tasks });
  };

  handleDeleteTask = task => {
    const idx = this.state.tasks.indexOf(task);

    if (idx >= 0) {
      const tasks = this.state.tasks;
      tasks.splice(idx, 1);

      this.setState({ tasks });
    }
  };

  render() {
    return (
      <>
        <Header />
        <div className="container mx-auto">
          <Input onSubmit={this.handleSubmit} />
          <Overview tasks={this.state.tasks} onDelete={this.handleDeleteTask} />
        </div>
      </>
    );
  }
}

export default App;
