import React from "react";
import logo from "./logo.svg";
import "./assets/main.css";
import ListBook from "./components/ListBook";
// import "./App.css";

function App() {
  return (
    <>
      <header className="py-4 bg-gray-100">
        <div className="container mx-auto flex items-center justify-between">
          <a href="./index.html" className="flex items-center">
            <img src={logo} className="h-10" alt="logo" />
            <p className="text-base font-bold uppercase">React Tailwind</p>
          </a>
          <nav className="flex items-center">
            <a href="#" className="mr-4">
              Menu 1
            </a>
            <a href="#" className="mr-4">
              Menu 2
            </a>
            <a href="#">Menu 3</a>
          </nav>
        </div>
      </header>
      <main className="container mx-auto">
        <ListBook />
      </main>
    </>
  );
}

export default App;
