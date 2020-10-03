import React from "react";
import { Link } from "gatsby";

export default function Home() {
  return (
    <div>
      Hello world!
      <p>
        <Link to="/about">About</Link>
      </p>
    </div>
  );
}
