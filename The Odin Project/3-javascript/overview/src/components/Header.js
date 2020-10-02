import React from "react";
import logo from "../logo.svg";

const Header = () => {
  return (
    <header data-test="app-header" className="bg-gray-100 p-6">
      <div className="container mx-auto flex justify-between">
        <a data-test="navbar-brand" href="#" className="flex items-center">
          <img data-test="logo" src={logo} className="w-16 mr-2" />
          <p className="text-base font-semibold">Overview</p>
        </a>
      </div>
    </header>
  );
};

export default Header;
