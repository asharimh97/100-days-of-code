import React from "react";
import PropTypes from "prop-types";
import CardBook from "./CardBook";

const ListBook = ({ books }) => {
  return (
    <div data-test="list-book" className="py-16 grid grid-cols-4 gap-8">
      {books.map((book, idx) => (
        <CardBook key={idx} />
      ))}
    </div>
  );
};

ListBook.propTypes = {
  books: PropTypes.array
};

ListBook.defaultProps = {
  books: ["123", "123", "123"]
};

export default ListBook;
